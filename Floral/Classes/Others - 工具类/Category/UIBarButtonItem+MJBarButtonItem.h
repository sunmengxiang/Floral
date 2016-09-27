//
//  UIBarButtonItem+MJBarButtonItem.h
//  项目--导航栏的设置
//
//  Created by 孙梦翔 on 16/7/19.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (MJBarButtonItem)

+ (instancetype)itemWithImage:(UIImage*)image highlightImage:(UIImage *)highImage target:(id)target selector:(SEL)selector;

+ (instancetype)itemWithtitle:(NSString*)title normalFontColor:(UIColor *)normalColor hightFontColor:(UIColor *)hightFontColor target:(id)target selector:(SEL)selector;
@end
