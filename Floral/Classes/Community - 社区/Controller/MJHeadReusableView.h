//
//  MJHeadReusableView.h
//  Floral
//
//  Created by 孙梦翔 on 16/9/28.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MJHeadReusableView : UICollectionReusableView
@property (nonatomic,strong,readwrite) NSString * headerTitle;
/** 轮播图数据 */
@property (strong ,nonatomic)  NSArray * adsArray;
@end
