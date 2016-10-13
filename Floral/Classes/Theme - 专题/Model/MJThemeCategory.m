//
//  MJThemeCategory.m
//  Floral
//
//  Created by 孙梦翔 on 16/9/28.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJThemeCategory.h"
@interface MJThemeCategory ()

@end
@implementation MJThemeCategory
- (instancetype)initWithDict:(NSDictionary *)dict
{
    MJThemeCategory * cate = [[MJThemeCategory alloc] init];
    [cate setValue:dict[@"createDate"] forKey:@"createDate"];
    [cate setValue:dict[@"enName"] forKey:@"enName"];
    [cate setValue:dict[@"img"] forKey:@"img"];
    [cate setValue:dict[@"name"] forKey:@"name"];
    [cate setValue:dict[@"order"] forKey:@"order"];
    [cate setValue:dict[@"id"] forKey:@"ID"];
    return cate;
}
@end
