//
//  TZCompressionResource.h
//  PhotoKitDemo
//
//  Created by haizitong6 on 16/6/3.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>

@interface TZCompressionResource : NSObject

+(TZCompressionResource *)compressionResource;

- (void)getVideoFromPHAsset:(PHAsset *)asset Complete:(void (^)(NSData * ,NSString *))result;


@end
