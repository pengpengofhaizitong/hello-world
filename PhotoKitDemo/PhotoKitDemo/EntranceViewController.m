//
//  EntranceViewController.m
//  PhotoKitDemo
//
//  Created by haizitong6 on 16/6/1.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "EntranceViewController.h"
#import "TZImagePickerController.h"
#import "TZImageManager.h"
#import "TZAssetModel.h"
#import <AssetsLibrary/AssetsLibrary.h>


@interface EntranceViewController ()<TZImagePickerControllerDelegate>
{
    __weak IBOutlet UIImageView *image;
    
    NSMutableArray *thumbnailImageArr;
    NSMutableArray *originalImageArr;
    
}
@end

@implementation EntranceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"this viewController is EntranceViewController");
    
    
    
}

#pragma mark --- 图片单选 ---
- (IBAction)SelectSinglePicture:(UIButton *)sender {
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
//    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray *photos, NSArray *assets) {
//        
//        NSLog(@"photos == %@",photos);
//        
//        
//    }];
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}


#pragma mark --- 图片多选 ---
- (IBAction)SelectMorePicture:(UIButton *)sender {


    
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:self];
    imagePickerVc.selectType = SelectResourcePhoto;
    
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
//    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray *photos, NSArray *assets) {
//        
//        NSLog(@"photos == %@",photos);
////        image.image = [photos objectAtIndex:0];
//        
//    }];
    [self presentViewController:imagePickerVc animated:YES completion:nil];
    
}


#pragma mark --- 视频 ---
- (IBAction)SelectViedo:(UIButton *)sender {
    
    
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:self];
    imagePickerVc.allowPickingVideo = YES;
    imagePickerVc.selectType = SelectResourceVideo;
    [imagePickerVc setDidFinishPickingVideoHandle:^(UIImage *image, id asset) {

        NSLog(@"asset = %@",asset);

    }];
    
    [self presentViewController:imagePickerVc animated:YES completion:nil];
    
}


- (void)imagePickerControllerDidCancel:(TZImagePickerController *)picker
{
    NSLog(@"cancel");
}

- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets SelectImageArr:(NSArray *)selectImgArr
{
//    NSLog(@"photo = %@",photos);
    
    
    
    NSLog(@"SelectImageArr == %lu",(unsigned long)selectImgArr.count);
    
    
    for(int i=0;i<selectImgArr.count;i++)
    {
        @autoreleasepool {
            TZAssetModel *model = selectImgArr[i];
            [[TZImageManager manager] getPhotoWithAsset:model.asset completion:^(UIImage *photo, NSDictionary *info, BOOL isDegraded) {
                
                if (isDegraded)
                {
                    return;
//                    [thumbnailImageArr addObject:photo];
                }else
                {
                    NSData *imageData = UIImageJPEGRepresentation(photo, 0.5);
                    [self uploadImageToServer:imageData];
                }
                
                NSLog(@"photo =\n %@",photo);
            }];
        }
        
    }
    
    

    
}

- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets infos:(NSArray<NSDictionary *> *)infos SelectImageArr:(NSArray *)selectImgArr
{
    
}

- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingVideo:(UIImage *)coverImage sourceAssets:(id)asset
{
    NSLog(@"asset = %@",asset);
    
    [self getVideoFromPHAsset:asset Complete:^(NSData *data, NSString *string) {
        NSLog(@"pppppengpengpengpngepngpn = %@\n%ld",string,data.length);
    }];
    
    
    
}


#pragma mark 上传压缩图片
- (void)uploadImageToServer:(NSData *)imageData
{
    
    
    
}


- (void)getVideoFromPHAsset:(PHAsset *)asset Complete:(void (^)(NSData * ,NSString *))result{
    NSArray *assetResources = [PHAssetResource assetResourcesForAsset:asset];
    PHAssetResource *resource;
    
    for (PHAssetResource *assetRes in assetResources) {
        if (assetRes.type == PHAssetResourceTypePairedVideo ||
            assetRes.type == PHAssetResourceTypeVideo) {
            resource = assetRes;
        }
    }
    NSString *fileName = @"tempAssetVideo.mov";
    if (resource.originalFilename) {
        fileName = resource.originalFilename;
    }
    
    if (asset.mediaType == PHAssetMediaTypeVideo || asset.mediaSubtypes == PHAssetMediaSubtypePhotoLive) {
        PHVideoRequestOptions *options = [[PHVideoRequestOptions alloc] init];
        options.version = PHImageRequestOptionsVersionCurrent;
        options.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat;
        
        NSString *PATH_MOVIE_FILE = [NSTemporaryDirectory() stringByAppendingPathComponent:fileName];
        [[NSFileManager defaultManager] removeItemAtPath:PATH_MOVIE_FILE error:nil];
        [[PHAssetResourceManager defaultManager] writeDataForAssetResource:resource
                                                                    toFile:[NSURL fileURLWithPath:PATH_MOVIE_FILE]
                                                                   options:nil
                                                         completionHandler:^(NSError * _Nullable error) {
                                                             if (error) {
                                                                 result(nil, nil);
                                                             } else {
                                                                 
                                                                 NSData *data = [NSData dataWithContentsOfURL:[NSURL fileURLWithPath:PATH_MOVIE_FILE]];
                                                                 result(data, fileName);
                                                             }
                                                             [[NSFileManager defaultManager] removeItemAtPath:PATH_MOVIE_FILE  error:nil];
                                                         }];
    } else {
        result(nil, nil);
    }
    
    
//    ALAssetRepresentation *rep = [asset defaultRepresentation];
//    Byte *buffer = (Byte*)malloc(rep.size);
//    NSUInteger buffered = [rep getBytes:buffer fromOffset:0.0 length:rep.size error:nil];
//    NSData *data = [NSData dataWithBytesNoCopy:buffer length:buffered freeWhenDone:YES];//this is NSData may be what you want
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
