//
//  MJNewFeatureViewCell.m
//  Floral
//
//  Created by 孙梦翔 on 16/10/01.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJNewFeatureViewCell.h"
#import "MJMainTabBarController.h"
@interface MJNewFeatureViewCell ()

@property (nonatomic, weak) UIImageView *imageView;

@property (nonatomic, weak) UIButton *startButton;

@end
@implementation MJNewFeatureViewCell
- (UIButton *)startButton
{
    if (_startButton == nil) {
    
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _startButton = btn;
        
        [_startButton setBackgroundImage:[UIImage imageNamed:@"gp_bg_btn"] forState:UIControlStateNormal];
        
        [_startButton sizeToFit];
        
        [_startButton addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
        
        _startButton.center = CGPointMake(self.width * 0.5, self.height * 0.95);
        
        [self.contentView addSubview:_startButton];
        
    }
    return _startButton;
}

- (UIImageView *)imageView
{
    if (_imageView == nil) {
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:self.bounds];
        
        _imageView = imageV;
        
        [self.contentView addSubview:imageV];
    }
    
    return _imageView;
}
- (void)setImage:(UIImage *)image
{
    _image = image;
    
    self.imageView.image = image;
}
- (void)setUpIndexPath:(NSIndexPath *)indexPath count:(NSInteger)pagesCount
{
    if (indexPath.row == pagesCount - 1) {
        // 最后一行
        // 添加立即体验按钮
        
        self.startButton.hidden = NO;
    }else{
        self.startButton.hidden = YES;
    }
    
}

// 点击立即体验按钮
- (void)start
{
    // 跳转到核心界面,push,modal,切换跟控制器的方法
    MJKeyWindow.rootViewController = [[MJMainTabBarController alloc] init];
    
    CATransition *anim = [CATransition animation];
    anim.duration = 0.5;
    anim.type = @"rippleffect";
    [MJKeyWindow.layer addAnimation:anim forKey:nil];
}

@end
