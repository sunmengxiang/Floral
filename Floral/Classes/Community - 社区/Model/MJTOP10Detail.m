//
//  MJTOP10Detail.m
//  Floral
//
//  Created by 孙梦翔 on 16/10/13.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJTOP10Detail.h"

@implementation MJTOP10Detail
- (instancetype)initWithDict:(NSDictionary*)dict
{
    MJTOP10Detail * top10 = [[MJTOP10Detail alloc] init];
    
    [top10 setValue:dict[@"userName"] forKey:@"userName"];
    [top10 setValue:dict[@"headImg"] forKey:@"headImg"];
    
    return top10;
}
@end
