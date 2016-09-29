//
//  MJAdsScrollView.m
//  轮播图
//
//  Created by 孙梦翔 on 16/9/27.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJAdsScrollView.h"
#define SCROLLHEIGHT  self.bounds.size.height
#define SCROLLWIDTH   self.bounds.size.width

#define HEIGHT        self.frame.origin.y
static NSTimeInterval const changePicTime = 3.0f;
static NSTimeInterval const circlePicTime = 0.3f;
@interface MJAdsScrollView ()
/** 记录是否暂停计时器*/
@property (assign,nonatomic) BOOL isThumbOn;
/** timer */
@property (strong ,nonatomic) NSTimer * timer;
/** 记录当前页面*/
@property (assign,nonatomic) NSUInteger currentPage;
/** image1 */
@property (strong ,nonatomic) UIImageView * leftImageView;
/** image2 */
@property (strong ,nonatomic) UIImageView * centerImageView;
/** image3 */
@property (strong ,nonatomic) UIImageView * rightImageView;
@end
@implementation MJAdsScrollView
- (void)setImageArray:(NSArray *)imageArray
{
    _imageArray = imageArray;
    
    self.leftImageView.image = self.imageArray[0];
    self.centerImageView.image = self.imageArray[1];
    if (self.imageArray.count == 2) { // 万一轮播图片只有两张去循环轮播
        self.rightImageView.image = self.imageArray[0];
    } else{
        self.rightImageView.image = self.imageArray[2];
    }
    self.contentSize = CGSizeMake(SCROLLWIDTH * _imageArray.count, 0);
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.leftImageView.frame = self.bounds;
    self.centerImageView.frame = CGRectMake(SCROLLWIDTH , 0, SCROLLWIDTH, SCROLLHEIGHT);
    self.rightImageView.frame = CGRectMake(SCROLLWIDTH *2, 0, SCROLLWIDTH, SCROLLHEIGHT);
}
#pragma mark - 代码创建的scrollView轮播图
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        UIImageView * v1 = [[UIImageView alloc] init];
        self.leftImageView = v1;
        [self addSubview:self.leftImageView];
        UIImageView * v2 = [[UIImageView alloc] init];
        self.rightImageView = v2;
        [self addSubview:self.rightImageView];
        UIImageView * v3 = [[UIImageView alloc] init];
        self.centerImageView = v3;
        [self addSubview:self.centerImageView];
       
        self.leftImageView.image = self.imageArray[0];
        self.centerImageView.image = self.imageArray[1];
        if (self.imageArray.count == 2) { // 万一轮播图片只有两张去循环轮播
            self.rightImageView.image = self.imageArray[0];
        } else{
            self.rightImageView.image = self.imageArray[2];
        }
        
        self.contentOffset = CGPointMake(SCROLLWIDTH, 0);
        // 滑动到边界的弹动效果设置
        self.bounces = NO;
        
        self.delegate = self;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.pagingEnabled = YES;
        
        self.isThumbOn = NO;
        [self addTimer];

    }
    return self;
}
- (void)setPageControlShowStyle:(UIPageControlShowStyle)PageControlShowStyle
{
    
    if (PageControlShowStyle == UIPageControlShowStyleNone) {
        return;
    }
    _pageControl = [[UIPageControl alloc]init];
    
    self.pageControl.numberOfPages = self.imageArray.count;
    
    if (PageControlShowStyle == UIPageControlShowStyleLeft)
    {
        self.pageControl.frame = CGRectMake(10, HEIGHT+SCROLLHEIGHT - 20, 20*self.pageControl.numberOfPages, 20);
    }
    else if (PageControlShowStyle == UIPageControlShowStyleCenter)
    {
        self.pageControl.frame = CGRectMake(0, 0, 20*self.pageControl.numberOfPages, 20);
        self.pageControl.center = CGPointMake(SCROLLWIDTH/2.0, HEIGHT+SCROLLHEIGHT - 10);
    }
    else
    {
        self.pageControl.frame = CGRectMake(SCROLLWIDTH - 20 * self.pageControl.numberOfPages, HEIGHT + SCROLLHEIGHT - 20, 20 * self.pageControl.numberOfPages, 20);
        
    }
    self.pageControl.currentPage = 0;
    
    self.pageControl.enabled = NO;
    
    [self performSelector:@selector(addPageControl) withObject:nil afterDelay:0.1f];
}
- (void)addPageControl
{
    [[self superview] addSubview:self.pageControl];
}
- (void)addTimer
{
    NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:changePicTime target:self selector:@selector(changPic) userInfo:nil repeats:YES];
    
    self.timer = timer;
}
- (void)changPic
{
    [self setContentOffset:CGPointMake(SCROLLWIDTH * 2,0) animated:YES];
    self.isThumbOn = YES;
    // 调用复用方法
    [NSTimer scheduledTimerWithTimeInterval:circlePicTime target:self selector:@selector(scrollViewDidEndDecelerating:) userInfo:nil repeats:NO];
    
}
// 图片复用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    CGPoint centerPoint = CGPointMake(SCROLLWIDTH, 0);
    if (self.contentOffset.x == 0) { // 向右滑动
        
        self.currentPage = (self.currentPage - 1) % self.imageArray.count;
        // 更新 pageControl 页码
        self.pageControl.currentPage = (self.pageControl.currentPage - 1) % self.pageControl.numberOfPages;
    }else if(self.contentOffset.x == 2 * SCROLLWIDTH){ // 向左滑动
        
        self.currentPage = (self.currentPage + 1) % self.imageArray.count;
        // 更新 pageControl 页码
        self.pageControl.currentPage = (self.pageControl.currentPage + 1) % self.pageControl.numberOfPages;
    }else{
        return;
    }
    // 不做动画，默默的把图片更新
    NSInteger leftImagePage = (self.currentPage - 1) % self.imageArray.count;
    if (self.currentPage == 0) {
        leftImagePage = self.imageArray.count - 1;
    }
    NSInteger rightImagePage = (self.currentPage + 1) % self.imageArray.count;
    self.leftImageView.image = self.imageArray[leftImagePage];
    self.rightImageView.image = self.imageArray[rightImagePage];
    self.centerImageView.image = self.imageArray[self.currentPage];
    if (!self.isThumbOn) {
        [self.timer setFireDate:[NSDate dateWithTimeIntervalSinceNow:changePicTime]];
    }
    self.isThumbOn = NO;
    self.contentOffset = centerPoint;
    
}

@end
