//
//  MJMineViewController.m
//  Floral
//
//  Created by 孙梦翔 on 16/9/25.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJMineViewController.h"

@interface MJMineViewController ()

@end

@implementation MJMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNaviBar];
}

- (void)setUpNaviBar
{
    //    设置按钮
    UIBarButtonItem * settingBtnItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"pc_setting_40x40"] highlightImage:nil target:self selector:@selector(rightNaviFindClick)];
    self.navigationItem.rightBarButtonItem = settingBtnItem;
    // titleView
    UIButton * titleBtn = [UIButton buttonWithtitle:@"匿名用户" normalFontColor:[UIColor blackColor] hightFontColor:[UIColor blackColor] target:nil selector:nil];
    self.navigationItem.titleView = titleBtn;
}
- (void)rightNaviFindClick
{
    
}
@end
