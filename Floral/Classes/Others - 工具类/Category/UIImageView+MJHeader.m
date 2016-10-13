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
    NSDate * outdate = [NSDate date];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        NSDate * date = [NSDate date];
        self.image = image?[image imageWithCircleImage] : placeImage;
        double timeDelta = [[NSDate date] timeIntervalSinceDate:date];
        
        NSLog(@"inner----%f",timeDelta);
    }];
    double timeDelta = [[NSDate date] timeIntervalSinceDate:outdate];
    
    NSLog(@"out----%f",timeDelta);
}
@end
