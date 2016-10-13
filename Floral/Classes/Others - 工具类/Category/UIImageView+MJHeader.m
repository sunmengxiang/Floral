//
//  UIImageView+MJHeader.m
//  项目--导航栏的设置
//
//  Created by 孙梦翔 on 16/7/18.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "UIImageView+MJHeader.h"
#import <UIImageView+WebCache.h>


@implementation UIImageView (MJHeader)

- (void)setHeader:(NSString *)url
{
    UIImage * placeImage = [[UIImage imageNamed:@"pc_default_avatar"] imageWithCircleImage];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        self.image = image?[image imageWithCircleImage] : placeImage;

    }];
}
@end
