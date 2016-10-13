//
//  MJPerson.h
//  Floral
//
//  Created by 孙梦翔 on 16/9/26.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MJPerson : NSObject
/** 订阅数 */
@property (assign ,nonatomic)  NSInteger  experience;
/** icon */
@property (strong ,nonatomic) NSString * headImg;
/** personDetail */
@property (strong ,nonatomic) NSString * identity;
/** followCount */
@property (assign ,nonatomic)  NSInteger  subscibeNum;
/** name */
@property (strong ,nonatomic)  NSString *  userName;
/** categoryID */
@property (strong ,nonatomic) NSString * ID;

- (instancetype)initWithDict:(NSDictionary *)dict;
@end
