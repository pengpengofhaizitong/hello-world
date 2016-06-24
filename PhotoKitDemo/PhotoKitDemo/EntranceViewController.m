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
#import "PlayerView.h"
#import "TZVideoPlayerController.h"

@interface EntranceViewController ()<TZImagePickerControllerDelegate>
{
    __weak IBOutlet UIImageView *image;
    __weak IBOutlet UIView *ImageBackGView;
  __block  NSMutableArray *thumbnailImageArr;
    NSMutableArray *selectPhoto;
    AVPlayer *_player;
    PlayerView *_playerV;
    
    id _asset;
}
@end

@implementation EntranceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    thumbnailImageArr = [NSMutableArray arrayWithCapacity:0];
    selectPhoto = [NSMutableArray arrayWithCapacity:0];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_player play];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [_player pause];
}

- (void)addImageView
{
    for(UIView *view in ImageBackGView.subviews){
        if([view isKindOfClass:[UIButton class]] || [view isKindOfClass:[UIImageView class]]){
            [view removeFromSuperview];
        }
    }
    CGFloat width = ImageBackGView.frame.size.width/4;
    CGFloat heigh = ImageBackGView.frame.size.height/3;
    for(int i=0;i<3;i++){
        for(int j=0;j<3;j++){
            if(thumbnailImageArr.count > i*3+j){
                UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(j*width, i*heigh, width-1, heigh-1)];
                [imageV setImage:[thumbnailImageArr objectAtIndex:j+i*3]];
                imageV.userInteractionEnabled = YES;
                [ImageBackGView addSubview:imageV];
                
                UIButton *imgBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, width-1, heigh-1)];
                imgBtn.tag = 1000+i*3+j;
                [imgBtn addTarget:self action:@selector(editorImage:) forControlEvents:UIControlEventTouchUpInside];
                [imageV addSubview:imgBtn];
            }
        }
    }
}

#pragma mark ---选择更多图片---
- (IBAction)selectMore:(UIButton *)sender {
    if(thumbnailImageArr.count < 9){
        TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9-thumbnailImageArr.count selectType:SelectResourcePhoto delegate:self];
        [self presentViewController:imagePickerVc animated:YES completion:nil];
    }
}

-(void)editorImage:(UIButton *)button {
    TZPhotoPreviewController *photoPreviewVc = [[TZPhotoPreviewController alloc] init];
    photoPreviewVc.photoArr = selectPhoto;
    photoPreviewVc.currentIndex = button.tag-1000;
    photoPreviewVc.isFrom_NOT_TZVC = YES;
    [self pushPhotoPrevireViewController:photoPreviewVc];
}

- (void)pushPhotoPrevireViewController:(TZPhotoPreviewController *)photoPreviewVc {
    photoPreviewVc.selectedPhotoArr = selectPhoto;
    __weak typeof(self) weakSelf = self;
    photoPreviewVc.returnNewSelectedPhotoArrBlock = ^(NSMutableArray *newSelectedPhotoArr,BOOL isSelectOriginalPhoto) {
        NSArray *selectArr = newSelectedPhotoArr;
        thumbnailImageArr = [NSMutableArray arrayWithCapacity:0];
        selectPhoto = [NSMutableArray arrayWithCapacity:0];
        [weakSelf refreshDataForImage:selectArr];
    };
    photoPreviewVc.okButtonClickBlock = ^(NSMutableArray *newSelectedPhotoArr,BOOL isSelectOriginalPhoto){
       
    };
    [self.navigationController pushViewController:photoPreviewVc animated:YES];
}


#pragma mark --- 图片多选 ---
- (IBAction)SelectMorePicture:(UIButton *)sender {
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 selectType:SelectResourcePhoto delegate:self];
    imagePickerVc.allowPickingVideo = NO;
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

- (void)imagePickerControllerDidCancel:(TZImagePickerController *)picker{
    NSLog(@"cancel");
}

- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets SelectImageArr:(NSArray *)selectImgArr{
    [self refreshDataForImage:selectImgArr];
}

- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets infos:(NSArray<NSDictionary *> *)infos SelectImageArr:(NSArray *)selectImgArr{
    
}

- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingVideo:(UIImage *)coverImage sourceAssets:(id)asset{
//    [TZCompressionResource getVideoFromPHAsset:asset Complete:^(NSData *data, NSString *string) {
//        NSLog(@"pppppengpengpengpngepngpn = %@\n%ld",string,data.length);
//    }];
    _playerV = [[PlayerView alloc] initWithFrame:ImageBackGView.bounds];
    _playerV.backgroundColor = [UIColor redColor];
    [ImageBackGView addSubview:_playerV];
    
    _asset = asset;
    
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGR:)];
    [ImageBackGView addGestureRecognizer:tapGR];
    
    
    [[TZImageManager manager] getVideoWithAsset:asset completion:^(AVPlayerItem *playerItem, NSDictionary *info) {
        _player = [[AVPlayer alloc] initWithPlayerItem:playerItem];
        [_playerV setPlayer:_player];
        [_player play];
    }];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerItemDidReachEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
}
#pragma makr 点击手势
-(void)tapGR:(UIPanGestureRecognizer *)panGR{
    
    TZAssetModel *model = [[TZAssetModel alloc] init];
    model.asset = _asset;
    TZVideoPlayerController *tzvideoPlayV = [[TZVideoPlayerController alloc] init];
    tzvideoPlayV.model = model;
    tzvideoPlayV.isRepeatBrowse = YES;
    tzvideoPlayV.returnIsRemoveSelectViedo = ^(BOOL isRmoveSelect){
        if(isRmoveSelect){
            [self removeSelectViedo];
        }
    };
    [self.navigationController pushViewController:tzvideoPlayV animated:YES];
}

- (void)removeSelectViedo{
    [_player replaceCurrentItemWithPlayerItem:nil];
    _player = nil;
    _asset = nil;

    [_playerV removeFromSuperview];
    _playerV = nil;
    
}

- (void)playerItemDidReachEnd:(NSNotification *)notification{
    CMTime currentTime = CMTimeMultiplyByFloat64(_player.currentTime, 0);
    [_player seekToTime:currentTime];
    [_player play];
}

- (void)refreshDataForImage:(NSArray *)selectImgArr{
    [selectPhoto addObjectsFromArray:selectImgArr];
    for(int i=0;i<selectImgArr.count;i++){
        @autoreleasepool {
            TZAssetModel *model = selectImgArr[i];
            //获取照片本身
            [[TZImageManager manager] getPhotoWithAsset:model.asset completion:^(UIImage *photo, NSDictionary *info, BOOL isDegraded) {
                if (isDegraded){
                    [thumbnailImageArr addObject:photo];
                }else{
                    NSData *imageData = UIImageJPEGRepresentation(photo, 0.5);
                    [self uploadImageToServer:imageData];
                }
            }];
        }
    }
    [self addImageView];
}



#pragma mark 上传压缩图片
- (void)uploadImageToServer:(NSData *)imageData{
    
    
}


- (IBAction)upLoadFile:(id)sender{
    
    

    
}


- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:AVPlayerItemDidPlayToEndTimeNotification object:nil];
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
