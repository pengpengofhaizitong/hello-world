//
//  TestViewController.m
//  SetUIDemo
//
//  Created by haizitong6 on 16/6/23.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "TestViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface TestViewController ()
{
    NSDictionary *info;
}
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)test{
    
    
    
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    [library assetForURL:[info objectForKey:UIImagePickerControllerReferenceURL]
             resultBlock:^(ALAsset *asset) {
                 ALAssetRepresentation *image_representation = [asset defaultRepresentation];
                 // create a buffer to hold image data
                 uint8_t *buffer = (Byte*)malloc(image_representation.size);
                 NSUInteger length = [image_representation getBytes:buffer fromOffset: 0.0  length:image_representation.size error:nil];
                 
                 if (length != 0)  {
                     
                     // buffer -> NSData object; free buffer afterwards
                     NSData *adata = [[NSData alloc] initWithBytesNoCopy:buffer length:image_representation.size freeWhenDone:YES];
                     
                     // identify image type (jpeg, png, RAW file, ...) using UTI hint
                     NSDictionary* sourceOptionsDict = [NSDictionary dictionaryWithObjectsAndKeys:(id)[image_representation UTI] ,kCGImageSourceTypeIdentifierHint,nil];
                     
                     // create CGImageSource with NSData
                     CGImageSourceRef sourceRef = CGImageSourceCreateWithData((__bridge CFDataRef) adata,  (__bridge CFDictionaryRef) sourceOptionsDict);
                     
                     // get imagePropertiesDictionary
                     CFDictionaryRef imagePropertiesDictionary;
                     imagePropertiesDictionary = CGImageSourceCopyPropertiesAtIndex(sourceRef,0, NULL);
                     
                     // get exif data
                     CFDictionaryRef exif = (CFDictionaryRef)CFDictionaryGetValue(imagePropertiesDictionary, kCGImagePropertyExifDictionary);
                     NSDictionary *exif_dict = (__bridge NSDictionary*)exif;
                     NSLog(@"exif_dict: %@",exif_dict);
                     
                     // save image WITH meta data
                     NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
                     NSURL *fileURL = nil;
                     CGImageRef imageRef = CGImageSourceCreateImageAtIndex(sourceRef, 0, imagePropertiesDictionary);
                     
                     if (![[sourceOptionsDict objectForKey:@"kCGImageSourceTypeIdentifierHint"] isEqualToString:@"public.tiff"])
                     {
                         fileURL = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@.%@",
                                                           documentsDirectory,
                                                           @"myimage",
                                                           [[[sourceOptionsDict objectForKey:@"kCGImageSourceTypeIdentifierHint"] componentsSeparatedByString:@"."] objectAtIndex:1]
                                                           ]];
                         
                         CGImageDestinationRef dr = CGImageDestinationCreateWithURL ((__bridge CFURLRef)fileURL,
                                                                                     (__bridge CFStringRef)[sourceOptionsDict objectForKey:@"kCGImageSourceTypeIdentifierHint"],
                                                                                     1,
                                                                                     NULL
                                                                                     );
                         CGImageDestinationAddImage(dr, imageRef, imagePropertiesDictionary);
                         CGImageDestinationFinalize(dr);
                         CFRelease(dr);
                     }
                     else
                     {
                         NSLog(@"no valid kCGImageSourceTypeIdentifierHint found …");
                     }
                     
                     // clean up
                     CFRelease(imageRef);
                     CFRelease(imagePropertiesDictionary);
                     CFRelease(sourceRef);
                 }
                 else {
                     NSLog(@"image_representation buffer length == 0");
                 }
             }
            failureBlock:^(NSError *error) {
                NSLog(@"couldn't get asset: %@", error);
            }
     ];
    
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
