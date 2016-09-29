//
//  MJHeadReusableView.m
//  Floral
//
//  Created by 孙梦翔 on 16/9/28.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJHeadReusableView.h"
#import "MJAdsScrollView.h"
#define  HEADLABELHEIGHT  20.0f
#define HEADHEIGHT  self.bounds.size.height
#define HEADWIDTH   self.bounds.size.width
@interface MJHeadReusableView ()

@property (nonatomic,weak) MJAdsScrollView * adsView;
@property (nonatomic,weak) UILabel * headerLabel;
@property (nonatomic,weak) UIView * titleView;
@property (strong ,nonatomic) NSMutableArray * imageArray;
@end
@implementation MJHeadReusableView

- (NSMutableArray *)imageArray
{
    if (_imageArray == nil) {
        _imageArray = [NSMutableArray array];
        
        for (int i = 0; i < 3; i ++) {
            NSString * imageName = [NSString stringWithFormat:@"image%zd",i];
            UIImage * image = [UIImage imageNamed:imageName];
            [_imageArray addObject:image];
        }
    }
    return _imageArray;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setUpAdsView];
        
        [self setUpTitleView];
        
        
    }
    return self;
}
- (void)setUpAdsView
{
    MJAdsScrollView * adsV = [[MJAdsScrollView alloc] init];
    self.adsView = adsV;
    [self addSubview:adsV];
    CGFloat h = HEADHEIGHT - HEADLABELHEIGHT;
    adsV.frame = self.bounds;
    // 修改高度
    adsV.height = h;
    
    adsV.imageArray = self.imageArray;
    [adsV setPageControlShowStyle:UIPageControlShowStyleRight];
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
