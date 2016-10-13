//
//  MJAdsScrollView.h
//  轮播图
//
//  Created by 孙梦翔 on 16/9/27.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import <UIKit/UIKit.h>

// 轮播图 出现加载缓慢问题，暂时使用第三方框架，后续再次 check 后使用
typedef NS_ENUM(NSUInteger, UIPageControlShowStyle)
{
    UIPageControlShowStyleNone,//default
    UIPageControlShowStyleLeft,
    UIPageControlShowStyleCenter,
    UIPageControlShowStyleRight,
};
@interface MJAdsScrollView : UIScrollView<UIScrollViewDelegate>
@property (retain,nonatomic,readonly) UIPageControl * pageControl;
@property (strong,nonatomic,readwrite) NSArray * imageArray;
@property (assign,nonatomic,readwrite) UIPageControlShowStyle  PageControlShowStyle;

@end
