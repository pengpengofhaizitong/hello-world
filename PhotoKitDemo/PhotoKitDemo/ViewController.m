//
//  ViewController.m
//  PhotoKitDemo
//
//  Created by haizitong6 on 16/6/1.
//  Copyright © 2016年 haizitong6. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iamge;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _iamge.backgroundColor = [UIColor orangeColor];
    _iamge.image = [UIImage imageWithContentsOfFile:@"/Users/haizitong6/Library/Developer/CoreSimulator/Devices/9822593C-A1FE-414B-A848-839F3F3914A4/data/Media/DCIM/100APPLE/IMG_0030.JPG"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
