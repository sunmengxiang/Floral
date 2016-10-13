//
//  MJAuthorHeadView.h
//  Floral
//
//  Created by 孙梦翔 on 16/9/30.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MJTheme;
@interface MJAuthorHeadView : UIView

/** THEM */
@property (strong ,nonatomic) MJTheme * theme;

+ (instancetype)authorHeaderView;
@end
