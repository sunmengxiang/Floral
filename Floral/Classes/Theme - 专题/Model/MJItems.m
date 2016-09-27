//
//  MJItems.m
//  Floral
//
//  Created by 孙梦翔 on 16/9/25.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJItems.h"

@implementation MJItems
+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title
{
    MJItems *item = [[self alloc] init];
    
    item.image = image;
    item.title = title;
    
    return item;
}
@end
