//
//  MJHeadReusableView.m
//  Floral
//
//  Created by 孙梦翔 on 16/9/28.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJHeadReusableView.h"
#import "MJAdsScrollView.h"
#import "MJEssencesAds.h"
#import <UIImageView+WebCache.h>
#define  HEADLABELHEIGHT  20.0f
#define HEADHEIGHT  self.bounds.size.height
#define HEADWIDTH   self.bounds.size.width
@interface MJHeadReusableView ()
@property (nonatomic,strong) NSMutableArray * imageArray;
@property (nonatomic,weak) MJAdsScrollView * adsView;
@property (nonatomic,weak) UILabel * headerLabel;
@property (nonatomic,weak) UIView * titleView;
@end
@implementation MJHeadReusableView

- (NSMutableArray *)imageArray
{
    if (_imageArray == nil) {
        _imageArray = [NSMutableArray array];
    }
    return _imageArray;
}
- (void)setAdsArray:(NSArray *)adsArray
{
    _adsArray = adsArray;
    // 开启子线程下载图片
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
    for (MJEssencesAds * ads in adsArray) {
      
             NSURL * url = [NSURL URLWithString:ads.imageUrl];
             NSData * imageData = [NSData dataWithContentsOfURL:url];
             UIImage * image = [UIImage imageWithData:imageData];
             [self.imageArray addObject:image];
        NSLog(@"下载完成----%@",image);}
             // 回到主线程
             dispatch_async(dispatch_get_main_queue(), ^{
                 NSLog(@"更新-----");
                 // 有数据才加载
                 [self setUpAdsView];
                 
                 [self setUpTitleView];
             });
         });
    

    
}

- (void)setUpAdsView
{
    NSLog(@"%@",self.imageArray);
    MJAdsScrollView * adsV = [[MJAdsScrollView alloc] init];
    self.adsView = adsV;
    [self addSubview:adsV];
    CGFloat h = HEADHEIGHT - HEADLABELHEIGHT;
    adsV.frame = self.bounds;
    // 修改高度
    adsV.height = h;
    adsV.imageArray = self.imageArray;
    if (self.adsArray) {
    [adsV setPageControlShowStyle:UIPageControlShowStyleRight];
    }
}
- (void)setUpTitleView
{
    UIView * view = [[UIView alloc]init];
    view.backgroundColor = [UIColor whiteColor];
    CGFloat y = HEADHEIGHT - HEADLABELHEIGHT;
    view.frame = CGRectMake(0, y, HEADWIDTH, HEADLABELHEIGHT);
    self.titleView = view;
    [self addSubview:self.titleView];

    UILabel * label = [[UILabel alloc]init];
    self.headerLabel = label;
    [label setTextAlignment:NSTextAlignmentLeft];
    [label setFont:[UIFont systemFontOfSize:13]];
    [label setTextColor:[UIColor blackColor]];
    label.frame = self.titleView.bounds;
    [self.titleView addSubview:self.headerLabel];
}
- (void)setHeaderTitle:(NSString *)headerTitle
{
    self.headerLabel.text = headerTitle;
}
- (void)layoutSubviews
{
    [super layoutSubviews];

}
@end
