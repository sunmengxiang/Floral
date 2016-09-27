//
//  MJCommonAPIConstant.h
//  Floral
//
//  Created by 孙梦翔 on 16/9/26.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MJCommonAPIConstant : NSObject
#pragma mark - Theme-首页的请求路径
// 获取所有的主题分类
UIKIT_EXTERN NSString *const kMJThemeCategoryListAPI;
// 获取首页的文章列表
UIKIT_EXTERN NSString *const kMJThemeArticleListAPI;
// 获取首页视频列表
UIKIT_EXTERN NSString *const kMJThemeVideoListAPI;
// 获取首页 menu 列表
UIKIT_EXTERN NSString *const kMJThemeMenuListAPI;
// 获取文章详情列表
UIKIT_EXTERN NSString *const kMJThemeArticleAPI;

#pragma mark -community-社区的请求路径
// 每周 TOP10的获取
UIKIT_EXTERN NSString *const kMJCommunityTOP10API;
// 社区页面头部轮播图列表
UIKIT_EXTERN NSString *const kMJCommunityAdsListAPI;
@end
