//
//  MJMainNavigationController.m
//  Floral
//
//  Created by 孙梦翔 on 16/9/25.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJMainNavigationController.h"

@interface MJMainNavigationController ()

@end

@implementation MJMainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 在这里设置所有的二级导航栏左侧返回按钮的样式
    if (viewController.childViewControllers.count > 0) {
        
        UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        backBtn.
        
    }
    
    
    [super pushViewController:viewController animated:animated];
}

@end
