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
// 只要一导入这个文件就会加载这个方法
+ (void)initialize
{
    // 设置所有的导航栏的背景图片,首先是拿到所有的导航栏
//    [UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:<#(nonnull NSString *)#>] forBarMetrics:<#(UIBarMetrics)#>
    [super initialize];
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 在这里设置所有的二级导航栏左侧返回按钮的样式
    if (viewController.childViewControllers.count > 0) {
        
        UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        backBtn.size = CGSizeMake(50, 44);
        
        UIBarButtonItem * barItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
        self.navigationItem.leftBarButtonItem = barItem;
        
        [backBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    
    [super pushViewController:viewController animated:animated];
}


- (void)backClick
{
    [self popViewControllerAnimated:YES];
}
@end
