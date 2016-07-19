//
//  PlayerView.m
//  AvPlayer
//
//  Created by MS on 15-4-3.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "PlayerView.h"

@implementation PlayerView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


+(Class)layerClass
{
    return [AVPlayerLayer class];

}

-(void)setPlayer:(AVPlayer *)player
{
    //取出layer
    AVPlayerLayer *layer = (AVPlayerLayer *)self.layer;
    
    //关联播放器
    [layer setPlayer:player];
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
