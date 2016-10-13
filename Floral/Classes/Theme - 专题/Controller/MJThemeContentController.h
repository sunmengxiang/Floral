//
//  MJThemeContentController.h
//  Floral
//
//  Created by 孙梦翔 on 16/9/30.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MJThemeCategory;
@interface MJThemeContentController : UIViewController

/** 文章类型的 id,方便 category 跳转使用 */
@property (strong ,nonatomic)  MJThemeCategory * categoryFromCategoryVc;
@end
