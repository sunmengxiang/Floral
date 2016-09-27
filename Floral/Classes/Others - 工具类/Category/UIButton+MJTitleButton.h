//
//  UIButton+MJTitleButton.h
//  Floral
//
//  Created by 孙梦翔 on 16/9/25.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (MJTitleButton)
+ (instancetype)buttonWithtitle:(NSString*)title normalFontColor:(UIColor *)normalColor hightFontColor:(UIColor *)hightFontColor target:(id)target selector:(SEL)selector;
@end
