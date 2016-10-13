//
//  MJEssenceTags.h
//  Floral
//
//  Created by 孙梦翔 on 16/10/13.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import <Foundation/Foundation.h>
//"appoint": 5,
//"attachment": "http://static.htxq.net/UploadFiles/2016/10/13/20161013030831284.jpg,http://static.htxq.net/UploadFiles/2016/10/13/20161013030831457.jpg,http://static.htxq.net/UploadFiles/2016/10/13/20161013030831560.jpg",
//"attachmentSnap": "http://static.htxq.net/UploadFiles/2016/10/13/snap_285_20161013030831284.jpg,http://static.htxq.net/UploadFiles/2016/10/13/snap_285_20161013030831457.jpg,http://static.htxq.net/UploadFiles/2016/10/13/snap_285_20161013030831561.jpg",
//"audit": 0,
//"circleType": {},
//"comment": 0,
//"content": "半夜睡不着，就做做爱花的梦好了，反正这样也挺美好！上次上课的花盒，还是挺有成就感。不蓝瘦，也不香菇！",
//"createDate": "2016-10-13 03:08:32.0",
//"customer": {},
//"hasAppoint": false,
//"id": "077787f5-2231-4916-b34b-13a7773f0eee",
//"jian": true,
//"jianXuhao": 0,
//"jingIcon": "",
//"keywords": "",
//"lastAdminName": "",
//"lastOperTime": "",
//"newest": false,
//"newestXuhao": 0,
//"read": 70,
//"release": 1,
//"share": 0,
//"sharePageUrl": "http://m.htxq.net//servlet/UserBbsServlet?action=sharePreview&bbsId=077787f5-2231-4916-b34b-13a7773f0eee",
//"title": ""
@interface MJEssenceTags : NSObject
@property (nonatomic,assign) NSInteger appoint ;
/** 图片 */
@property (strong ,nonatomic)  NSString * attachment;
/** 小图 */
@property (strong ,nonatomic)  NSString * attachmentSnap;
/** audit */
@property (assign ,nonatomic)  NSInteger  audit;
/** circleType */
@property (strong ,nonatomic) NSArray * circleType;
/** comment */
@property ( assign ,nonatomic)  NSInteger  comment;
/** content */
@property (strong ,nonatomic) NSString * content;
/** date */
@property (strong ,nonatomic) NSDate * createDate;
/** customer */
@property (strong ,nonatomic) NSArray * customer;
/** hasAppoint */
@property ( assign ,nonatomic)  BOOL hasAppoint;
/** id */
@property (strong ,nonatomic) NSString * id;
/** jian */
@property ( assign ,nonatomic)  BOOL  jian;
/** jianxuhao */
@property ( assign ,nonatomic)  BOOL  jianXuhao;
/** jingIcon */
@property (strong ,nonatomic) NSString * jingIcon;
/** keyWord */
@property (strong ,nonatomic) NSString * keyWords;
/** lastAdminName */
@property (strong ,nonatomic) NSString * lastAdminName;
/** lastOperTime */
@property (strong ,nonatomic) NSString * lastOperTime;
/** newst */
@property ( assign ,nonatomic)  BOOL  newest;
/** newXuhao */
@property ( assign ,nonatomic)  NSInteger  newestXuhao;
/** read */
@property ( assign ,nonatomic)  NSInteger  read;
/** release */
@property ( assign ,nonatomic)  NSInteger  relea;
/** share */
@property ( assign ,nonatomic)  NSInteger  share;
/** shareUrl */
@property (strong ,nonatomic) NSString * sharePageUrl;
/** title */
@property (strong ,nonatomic) NSString * title;


/** tagUrlArray */
@property (strong ,nonatomic) NSArray * tagUrlArray;
/** tagUrl */
@property (strong ,nonatomic) NSString * tagUrl;

- (instancetype)initWithDict:(NSDictionary*)dict;
@end
