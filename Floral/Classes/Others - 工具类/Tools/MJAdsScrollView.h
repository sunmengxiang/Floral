//
//  MJAdsScrollView.h
//  轮播图
//
//  Created by 孙梦翔 on 16/9/27.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import <UIKit/UIKit.h>

// 轮播图
typedef NS_ENUM(NSUInteger, UIPageControlShowStyle)
{
    UIPageControlShowStyleNone,//default
    UIPageControlShowStyleLeft,
    UIPageControlShowStyleCenter,
    UIPageControlShowStyleRight,
};
@interface MJAdsScrollView : UIScrollView<UIScrollViewDelegate>
@property (retain,nonatomic,readonly) UIPageControl * pageControl;
@property (retain,nonatomic,readwrite) NSArray * imageArray;
@property (assign,nonatomic,readwrite) UIPageControlShowStyle  PageControlShowStyle;

@end
