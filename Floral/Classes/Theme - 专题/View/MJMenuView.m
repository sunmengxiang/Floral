//
//  MJMenuView.m
//  Floral
//
//  Created by 孙梦翔 on 16/9/25.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJMenuView.h"
#import "MJMenuItem.h"
#import "MJItems.h"
#define MJColsMax 2

#define MJItemW MJScreenW / MJColsMax

@interface MJMenuView ()

@property (nonatomic, strong) NSArray *items;

@property (nonatomic, strong) NSMutableArray *btns;

@property (nonatomic,weak) UIView * superView;

@end

@implementation MJMenuView

- (NSMutableArray *)btns
{
    if (_btns == nil) {
        _btns = [NSMutableArray array];
    }
    return _btns;
}

- (void)dismiss
{
    [UIView animateWithDuration:0.5f animations:^{
        self.transform = CGAffineTransformMakeTranslation(0, -self.height);
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        
    }];
    
}

+ (instancetype)showInView:(UIView *)superView items:(NSArray *)items oriY:(CGFloat)oriY
{
    MJMenuView *menu = [[MJMenuView alloc] initWithFrame:CGRectMake(0, oriY, MJScreenW, superView.height)];
    menu.superView = superView;
    
    menu.items = items;
    
    // 添加按钮
    [menu setUpAllBtns];
    
    // 添加分割线
    [menu setUpAllDivideView];
    
//    // 添加背景蒙版
//    UIToolbar * blurView = [[UIToolbar alloc] init];
//
//    blurView.frame = superView.bounds;
//    blurView.barStyle = UIBarStyleDefault;
//    [superView addSubview:blurView];
    

    // 往下移动的动画
    menu.transform = CGAffineTransformMakeTranslation(0, -menu.height);

    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        menu.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        
//        [blurView removeFromSuperview];
    }];
    
    
    menu.backgroundColor = [UIColor blackColor];
    
    [superView addSubview:menu];
    return menu;
    
}
#pragma mark - 添加分割线
- (void)setUpAllDivideView
{
    NSUInteger rows = (self.items.count - 1) / MJColsMax + 1;
    CGFloat MJItemH = (MJScreenH - MJNaviBarHeight - MJTabBarHeight)/ rows;
    for (int i = 0; i < MJColsMax - 1; i++) {
        
        UIView *divideV = [[UIView alloc] init];
        
        divideV.backgroundColor = [UIColor whiteColor];
        
        divideV.frame = CGRectMake((i + 1) * MJItemW,MJItemH , 1, self.height - MJItemH);
        
        [self addSubview:divideV];
    }
   
    // 横:总行数-1
    // x = 0 y = （i + 1） * itemWh w:menu.w h 1
    for (int i = 0; i < rows - 1; i++) {
        UIView *divideH = [[UIView alloc] init];
        
        divideH.backgroundColor = [UIColor whiteColor];
        
        divideH.frame = CGRectMake(0, (i + 1) * MJItemH, self.width, 1);
        
        [self addSubview:divideH];
    }
    
}

#pragma mark - 添加所有按钮
- (void)setUpAllBtns
{
    for (MJItems *item in self.items) {
        
        MJMenuItem *btn = [MJMenuItem buttonWithType:UIButtonTypeCustom];
        
        [btn itemButtonWithImage:item.image title:item.title];
        
        [self addSubview:btn];
        
        [self.btns addObject:btn];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 布局所有的按钮
    NSUInteger count = self.items.count;
    
    int col = 0;
    NSUInteger row = 0;
    CGFloat x = 0;
    CGFloat y = 0;
    // 总行号
    NSUInteger rows = (self.items.count - 1) / MJColsMax + 1;
    CGFloat MJItemH = (MJScreenH - MJNaviBarHeight - MJTabBarHeight)/ rows;
    for (NSUInteger i = 0; i < count ; i++) {
        col = i % MJColsMax;
        row = i / MJColsMax;
        
        UIButton *btn = self.btns[i];
        x = col * MJItemW;
        y = row * MJItemH;
        // 让第一个按钮 显示宽度为屏幕的宽度,下一个直接跳到下一行
        if (i < 1) {
            btn.frame = CGRectMake(x, y, MJScreenW, MJItemH);
            i += MJColsMax - 1;
            UIButton * nextBtn = self.btns[i];
            nextBtn.frame = CGRectMake(0, MJItemH, MJItemW, MJItemH);
        }else{
        btn.frame = CGRectMake(x, y, MJItemW, MJItemH);
        }
    }
}


@end
