//
//  MJThemeViewController.m
//  Floral
//
//  Created by 孙梦翔 on 16/9/25.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJThemeViewController.h"
#import "MJOrderButton.h"
#import "MJMenuView.h"
#import "MJItems.h"
#import "MJHeaderFindView.h"
#import "MJCollectionController.h"
#import <Masonry.h>


@interface MJThemeViewController ()

// contentView
@property (nonatomic,weak) UIView * contentView;
// 导航栏的按钮
@property (nonatomic,weak) UIButton * naviLeftBtn;


@property (nonatomic,weak) UIButton * naviChangeBtn;

@property (nonatomic,weak) UIButton * naviTitleBtn;
// 缓存导航栏左侧 menuItem 的属性
@property (nonatomic,weak) MJMenuView * downMenu;

@property (nonatomic,weak) MJHeaderFindView * findView;

// 流水布局
@property (nonatomic,weak) UICollectionViewFlowLayout * layout;

// 高斯模糊背景
@property (nonatomic,weak) UIVisualEffectView * blurView;
@end

@implementation MJThemeViewController
#pragma mark - 懒加载
- (MJMenuView *)downMenu
{
    if (_downMenu == nil) {
        
        UIImage * placeImage = [[UIImage alloc] init];
        
        MJItems * item1 = [MJItems itemWithImage:placeImage title:@"123"];
        MJItems * item2 = [MJItems itemWithImage:placeImage title:@"123"];
        MJItems * item3 = [MJItems itemWithImage:placeImage title:@"123"];
        MJItems * item4 = [MJItems itemWithImage:placeImage title:@"123"];
        MJItems * item5 = [MJItems itemWithImage:placeImage title:@"123"];
        MJItems * item6 = [MJItems itemWithImage:placeImage title:@"123"];
        MJItems * item7 = [MJItems itemWithImage:placeImage title:@"123"];
        
        NSArray * itemArray = @[item1,item2,item3,item4,item5,item6,item7];
        
       _downMenu =  [MJMenuView showInView:self.view items:itemArray oriY:MJNaviBarHeight];
    }
    return _downMenu;
}
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
- (UIView *)contentView
{
    if (_contentView == nil) {
        UIView * v = [[UIView alloc] init];
        _contentView = v;
        [self.view addSubview:v];
        UIEdgeInsets insets = UIEdgeInsetsMake(10, 10, 0, 10);
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view).with.insets(insets);
        }];
        v.clipsToBounds = YES;
        _contentView = v;
        
    }
    return _contentView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpNaviBar];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.contentView.backgroundColor = [UIColor blueColor];
    
    // 设置文章
    [self setUpCollectionView];
 
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
    if (self.naviLeftBtn.selected) { // 奇数次点击的话就旋转
        
        CABasicAnimation * rotationAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
        rotationAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2, 0, 0, 1)];
        
        //设置动画执行完毕后不删除动画
        rotationAnim.removedOnCompletion = NO;
        //设置保存动画的最新状态
        rotationAnim.fillMode = kCAFillModeForwards;
        rotationAnim.duration = 0.5f;
        
        [self.naviLeftBtn.layer addAnimation:rotationAnim forKey:@"leftNaivAnim"];
        [self blurView];
        // 弹出菜单栏
        [self downMenu];
    }else{ // 偶数次选中的话复原
        
        CABasicAnimation * rotationAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
        rotationAnim.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2, 0, 0, 1)];
        rotationAnim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(0, 0, 0, 1)];
        //设置动画执行完毕后不删除动画
        rotationAnim.removedOnCompletion = NO;
        //设置保存动画的最新状态
        rotationAnim.fillMode = kCAFillModeForwards;
        rotationAnim.duration = 0.5f;
        [self.naviLeftBtn.layer addAnimation:rotationAnim forKey:@"leftNaivBackAnim"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(rotationAnim.duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.blurView removeFromSuperview];
        });
        // 菜单栏消失
        [self.downMenu dismiss];
    }
    
    
}
#pragma mark - 导航栏按钮的点击

- (CGSize)changLayoutItemSize
{
    if (self.naviChangeBtn.selected) {
        return CGSizeMake((MJScreenW - 2.5 * MJDefaultMargin)/2.0f, 170);
    }else{
        return CGSizeMake(MJScreenW - 2* MJDefaultMargin, 300);
    }
}
// 右侧改变布局按钮的点击
- (void)rightNaviChangeClick
{
    self.naviChangeBtn.selected = !self.naviChangeBtn.selected;
    if (self.naviChangeBtn.selected) { // 更换一行两个文章的布局
        self.layout.itemSize = [self changLayoutItemSize];
    }else{ // 更换一行一个文章的布局
        self.layout.itemSize = [self changLayoutItemSize];
    }
}
- (void)setUpCollectionView
{

    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    self.layout = layout;
    layout.itemSize = [self changLayoutItemSize];
    layout.minimumLineSpacing = 10;
    layout.minimumInteritemSpacing = 5;
    MJCollectionController * collectionVc = [[MJCollectionController alloc]initWithCollectionViewLayout:layout];
    collectionVc.view.frame = self.contentView.bounds;
    
    [self.contentView addSubview:collectionVc.view];
    [self addChildViewController:collectionVc];
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
