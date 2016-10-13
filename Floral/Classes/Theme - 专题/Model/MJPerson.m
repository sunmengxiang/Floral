//
//  MJPerson.m
//  Floral
//
//  Created by 孙梦翔 on 16/9/26.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJPerson.h"

@implementation MJPerson

- (instancetype)initWithDict:(NSDictionary *)dict
{
    MJPerson * author = [[MJPerson alloc] init];
    [author setValue:dict[@"experience"] forKey:@"experience"];
    [author setValue:dict[@"headImg"] forKey:@"headImg"];
    [author setValue:dict[@"identity"] forKey:@"identity"];
    [author setValue:dict[@"subscibeNum"] forKey:@"subscibeNum"];
    [author setValue:dict[@"userName"] forKey:@"userName"];
    [author setValue:dict[@"id"] forKey:@"ID"];
    return author;
}
@end
