//
//  MJThemeCategory.m
//  Floral
//
//  Created by 孙梦翔 on 16/9/28.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJThemeCategory.h"

@implementation MJThemeCategory
- (instancetype)initWithDict:(NSDictionary *)dict
{
    MJThemeCategory * cate = [[MJThemeCategory alloc] init];
    [cate setValuesForKeysWithDictionary:dict];
    
    return cate;
}
@end
