//
//  UIImage+MJRenderStyle.m
//  Floral
//
//  Created by 孙梦翔 on 16/9/25.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "UIImage+MJRenderStyle.h"
// 控制 image 的 renderMode,在这里设置就可以控制项目中所有的图片 renderMode
@implementation UIImage (MJRenderStyle)
- (UIImageRenderingMode)renderingMode
{
    return UIImageRenderingModeAlwaysOriginal;
}
@end
