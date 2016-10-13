//
//  MJThemeViewController.m
//  Floral
//
//  Created by 孙梦翔 on 16/9/25.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJThemeViewController.h"
#import "MJThemeContentController.h"
#import "MJOrderButton.h"

#import "MJCategoryController.h"
#import "MJHeaderFindView.h"

#import <Masonry.h>


@interface MJThemeViewController ()

// contentView
@property (nonatomic,weak) MJThemeContentController * contentViewVc;
// 导航栏的按钮
@property (nonatomic,weak) UIButton * naviLeftBtn;
@property (nonatomic,weak) UIButton * naviChangeBtn;
@property (nonatomic,weak) UIButton * naviTitleBtn;
// 缓存导航栏左侧 menuItem 的属性
@property (nonatomic,weak) MJCategoryController * categoryVc;
@property (nonatomic,weak) MJHeaderFindView * findView;
// 流水布局
@property (nonatomic,weak) UICollectionViewFlowLayout * layout;
// 高斯模糊背景
@property (nonatomic,weak) UIVisualEffectView * blurView;
@end

@implementation MJThemeViewController
#pragma mark - 懒加载
- (UIVisualEffectView *)blurView
{
    if (_blurView == nil) {
        UIBlurEffect * blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        UIVisualEffectView * view = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        view.frame = self.view.bounds;
        _blurView = view;
        [self.view addSubview:view];
    }
    return _blurView;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    
    [self setUpNaviBar];
    
    self.view.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1];
    
    [self setUpContentViewVc];
}

- (void)setUpContentViewVc
{
    MJThemeContentController* Vc = [[MJThemeContentController alloc] init];
    self.contentViewVc = Vc;
    
    [self.view addSubview:Vc.view];
    UIEdgeInsets insets = UIEdgeInsetsMake(10, 10, 0, 10);
   [Vc.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(insets);
    }];
    [self addChildViewController:Vc];
}
// 设置导航栏的样式
- (void)setUpNaviBar
{
//    设置左侧按钮
    UIBarButtonItem * leftBarItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"menu"] highlightImage:nil target:self selector:@selector(leftNaviBarClick)];
    self.navigationItem.leftBarButtonItem = leftBarItem;
    self.naviLeftBtn = leftBarItem.customView;

//    设置右侧按钮
    //    宫格按钮
    UIBarButtonItem * changeListItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"宫格"] highlightImage:[UIImage imageNamed:@"列表"] target:self selector:@selector(rightNaviChangeClick)];
    
    //    查找按钮
     UIBarButtonItem * findItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"f_search"] highlightImage:nil target:self selector:@selector(rightNaviFindClick)];
    self.navigationItem.rightBarButtonItems = @[findItem,changeListItem];
    
    self.naviChangeBtn = changeListItem.customView;
//    设置中间按钮
    
    [self setUpTitleView];
    
}
- (void)setUpTitleView
{
    MJOrderButton * titleBtn = [MJOrderButton buttonWithType:UIButtonTypeCustom];
    self.naviTitleBtn = titleBtn;
    NSString * titleBtnText = @"专题";
    [titleBtn setTitle:titleBtnText forState: UIControlStateNormal];
    UIFont * naviTitleFont = [UIFont systemFontOfSize:MJNaviTitleFontSize];
    [titleBtn.titleLabel setFont:naviTitleFont];
    [titleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    [titleBtn setImage:[UIImage imageNamed:@"hp_arrow_down"] forState:UIControlStateNormal];
    [titleBtn setImage:[UIImage imageNamed:@"hp_arrow_up"] forState:UIControlStateSelected];
    titleBtn.size = CGSizeMake(MJNaviTitleViewWidth, MJNaviBarHeight);
    self.navigationItem.titleView = titleBtn;
    //监听中间按钮的点击
    [titleBtn addTarget:self action:@selector(titleViewClick) forControlEvents:UIControlEventTouchUpInside];
}
// 左侧按钮的点击
- (void)leftNaviBarClick
{
    // 取反
    self.naviLeftBtn.selected = !self.naviLeftBtn.selected;
    // 旋转
    [self leftNaviRotationAnim];
    
    if (self.naviLeftBtn.selected) {
        [self blurView];
        // 弹出菜单栏
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 1;
        layout.minimumInteritemSpacing = 1;
        MJCategoryController * vc = [[MJCategoryController alloc] initWithCollectionViewLayout:layout];
        
        vc.collectionView.frame = self.view.bounds;
        [self.view addSubview:vc.collectionView];
        [self addChildViewController:vc];
        self.categoryVc = vc;
    }else{
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.blurView removeFromSuperview];
        });

        [self.categoryVc dismiss];
    }
    
    
}
- (void)leftNaviRotationAnim
{
    CABasicAnimation * rotationAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
    if (self.naviLeftBtn.selected) {
        rotationAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2, 0, 0, 1)];
    }else{
        rotationAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2, 0, 0, 1)];
        rotationAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(0, 0, 0, 1)];
    }
    //设置动画执行完毕后不删除动画
    rotationAnim.removedOnCompletion = NO;
    //设置保存动画的最新状态
    rotationAnim.fillMode = kCAFillModeForwards;
    rotationAnim.duration = 0.5f;
    [self.naviLeftBtn.layer addAnimation:rotationAnim forKey:nil];

}
#pragma mark - 导航栏按钮的点击
// 右侧改变布局按钮的点击
- (void)rightNaviChangeClick
{
    self.naviChangeBtn.selected = !self.naviChangeBtn.selected;
    // 发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NotificationLayoutChange" object:self.naviChangeBtn];
}


// 右侧查找按钮的点击
- (void)rightNaviFindClick
{
        MJHeaderFindView * headerFindView = [MJHeaderFindView findView];
        
        [[UIApplication sharedApplication].keyWindow addSubview:headerFindView];
        [headerFindView show];
  
}
// 中间按钮的点击
- (void)titleViewClick
{
    self.naviTitleBtn.selected = !self.naviTitleBtn.selected;
    if (self.naviTitleBtn.selected) {
        
    }else{
        
    }
}

@end
