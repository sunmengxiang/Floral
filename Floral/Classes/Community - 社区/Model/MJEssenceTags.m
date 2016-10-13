//
//  MJEssenceTags.m
//  Floral
//
//  Created by 孙梦翔 on 16/10/13.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJEssenceTags.h"

@implementation MJEssenceTags
- (instancetype)initWithDict:(NSDictionary *)dict
{
    MJEssenceTags * tags = [[MJEssenceTags alloc] init];
    NSString * attachmetnSnipString = dict[@"attachmentSnap"];
    NSArray * urlArray = nil;
    if ([attachmetnSnipString containsString:@","]) {
        urlArray = [attachmetnSnipString componentsSeparatedByString:@","];
    }else{
        urlArray = @[attachmetnSnipString];
    }
//
//    [tags setValue:urlArrary forKey:@"tagUrlArray"];
    NSLog(@"urlArrary---%@",urlArray);
    [tags setValue:urlArray[0] forKey:@"tagUrl"];
    return tags;
}
@end
