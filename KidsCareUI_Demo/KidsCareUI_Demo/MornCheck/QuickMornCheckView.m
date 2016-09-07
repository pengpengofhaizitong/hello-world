//
//  QuickMornCheckView.m
//  demo
//
//  Created by haizitong6 on 16/8/31.
//  Copyright © 2016年 w jf. All rights reserved.
//

#import "QuickMornCheckView.h"
#import "MorningCheckHandleView.h"
#import <POP/POP.h>

#define screenWidth [UIScreen mainScreen].bounds.size.width
#define screenHeight [UIScreen mainScreen].bounds.size.height

#define ANIMATIONTIME 0.0001f
#define REMOVETIME 0.2f
#define FRAMETIME 0.5f
#define VIEWWIDTH (screenWidth - 60)
#define VIEWHEIGHT (screenWidth - 30)

@interface QuickMornCheckView()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *handleLessHeight;

//缓存视图
@property (strong, nonatomic) NSMutableArray *viewArray;
@property (assign, nonatomic) BOOL isFromLeft;
@property (assign, nonatomic) CGPoint beganPoint;

@property (weak, nonatomic) IBOutlet UIView *handleView;
@property (weak, nonatomic) IBOutlet UIImageView *ignoreImageV;
@property (weak, nonatomic) IBOutlet UIImageView *nextImageV;
@property (weak, nonatomic) IBOutlet UIView *determineView;

@end

@implementation QuickMornCheckView

- (void)adjustView{
    
    MorningCheckHandleView *view = [self.viewArray lastObject];
    [view removeFromSuperview];
    [self initSingeViewFromBack:YES];
    [self changeViewFrameForward:YES];
    [self.viewArray removeLastObject];
}

- (void)setViewFrame:(CGRect)rect isShowDetermineBtn:(BOOL)show viewAssignment:(NSDictionary *)dic{
    [self setFrame:rect];
    [self initView:rect];
    if(show){
        self.determineView.hidden = NO;
    }
}

- (NSMutableArray *)viewArray {
    if (_viewArray == nil) {
        _viewArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _viewArray;
}

/**
 *  初始化多个视图
 */
- (void)initView:(CGRect)rect{
    __weak typeof(self)weakSelf = self;
    for (int i = 0; i<3; i++) {
        MorningCheckHandleView *view = [[[NSBundle mainBundle] loadNibNamed:@"MorningCheckHandleView" owner:self options:nil] lastObject];
        view.frame = CGRectMake(0, 0, VIEWWIDTH+i*15, VIEWHEIGHT);
        view.center = CGPointMake(rect.size.width/2, (rect.size.height+self.handleLessHeight.constant)/2-i*10);
        view.backgroundColor = [self randomColor];
        view.clickBlock = ^(int type){
            NSLog(@"type = %d",type);
            if(weakSelf.clickBlock){
                weakSelf.clickBlock(type);
            }
        };
        [self.handleView addSubview:view];
        [self.viewArray addObject:view];
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(viewPanHandle:)];
        [view addGestureRecognizer:panGesture];
    }
}

/**
 *  初始化一个视图
 */
- (void)initSingeViewFromBack:(BOOL)isFromBack{
    if (isFromBack) {
        MorningCheckHandleView *view = [[[NSBundle mainBundle] loadNibNamed:@"MorningCheckHandleView" owner:self options:nil] lastObject];
        view.frame = CGRectMake(0, 0, VIEWWIDTH, VIEWHEIGHT);
        view.center = self.handleView.center;
        view.backgroundColor = [self randomColor];
        __weak typeof(self)weakSelf = self;
        view.clickBlock = ^(int type){
            NSLog(@"type = %d",type);
            if(weakSelf.clickBlock){
                weakSelf.clickBlock(type);
            }
        };
        [self.handleView addSubview:view];
        [self.handleView insertSubview:view belowSubview:(UIView*)[self.viewArray firstObject]];
        [self.viewArray insertObject:view atIndex:0];
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(viewPanHandle:)];
        [view addGestureRecognizer:panGesture];
    }else{
        MorningCheckHandleView *view = [[[NSBundle mainBundle] loadNibNamed:@"MorningCheckHandleView" owner:self options:nil] lastObject];
        view.frame = CGRectMake(0, 0, VIEWWIDTH+(self.viewArray.count - 1) *15, VIEWHEIGHT);
        view.center = CGPointMake(self.isFromLeft?0:self.handleView.bounds.size.width, self.beganPoint.y);
        view.backgroundColor = [self randomColor];
        view.alpha = 0;
        __weak typeof(self)weakSelf = self;
        view.clickBlock = ^(int type){
            NSLog(@"type = %d",type);
            if(weakSelf.clickBlock){
                weakSelf.clickBlock(type);
            }
        };
        [self.handleView addSubview:view];
        [self.handleView insertSubview:view aboveSubview:(UIView*)[self.viewArray lastObject]];
        [self.viewArray addObject:view];
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(viewPanHandle:)];
        [view addGestureRecognizer:panGesture];
    }
}

/**
 *  随机颜色
 */
- (UIColor *)randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

