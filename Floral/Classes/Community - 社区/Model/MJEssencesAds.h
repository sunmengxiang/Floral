//
//  MJEssencesAds.h
//  Floral
//
//  Created by 孙梦翔 on 16/10/1.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MJEssencesAds : NSObject
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
/** adsID */
@property (strong ,nonatomic) NSString * AId;
/** createDate */
@property (strong ,nonatomic) NSDate * createDate;
/** id */
@property (strong ,nonatomic) NSString * ID;
/** IMGUrl */
@property (strong ,nonatomic) NSString * imageUrl;
/** title */
@property (strong ,nonatomic) NSString * title;
/** type */
@property (strong ,nonatomic) NSString * type;
/** url */
@property (strong ,nonatomic) NSString * url;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end
