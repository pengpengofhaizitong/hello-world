//
//  TZCompressionResource.m
//  PhotoKitDemo
//
//  Created by haizitong6 on 16/6/3.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "TZCompressionResource.h"
#import <AssetsLibrary/AssetsLibrary.h>

@implementation TZCompressionResource


+ (void)getVideoFromPHAsset:(id)asset Complete:(void (^)(NSData * ,NSString *))result{
    
    
    if ([asset isKindOfClass:[PHAsset class]]) {
        
        PHAsset *phAsset = (PHAsset *)asset;
        
        NSArray *assetResources = [PHAssetResource assetResourcesForAsset:phAsset];
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
        
        if (phAsset.mediaType == PHAssetMediaTypeVideo || phAsset.mediaSubtypes == PHAssetMediaSubtypePhotoLive) {
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
        

    }else if ([asset isKindOfClass:[ALAsset class]]){
        
        ALAsset *alAsset = (ALAsset *)asset;
        ALAssetsLibrary *library = [[ALAssetsLibrary alloc]init];
        [library enumerateGroupsWithTypes:ALAssetsGroupAlbum usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
            [group setAssetsFilter:[ALAssetsFilter allVideos]];
            if (group.numberOfAssets > 0)
            {
                NSIndexSet *videoSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, group.numberOfAssets)];
                [group enumerateAssetsAtIndexes:videoSet options:0 usingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
                    ALAssetRepresentation *representation = [alAsset defaultRepresentation];
                    NSString *savingPath = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@",representation.filename];
                    [[NSFileManager defaultManager]createFileAtPath:savingPath contents:nil attributes:nil];
                    NSFileHandle *writingHandle = [NSFileHandle fileHandleForWritingAtPath:savingPath];
                    int bufferSize = 1024;
                    uint8_t buffer[bufferSize];
                    unsigned long long read = 0,length = 0;
                    //                NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
                    int n = 0;
                    for (;read < representation.size;)
                    {
                        if (n % 10 == 0)
                        {
                            //                        pool = nil;
                            //                        pool = [[NSAutoreleasePool alloc]init];
                        }
                        length = [representation getBytes:buffer fromOffset:read length:bufferSize error:nil];
                        read += length;
                        NSData *fileData = [NSData dataWithBytes:(const void *)buffer length:(NSUInteger)length];
                        [writingHandle writeData:fileData];
                        n++;
                    }
                    [writingHandle closeFile];
                    //                [pool drain];
                }];
            }
        } failureBlock:^(NSError *error) {
            
        }];
        
    }
    
//        ALAssetRepresentation *rep = [asset defaultRepresentation];
//        Byte *buffer = (Byte*)malloc(rep.size);
//        NSUInteger buffered = [rep getBytes:buffer fromOffset:0.0 length:rep.size error:nil];
//        NSData *data = [NSData dataWithBytesNoCopy:buffer length:buffered freeWhenDone:YES];//this is NSData may be what you want
    
    
}





@end