/**
 *  视图手势处理
 */
- (void)viewPanHandle:(UIPanGestureRecognizer *)panGesture{
    CGPoint point = [panGesture translationInView:self];
    [panGesture setTranslation:CGPointZero inView:self];
    MorningCheckHandleView *view = (MorningCheckHandleView *)[self.viewArray lastObject];
    __weak typeof(self)bself = self;
    view.center = CGPointMake(view.center.x + point.x, view.center.y + point.y);
    float angle = (view.center.x - self.handleView.center.x)/self.handleView.center.x;
    float scale = 1 - fabsf(angle)/2;
    if (panGesture.state == UIGestureRecognizerStateBegan) {
        [self initSingeViewFromBack:YES];
        [self changeViewFrameForward:YES];
        
    }else if (panGesture.state == UIGestureRecognizerStateChanged) {
        [view setRotation:angle view:view duration:ANIMATIONTIME];
        [view setScale:scale view:view CompletionBlock:nil duration:ANIMATIONTIME];
    }else if (panGesture.state == UIGestureRecognizerStateEnded) {
        if (fabs(view.center.x - self.handleView.center.x)>self.handleView.center.x/2) {
            float positionX;
            if (view.center.x >self.handleView.center.x) {
                positionX = self.handleView.bounds.size.width + view.bounds.size.width/2;
                angle = M_PI*1/3;
                [self rightSliding];
            }else{
                positionX = -view.bounds.size.width/2;
                angle = -M_PI*1/3;
                [self leftSliding];
            }
            [view setPosition:CGPointMake(positionX, view.center.y) view:view duration:REMOVETIME];
            __weak MorningCheckHandleView *weakView = view;
            [view setScale:0.4 view:view CompletionBlock:^{
                [weakView removeFromSuperview];
                [bself.viewArray removeLastObject];
            } duration:REMOVETIME];
            [view setRotation:angle view:view duration:REMOVETIME];
        }else{
            [self changeViewFrameForward:NO];
            [self.viewArray removeObjectAtIndex:0];
            [view setRotation:0 view:view duration:ANIMATIONTIME];
            [view setScale:1 view:view CompletionBlock:nil duration:ANIMATIONTIME];
            [view setPosition:CGPointMake(self.handleView.center.x, self.handleView.center.y-(self.viewArray.count - 1)*10) view:view duration:ANIMATIONTIME];
        }
    }
}

/**
 *  改变所有视图位置和大小
 */
- (void)changeViewFrameForward:(BOOL)isForward{
    if (isForward) {
        for (int i = 1; i< (self.viewArray.count -1); i++) {
            MorningCheckHandleView *view = self.viewArray[i];
            CGRect frame = CGRectMake(0, 0, VIEWWIDTH + i*15, VIEWHEIGHT);
            CGPoint center = CGPointMake(self.handleView.center.x, self.handleView.center.y - i*10);
            [view setPosition:center view:view duration:FRAMETIME];
            [view setFrame:frame view:view duration:FRAMETIME];
            view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, frame.size.width, frame.size.height);
            NSLog(@"gogogo");
        }
    }else{
        for (int i = 0; i< (self.viewArray.count -2); i++) {
            MorningCheckHandleView *view = self.viewArray[i+1];
            CGRect frame = CGRectMake(0, 0, VIEWWIDTH + i*15, VIEWHEIGHT);
            CGPoint center = CGPointMake(self.handleView.center.x, self.handleView.center.y - i*10);
            [view setFrame:frame view:view duration:FRAMETIME];
            [view setPosition:center view:view duration:FRAMETIME];
            view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, frame.size.width, frame.size.height);
        }
    }
}



/**
 *  左滑
 */
- (void)leftSliding{
    
}

/**
 *  右滑
 */
- (void)rightSliding{
    
}

- (IBAction)ignoreClick:(UIButton *)sender {
    [self operationDnimation:YES];
}

- (IBAction)nextClick:(UIButton *)sender {
    [self operationDnimation:NO];
}

- (IBAction)determineClick:(UIButton *)sender {
}

- (void)operationDnimation:(BOOL)isIgnore{
    CGFloat origignX = 0;
    float angle = 0;
    if(isIgnore){
        origignX = -120;
        angle = (0 - self.handleView.center.x)/self.handleView.center.x;
    }else{
        origignX = self.frame.size.width + 120;
        angle = (self.handleView.center.x)/self.handleView.center.x;
    }
    MorningCheckHandleView *view = [self.viewArray lastObject];
    float scale = 1 - fabsf(angle)/2;
    [view setRotation:angle view:view duration:0.5];
    [view setScale:scale view:view CompletionBlock:nil duration:0.5];
    [view setPosition:CGPointMake(origignX, view.center.y) view:view duration:0.5];
    [self initSingeViewFromBack:YES];
    [self changeViewFrameForward:YES];
    [self performSelector:@selector(destroyView) withObject:self afterDelay:0.5];
}

- (void)destroyView{
    MorningCheckHandleView *view = [self.viewArray lastObject];
    [view removeFromSuperview];
    [self.viewArray removeLastObject];
}


@end
