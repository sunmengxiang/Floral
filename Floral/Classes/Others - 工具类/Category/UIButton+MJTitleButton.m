//
//  UIButton+MJTitleButton.m
//  Floral
//
//  Created by 孙梦翔 on 16/9/25.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "UIButton+MJTitleButton.h"

@implementation UIButton (MJTitleButton)

+ (instancetype)buttonWithtitle:(NSString*)title normalFontColor:(UIColor *)normalColor hightFontColor:(UIColor *)hightFontColor target:(id)target selector:(SEL)selector
{
    
    UIFont * naviTitleFont = [UIFont systemFontOfSize:MJNaviTitleFontSize];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState: UIControlStateNormal];
    [btn.titleLabel setFont:naviTitleFont];
    [btn setTitleColor:normalColor forState:UIControlStateNormal];
    [btn setTitleColor:hightFontColor forState:UIControlStateSelected];
    
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    CGFloat titleWidth = [title boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : naviTitleFont} context:nil].size.width;
    btn.size = CGSizeMake(titleWidth, MJTabBarHeight);
    
    return btn;
}
@end
