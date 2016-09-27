//
//  MJMenuItem.m
//  Floral
//
//  Created by 孙梦翔 on 16/9/25.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJMenuItem.h"

@implementation MJMenuItem

- (instancetype)itemButtonWithImage:(UIImage *)image title:(NSString *)title
{
    MJMenuItem * item = [[MJMenuItem alloc] init];
    
    item.title = title;
    item.image = image;
    
    return item;
}
@end
