//
//  MJHeadReusableView.m
//  Floral
//
//  Created by 孙梦翔 on 16/9/28.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJHeadReusableView.h"
//#import "MJAdsScrollView.h"
#import "SDCycleScrollView.h"
#import "MJEssencesAds.h"
#import <UIImageView+WebCache.h>
#define  HEADLABELHEIGHT  25.0f
#define HEADHEIGHT  self.bounds.size.height
#define HEADWIDTH   self.bounds.size.width
@interface MJHeadReusableView ()<SDCycleScrollViewDelegate>

//@property (nonatomic,weak) MJAdsScrollView * adsView;
@property (nonatomic,strong) NSMutableArray * imageUrlArray;
@property (nonatomic,weak) UILabel * headerLabel;
@property (nonatomic,weak) UIView * titleView;
@end
@implementation MJHeadReusableView
- (NSMutableArray *)imageUrlArray
{
    if (_imageUrlArray.count == 0) {
        _imageUrlArray = [NSMutableArray array];
        
        for (MJEssencesAds * ads in self.adsArray) {
            NSURL * imageUrl = [NSURL URLWithString:ads.imageUrl];
            [_imageUrlArray addObject:imageUrl];
        }
    }
    return _imageUrlArray;
}
- (void)setAdsArray:(NSArray *)adsArray
{
    _adsArray = adsArray;
    
    [self setUpAdsView];
    
    [self setUpTitleView];
}

- (void)setUpAdsView
{
    CGRect scrollViewframe = CGRectMake(0, 0, MJScreenW, HEADHEIGHT - HEADLABELHEIGHT);
    // 网络加载图片的轮播器
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:scrollViewframe delegate:self placeholderImage:nil];
//    cycleScrollView.delegate = self;
    cycleScrollView.imageURLStringsGroup = self.imageUrlArray;
    
    [self addSubview:cycleScrollView];

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
    [label setFont:[UIFont systemFontOfSize:15]];
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
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    
}
@end
