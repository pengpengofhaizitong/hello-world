//
//  ViewController.m
//  SetUIDemo
//
//  Created by haizitong6 on 16/6/6.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "ViewController.h"
#import "InformManagementViewController.h"
#import "NotificaionManageViewController.h"

@interface ViewController ()<UIAlertViewDelegate,UITextViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    UIView *vvv = [[UIView alloc] initWithFrame:CGRectMake(30, 490, 200, 30)];
    vvv.backgroundColor = [UIColor blackColor];
    [self.view addSubview:vvv];
    

    CAGradientLayer *layer = [CAGradientLayer new];
    layer.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor redColor].CGColor];
    layer.frame = CGRectMake(0, 0, 50, 30);
    [vvv.layer addSublayer:layer];
    
    
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableAttributedString *string =[[NSMutableAttributedString alloc]initWithString:@"nihao8888"];
    [string addAttribute:NSKernAttributeName value:@10 range:NSMakeRange(0, 5)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, 320, 40)];
    label.backgroundColor = [UIColor orangeColor];
    label.attributedText = string;
    [self.view addSubview:label];
    
    UILabel *viwe = [[UILabel alloc] initWithFrame:CGRectMake(0, 110, 10, 40)];
    viwe.backgroundColor = [UIColor redColor];
    viwe.text = @"nihao";
    [viwe sizeToFit];
    [self.view addSubview:viwe];
    
    [viwe setFrame:CGRectMake(0, 110, viwe.frame.size.width+50, 40)];
    
//    NSMutableParagraphStyle *ps = [[NSMutableParagraphStyle alloc] init];
//    [ps setAlignment:NSTextAlignmentCenter];
//    NSDictionary *attribs = @{NSFontAttributeName: [UIFont fontWithName:@"Microsoft Yahei" size:45],NSParagraphStyleAttributeName:ps};
//    NSMutableAttributedString *attributedText =[[NSMutableAttributedString alloc] initWithString:super.text
//                                                                                      attributes:attribs];
//    super.attributedText = attributedText;
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    
    self.image.image = [[UIImage alloc] initWithContentsOfFile:@"assets-library://asset/asset.JPG?id=9822593C-A1FE-414B-A848-839F3F3914A4&ext=JPG"];
    
    
}

-(void)keyboardWillShow:(NSNotification *)notification {
//    [self createAlertView];
}
-(void)keyboardWillHide:(NSNotification *)notification {

}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    
    
    
}


- (void)createAlertView {
    UIAlertView *_alertView = [[UIAlertView alloc] initWithTitle:nil message:@"确定发表评论吗?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [_alertView show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
//    [_textview resignFirstResponder];
}

- (IBAction)takePhotoClick:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        NSArray *temp_MediaTypes = [UIImagePickerController availableMediaTypesForSourceType:picker.sourceType];
        picker.mediaTypes = temp_MediaTypes;
        picker.delegate = self;
//        picker.allowsImageEditing = YES;
        // 设置录制视频的质量
        [picker setVideoQuality:UIImagePickerControllerQualityTypeHigh];
        //设置最长摄像时间
        [picker setVideoMaximumDuration:30.f];
    }
//    [self presentModalViewController:picker animated:YES];
    [self presentViewController:picker animated:YES completion:^{
    }];
}

- ( void )imagePickerController:( UIImagePickerController *)picker didFinishPickingMediaWithInfo:( NSDictionary *)info{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
    NSLog(@"info - %@",info);
    NSString *mediaType = info[@"UIImagePickerControllerMediaType"];
    if ([mediaType isEqualToString:@"public.image"]) {  //判断是否为图片
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        //通过判断picker的sourceType，如果是拍照则保存到相册去
        if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
            UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        }
    }else if([mediaType isEqualToString:@"public.movie"]){// 视频
        NSString *pathUrl = [NSString stringWithFormat:@"%@",[info objectForKey:@"UIImagePickerControllerMediaURL"]];
        NSString *path = [pathUrl substringFromIndex:7];
        UISaveVideoAtPathToSavedPhotosAlbum(path, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    }
}

//此方法就在UIImageWriteToSavedPhotosAlbum的上方
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    NSLog(@"已保存");
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}




- (IBAction)intoNextVC:(UIButton *)sender {
    
//    InformManagementViewController *informVC = [[InformManagementViewController alloc] init];
//    [self.navigationController pushViewController:informVC animated:YES];

//    NotificaionManageViewController *notVC = [[NotificaionManageViewController alloc] init];
//    [self.navigationController pushViewController:notVC animated:YES];
    
    UIAlertController *actionSheetController = [UIAlertController alertControllerWithTitle:@"action选项"
                                                                                   message:nil
                                                                            preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action0 = [UIAlertAction actionWithTitle:@"选项一"
                                                      style:UIAlertActionStyleDefault
                                                    handler:^(UIAlertAction * action) {
                                                        
                                                    }];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"选项二"
                                                     style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * action) {
                                                       
                                                   }];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"选项三"
                                                      style:UIAlertActionStyleDefault
                                                    handler:^(UIAlertAction * action) {
                                                        
                                                    }];
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"取消"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * action) {}];
    [actionSheetController addAction:action0];
    [actionSheetController addAction:action];
    [actionSheetController addAction:action1];
    [actionSheetController addAction:actionCancel];
    [actionSheetController.view setTintColor:[UIColor greenColor]];
    [self presentViewController:actionSheetController animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
