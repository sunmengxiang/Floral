//
//  MJMainTabBarController.m
//  Floral
//
//  Created by 孙梦翔 on 16/9/25.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJMainTabBarController.h"
#import "MJThemeViewController.h"
#import "MJCommunityViewController.h"
#import "MJMallViewController.h"
#import "MJMineViewController.h"
#import "MJMainNavigationController.h"
#import "MJLoginViewController.h"
@interface MJMainTabBarController ()<UITabBarControllerDelegate>

@end

@implementation MJMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    添加子控制器们
    [self addChileViewController];
    
    self.delegate = self;
}
#pragma mark -添加子控制器们
- (void)addChileViewController
{
    
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tb_bg"]];
//    专题控制器
    MJThemeViewController * themeVc = [[MJThemeViewController alloc] init];
    
    [self setUpChileViewController:themeVc title:@"专题" image:[UIImage imageNamed:@"tb_0"] selectImage:[UIImage imageNamed:@"tb_0_s"]];
//    社区控制器
     MJCommunityViewController * communityVc = [[MJCommunityViewController alloc] init];
    
    [self setUpChileViewController:communityVc title:@"社区" image:[UIImage imageNamed:@"tb_1"] selectImage:[UIImage imageNamed:@"tb_1_s"]];
//    商城控制器
    MJMallViewController * mallVc = [[MJMallViewController alloc] init];
    
    [self setUpChileViewController:mallVc title:@"商城" image:[UIImage imageNamed:@"tb_2"] selectImage:[UIImage imageNamed:@"tb_2_s"]];
//    我的 控制器
    MJMineViewController * mineVc = [[ MJMineViewController alloc] init];
    [self setUpChileViewController:mineVc title:@"我的" image:[UIImage imageNamed:@"tb_3"] selectImage:[UIImage imageNamed:@"tb_3_s"]];
    
}

- (void)setUpChileViewController:(UIViewController *)vc title:(NSString *)title image:(UIImage *)image selectImage:(UIImage *)selectImage
{
    
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectImage;
    [vc.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:8],NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
    [vc.tabBarItem setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:8],NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateSelected];
    MJMainNavigationController * naviVc = [[MJMainNavigationController alloc] initWithRootViewController:vc];
    
    [self addChildViewController:naviVc];
}
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    NSLog(@"--tabbaritem.title--%@",viewController.tabBarItem.title);
    
    //这里我判断的是当前点击的tabBarItem的标题
    if ([viewController.tabBarItem.title isEqualToString:@"我的"]) {
        //如果用户ID存在的话，说明已登陆
//        if (USER_ID) {
//            return YES;
//        }
//        else
//        {
            //跳到登录页面
            MJLoginViewController *login = [[MJLoginViewController alloc] init];
            //隐藏tabbar
            login.hidesBottomBarWhenPushed = YES;
        [tabBarController.selectedViewController presentViewController:login animated:NO completion:nil];
        
            return NO;
//        }
    }
    else
        return YES;
}
@end
