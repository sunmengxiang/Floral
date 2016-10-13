//
//  MJTOP10Detail.h
//  Floral
//
//  Created by 孙梦翔 on 16/10/13.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import <Foundation/Foundation.h>
//   "headImg": "http://static.htxq.net/UploadFiles/headimg/20161008222641364.jpg", 
//"userName": "Danica🍭",
@interface MJTOP10Detail : NSObject
/** headImg */
@property (strong ,nonatomic) NSString * headImg;
/** userName */
@property (strong ,nonatomic) NSString * userName;
- (instancetype)initWithDict:(NSDictionary*)dict;
@end
