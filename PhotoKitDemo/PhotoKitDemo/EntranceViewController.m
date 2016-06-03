//
//  EntranceViewController.m
//  PhotoKitDemo
//
//  Created by haizitong6 on 16/6/1.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "EntranceViewController.h"
#import "TZHeader.h"
#import <AssetsLibrary/AssetsLibrary.h>


@interface EntranceViewController ()<TZImagePickerControllerDelegate>
{
    __weak IBOutlet UIImageView *image;
    __weak IBOutlet UIView *ImageBackGView;
    
    
    NSMutableArray *thumbnailImageArr;
    NSMutableArray *originalImageArr;
    NSMutableArray *selectPhoto;
    
}
@end

@implementation EntranceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"this viewController is EntranceViewController");
    
    thumbnailImageArr = [NSMutableArray arrayWithCapacity:0];
    originalImageArr = [NSMutableArray arrayWithCapacity:0];
    selectPhoto = [NSMutableArray arrayWithCapacity:0];
    
}

- (void)addImageView
{
    for(UIView *view in ImageBackGView.subviews)
    {
        if([view isKindOfClass:[UIButton class]])
        {
            [view removeFromSuperview];
        }
    }
    
    CGFloat width = ImageBackGView.frame.size.width/3;
    CGFloat heigh = ImageBackGView.frame.size.height/3;
    
//    ImageBackGView.backgroundColor = [UIColor orangeColor];
    
    for(int i=0;i<3;i++)
    {
        for(int j=0;j<3;j++)
        {
            if(thumbnailImageArr.count > i*3+j)
            {
                UIButton *imgBtn = [[UIButton alloc] initWithFrame:CGRectMake(j*width, i*heigh, width, heigh)];
                [imgBtn setImage:[thumbnailImageArr objectAtIndex:j+i*3] forState:UIControlStateNormal];
                imgBtn.tag = 1000+i*3+j;
                [imgBtn addTarget:self action:@selector(editorImage:) forControlEvents:UIControlEventTouchUpInside];
                [ImageBackGView addSubview:imgBtn];
            }
        }
    }
    
    
}

-(void)editorImage:(UIButton *)button
{
//    TZAssetModel *model = _selectedPhotoArr[i];
    
    TZPhotoPreviewController *photoPreviewVc = [[TZPhotoPreviewController alloc] init];
    photoPreviewVc.photoArr = selectPhoto;
    photoPreviewVc.currentIndex = button.tag-1000;
    photoPreviewVc.isFrom_NOT_TZVC = YES;
    [self pushPhotoPrevireViewController:photoPreviewVc];
    
}

- (void)pushPhotoPrevireViewController:(TZPhotoPreviewController *)photoPreviewVc {
//    photoPreviewVc.isSelectOriginalPhoto = _isSelectOriginalPhoto;
    photoPreviewVc.selectedPhotoArr = selectPhoto;
    
    photoPreviewVc.returnNewSelectedPhotoArrBlock = ^(NSMutableArray *newSelectedPhotoArr,BOOL isSelectOriginalPhoto) {
        
        NSLog(@"newSelectedPhotoArr.count = %@",newSelectedPhotoArr);
        
//        selectPhoto = [NSMutableArray arrayWithCapacity:0];
//        [selectPhoto addObjectsFromArray:newSelectedPhotoArr];
        
        NSArray *selectArr = newSelectedPhotoArr;
        NSLog(@"selectArr === %@",selectArr);
        [self refreshDataForImage:selectArr];
        
    };
    photoPreviewVc.okButtonClickBlock = ^(NSMutableArray *newSelectedPhotoArr,BOOL isSelectOriginalPhoto){
       
        
    };
    [self.navigationController pushViewController:photoPreviewVc animated:YES];
}



#pragma mark --- 图片单选 ---
- (IBAction)SelectSinglePicture:(UIButton *)sender {
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 selectType:SelectResourcePhoto delegate:self];
    
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


    
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 selectType:SelectResourcePhoto delegate:self];
    
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
    
    
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9  selectType:SelectResourceVideo delegate:self];
    imagePickerVc.allowPickingVideo = YES;
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
    
    [self refreshDataForImage:selectImgArr];
    
}

- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets infos:(NSArray<NSDictionary *> *)infos SelectImageArr:(NSArray *)selectImgArr
{
    
}

- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingVideo:(UIImage *)coverImage sourceAssets:(id)asset
{
    NSLog(@"asset = %@",asset);
    
    [[TZCompressionResource compressionResource] getVideoFromPHAsset:asset Complete:^(NSData *data, NSString *string) {
        NSLog(@"pppppengpengpengpngepngpn = %@\n%ld",string,data.length);
    }];
    
    
    
}



- (void)refreshDataForImage:(NSArray *)selectImgArr
{
    NSLog(@"111selectPhoto = %@\n%@",selectPhoto,selectImgArr);
    
    [selectPhoto removeAllObjects];
    [thumbnailImageArr removeAllObjects];
    [originalImageArr removeAllObjects];
    [selectPhoto addObjectsFromArray:selectImgArr];
    
    NSLog(@"selectPhoto = %@\n%@",selectPhoto,selectImgArr);
    
    for(int i=0;i<selectImgArr.count;i++)
    {
        @autoreleasepool {
            TZAssetModel *model = selectImgArr[i];
            [[TZImageManager manager] getPhotoWithAsset:model.asset completion:^(UIImage *photo, NSDictionary *info, BOOL isDegraded) {
                
                if (isDegraded)
                {
                    //                    return;
                    [thumbnailImageArr addObject:photo];
                }else
                {
                    NSData *imageData = UIImageJPEGRepresentation(photo, 0.5);
                    [self uploadImageToServer:imageData];
                }
                
                NSLog(@"photo =\n %@",photo);
            }];
        }
        
    }
    
    [self addImageView];

}


#pragma mark 上传压缩图片
- (void)uploadImageToServer:(NSData *)imageData
{
    
    
    
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
