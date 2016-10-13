//
//  MJTheme.h
//  Floral
//
//  Created by 孙梦翔 on 16/9/26.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MJPerson;
@class MJThemeCategory;
@interface MJTheme : NSObject
/** creatDate */
@property (strong ,nonatomic) NSDate * createDate;
/** tagImg */
@property (strong ,nonatomic) NSString * img;
/** order */
@property ( assign ,nonatomic)  NSInteger  order;
/** 文章关键字 */
@property (strong ,nonatomic) NSString * keywords;
/** pageUrl/文章链接 */
@property (strong ,nonatomic) NSString * pageUrl;
/** 分享链接 */
@property (strong ,nonatomic)  NSString * sharePageUrl;

/** title */
@property (strong ,nonatomic) NSString * title;
/** 评论数 */
@property ( assign ,nonatomic)  NSUInteger  fnCommentNum;
/** 分享数 */
@property ( assign ,nonatomic) NSUInteger  share;
/** 喜欢数 */
@property ( assign ,nonatomic) NSUInteger  appoint;
/** 阅读数 */
@property ( assign ,nonatomic)  NSUInteger  read;

/** bigImg */
@property (strong ,nonatomic) NSString * smallIcon;
/** tag */
@property (strong ,nonatomic) NSString * name;
/** 文章描述 */
@property (strong ,nonatomic)  NSString * desc;
/** videoUrl */
@property (strong ,nonatomic) NSString * videoUrl;
/** 作者信息*/
@property (strong,nonatomic) MJPerson * author;
/** 分类信息*/
@property (strong,nonatomic) MJThemeCategory * category;
/** bigItemHeight*/
@property ( assign ,nonatomic) CGSize  bigItemSize;
/** smallItemHeight*/
@property ( assign ,nonatomic) CGSize  smallItemSize;

- (instancetype)initWithDict:(NSDictionary*)dict;
@end

