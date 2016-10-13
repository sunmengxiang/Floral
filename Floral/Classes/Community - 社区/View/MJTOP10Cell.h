//
//  MJTOP10Cell.h
//  Floral
//
//  Created by 孙梦翔 on 16/10/13.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MJTOP10Detail;
@interface MJTOP10Cell : UITableViewCell
/** 模型数据 */
@property (strong ,nonatomic)  MJTOP10Detail * detail;
@property (assign,nonatomic) NSInteger order;
@end
