//
//  UIImage+MJCircleImage.m
//  项目--导航栏的设置
//
//  Created by 孙梦翔 on 16/7/17.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "UIImage+MJCircleImage.h"


@implementation UIImage (MJCircleImage)


- (UIImage *)imageWithCircleImage
{
// 开启上下文
    UIGraphicsBeginImageContextWithOptions(self.size, 0, 0);
    
//    获取上下文
    CGContextRef ref  = UIGraphicsGetCurrentContext();
    

    CGContextAddEllipseInRect(ref, CGRectMake(0, 0, self.size.width, self.size.height));
    
    CGContextClip(ref);
    
    [self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    
//    拿到图片
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
//    关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}
@end
