//
//  MJCommunityViewController.m
//  Floral
//
//  Created by 孙梦翔 on 16/9/25.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJCommunityViewController.h"

@interface MJCommunityViewController ()
@property (nonatomic,weak) UIButton * essenceBtn;
@property (nonatomic,weak) UIButton * organizationBtn;
@property (nonatomic,weak) UIButton * followBtn;
@property (nonatomic,weak) UIView * pointerView;
@end

@implementation MJCommunityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpNaviBar];
}

// 设置导航栏的按钮
- (void)setUpNaviBar
{
    // 左侧添加订阅按钮
      UIBarButtonItem * leftItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"m_add_new"] highlightImage:nil target:self selector:@selector(leftBtnClick)];
    self.navigationItem.leftBarButtonItem = leftItem;

    // 右侧查找按钮
    UIButton * rightBtn = [UIButton buttonWithtitle:@"TOP" normalFontColor:[UIColor blackColor] hightFontColor:[UIColor blackColor] target:self selector:@selector(rightBtnClick)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
    // 设置中间 titleView
    [self setUpNaviTitleView];
}

- (void)setUpNaviTitleView
{
    NSInteger titleViewWidth = 200;
    // 中间 titleView
    UIView * titleView = [[UIView alloc] init];
    titleView.size = CGSizeMake(titleViewWidth, MJTabBarHeight);
    // titleView 的按钮的字体大小
    UIButton * essenceBtn = [UIButton buttonWithtitle:@"精选" normalFontColor:[UIColor grayColor] hightFontColor:[UIColor blackColor] target:self selector:@selector(essenceBtnClick)];
    self.essenceBtn = essenceBtn;
    
    
    UIButton * organizationBtn = [UIButton buttonWithtitle:@"圈子" normalFontColor:[UIColor grayColor] hightFontColor:[UIColor blackColor] target: self selector:@selector(organizationBtnClick)];
    self.organizationBtn = organizationBtn;
    
    UIButton * followBtn = [UIButton buttonWithtitle:@"订阅" normalFontColor:[UIColor grayColor] hightFontColor:[UIColor blackColor] target: self selector:@selector( followBtnClick)];
    self.followBtn = followBtn;
    
    [titleView addSubview:essenceBtn];
    [titleView addSubview:organizationBtn];
    [titleView addSubview:followBtn];
    CGFloat centerX = 0;
    CGFloat margin = 3 * MJDefaultMargin;
    CGFloat w = essenceBtn.width;
    NSInteger i = 0;
    NSInteger midNum = titleView.subviews.count - (titleView.subviews.count % 2);
    for (UIButton * btn in titleView.subviews) {
        if (i + 1 == midNum) {
            centerX = titleView.width / 2;
        }else{
            centerX = titleView.width / 2 - (midNum - i - 1)*(margin + w);
        }
        btn.centerX = centerX;
        i++;
        
    }
    // 创建pointerView,即按钮下面的指示标志,并默认是一创建就在精选按钮下面
    UIView * pointView = [[UIView alloc] init];
    self.pointerView = pointView;
    pointView.height = 3;
    pointView.y = titleView.height - pointView.height;
    pointView.width = essenceBtn.titleLabel.width;
    pointView.centerX = essenceBtn.centerX;
    pointView.backgroundColor = [UIColor blackColor];
    [titleView addSubview:pointView];
    
    self.essenceBtn.selected = YES;
    self.navigationItem.titleView = titleView;

}
- (void)leftBtnClick
{
    
}
- (void)rightBtnClick
{
    
}
- (void)essenceBtnClick
{
    self.essenceBtn.selected = !self.essenceBtn.selected;
    self.organizationBtn.selected = NO;
    self.followBtn.selected = NO;
    CGPoint pointCenter = self.pointerView.center;
    pointCenter.x = self.essenceBtn.centerX;
    [UIView animateWithDuration:0.3 animations:^{
        self.pointerView.center = pointCenter;
    }];
    NSLog(@"--");
}
- (void)organizationBtnClick
{
    self.organizationBtn.selected = !self.organizationBtn.selected;
    self.essenceBtn.selected = NO;
    self.followBtn.selected = NO;
    CGPoint pointCenter = self.pointerView.center;
    pointCenter.x = self.organizationBtn.centerX;
    [UIView animateWithDuration:0.3 animations:^{
        self.pointerView.center = pointCenter;
    }];
}
- (void)followBtnClick
{
    self.followBtn.selected = !self.followBtn.selected;
    self.organizationBtn.selected = NO;
    self.essenceBtn.selected = NO;
    CGPoint pointCenter = self.pointerView.center;
    pointCenter.x = self.followBtn.centerX;
    [UIView animateWithDuration:0.3 animations:^{
        self.pointerView.center = pointCenter;
    }];
}
@end
