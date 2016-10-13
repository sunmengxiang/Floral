//
//  MJThemeCategory.h
//  Floral
//
//  Created by 孙梦翔 on 16/9/28.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 "createDate": "2015-08-21 18:54:03.0",
 "enName": "Home",
 "id": "ef590bfe-47f2-11e5-a94d-f0def1b6f49e",
 "img": "http://static.htxq.net/UploadFiles/2016/08/26/20160826192134699275.jpg",
 "name": "家居庭院",
 "order": 6*/
@interface MJThemeCategory : NSObject
/** date */
@property (strong ,nonatomic) NSDate * createDate;
/** enName */
@property (strong ,nonatomic) NSString * enName;
/** imgUrl */
@property (strong ,nonatomic) NSString * img;
/** name */
@property (strong ,nonatomic) NSString * name;
/** 顺序 */
@property (assign ,nonatomic) NSInteger  order;
/** 顺序 */
@property (strong ,nonatomic) NSString*  ID;

- (instancetype)initWithDict:(NSDictionary *)dict;
@end
