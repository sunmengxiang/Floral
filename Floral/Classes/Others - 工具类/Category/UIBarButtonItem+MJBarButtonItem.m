//
//  UIBarButtonItem+MJBarButtonItem.m
//  项目--导航栏的设置
//
//  Created by 孙梦翔 on 16/7/19.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "UIBarButtonItem+MJBarButtonItem.h"

@implementation UIBarButtonItem (MJBarButtonItem)


+ (instancetype)itemWithImage:(UIImage *)image highlightImage:(UIImage *)highImage target:(id)target selector:(SEL)selector
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:highImage forState:UIControlStateHighlighted];
    
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    btn.size = btn.currentImage.size;
    
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}

+ (instancetype)itemWithtitle:(NSString*)title normalFontColor:(UIColor *)normalColor hightFontColor:(UIColor *)hightFontColor target:(id)target selector:(SEL)selector
{
    
    UIFont * naviTitleFont = [UIFont systemFontOfSize:MJNaviTitleFontSize];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState: UIControlStateNormal];
    [btn.titleLabel setFont:naviTitleFont];
    [btn setTitleColor:normalColor forState:UIControlStateNormal];
    [btn setTitleColor:hightFontColor forState:UIControlStateSelected];
    
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    CGFloat titleWidth = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : naviTitleFont} context:nil].size.width;
    btn.size = CGSizeMake(titleWidth, MJNaviBarHeight);
    
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}
@end
