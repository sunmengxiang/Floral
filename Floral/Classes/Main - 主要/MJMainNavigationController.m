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
    if (self.childViewControllers.count > 0) {
        
        UIButton * backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [backBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        backBtn.size = backBtn.currentImage.size;
        [backBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
        // 调整完按钮图片的 inset，也要调整下 content 的 inset,因为 img 和 title 的 inset 调整后，img+title 宽度是不变的，那么图片就会部分越界
        [backBtn setContentEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)];
        UIBarButtonItem * barItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
        viewController.navigationItem.leftBarButtonItem = barItem;
        
        [backBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
        // 设置 title 的文字大小和字体
        viewController.navigationController.navigationBar.titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:[UIColor blackColor]};
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    
    [super pushViewController:viewController animated:animated];
}


- (void)backClick
{
    [self popViewControllerAnimated:YES];
}
@end
