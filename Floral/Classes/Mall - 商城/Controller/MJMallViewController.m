//
//  MJMallViewController.m
//  Floral
//
//  Created by 孙梦翔 on 16/9/25.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJMallViewController.h"
#import "MJHeaderFindView.h"
#import "MJAdsScrollView.h"
@interface MJMallViewController ()
@property (nonatomic,assign) BOOL findBtnIsSelected;
@property (nonatomic,assign) BOOL detailBtnIsSelected;
@property (nonatomic,weak) UIButton * leftBarBtn;
@end

@implementation MJMallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUpNaviBar];
    
    [self setUpAlertMessage];

}
- (void)setUpAlertMessage
{
    UILabel * alertLabel = [[UILabel alloc] init];
    
    alertLabel.text = @"功能暂未开通";
    alertLabel.textAlignment = NSTextAlignmentCenter;
    
    alertLabel.center = self.view.center;
    alertLabel.bounds = CGRectMake(0, 0, MJScreenW, 50);
    alertLabel.font = [UIFont systemFontOfSize:25];
    alertLabel.textColor = [UIColor blackColor];
    [self.view addSubview:alertLabel];
}
- (void)setUpNaviBar
{
    //    查找按钮
    UIBarButtonItem * findItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"f_search"] highlightImage:nil target:self selector:@selector(rightNaviFindClick)];
    self.navigationItem.rightBarButtonItem = findItem;
    //   detail 按钮
    UIBarButtonItem * leftBarItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"menu"] highlightImage:nil target:self selector:@selector(leftNaviBarClick)];
    self.navigationItem.leftBarButtonItem = leftBarItem;
    self.leftBarBtn = leftBarItem.customView;
    
    UIButton * titleBtn = [UIButton buttonWithtitle:@"商城" normalFontColor:[UIColor blackColor] hightFontColor:[UIColor blackColor] target:nil selector:nil];
    self.navigationItem.titleView = titleBtn;
}

- (void)rightNaviFindClick
{
    MJHeaderFindView * headerFindView = [MJHeaderFindView findView];
    [[UIApplication sharedApplication].keyWindow addSubview:headerFindView];
    [headerFindView show];
}
- (void)leftNaviBarClick
{
    self.detailBtnIsSelected = !self.detailBtnIsSelected;
    // 旋转
    if (self.detailBtnIsSelected) { // 奇数次点击的话就旋转
        
        CABasicAnimation * rotationAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
        rotationAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2, 0, 0, 1)];
        
        //设置动画执行完毕后不删除动画
        rotationAnim.removedOnCompletion=NO;
        //设置保存动画的最新状态
        rotationAnim.fillMode=kCAFillModeForwards;
        rotationAnim.duration = 0.5f;
        
        [self.leftBarBtn.layer addAnimation:rotationAnim forKey:@"leftNaivAnim"];
        
        // 弹出菜单栏
        
    }else{ // 偶数次选中的话复原
        
        CABasicAnimation * rotationAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
        rotationAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2, 0, 0, 1)];
        rotationAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(0, 0, 0, 1)];
        //设置动画执行完毕后不删除动画
        rotationAnim.removedOnCompletion=NO;
        //设置保存动画的最新状态
        rotationAnim.fillMode=kCAFillModeForwards;
        rotationAnim.duration = 0.5f;
        [self.leftBarBtn.layer addAnimation:rotationAnim forKey:@"leftNaivBackAnim"];
        
        // 菜单栏消失
        
    }

}
@end
