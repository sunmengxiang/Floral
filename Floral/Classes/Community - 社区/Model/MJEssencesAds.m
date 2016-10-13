//
//  MJEssencesAds.m
//  Floral
//
//  Created by 孙梦翔 on 16/10/1.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJEssencesAds.h"
/*
 "AId": "c42a3c6f-6c75-427e-b590-05c512137fa0",
 "content": " ",
 "createDate": "2016-09-28 20:56:47.0",
 "enable": true,
 "endDate": "2017-09-28",
 "id": "bb177bd4-b04a-4a86-94f9-77e37318ab80",
 "imageUrl": "http://static.htxq.net/UploadFiles/2016/09/29/20160929095849609777.jpg",
 "order": 200,
 "startDate": "2016-09-28",
 "title": "从你的全世界路过",
 "type": "活动",
 "url": "d00dddac-527d-4bea-944f-340b05198b06"
 */
@implementation MJEssencesAds
- (instancetype)initWithDict:(NSDictionary *)dict
{
    MJEssencesAds * ads = [[MJEssencesAds alloc] init];
    [ads setValue:dict[@"AId"] forKey:@"AId"];
    [ads setValue:dict[@"createDate"] forKey:@"createDate"];
    [ads setValue:dict[@"id"] forKey:@"ID"];
    [ads setValue:dict[@"imageUrl"] forKey:@"imageUrl"];
    [ads setValue:dict[@"title"] forKey:@"title"];
    [ads setValue:dict[@"type"] forKey:@"type"];
    [ads setValue:dict[@"url"] forKey:@"url"];
    
    return ads;
}
@end
