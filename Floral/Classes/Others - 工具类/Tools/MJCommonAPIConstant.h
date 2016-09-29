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
/** Theme 左侧分类请求API GET */
UIKIT_EXTERN NSString * const kMJThemeCategoryAPI;
/** Theme 文章请求头 POST*/
UIKIT_EXTERN NSString * const kMJThemeArticleListHead;
/** 获取首页的文章请求体//需添加&currentPageIndex=0 下一页改为1 &isVideo=false */
UIKIT_EXTERN NSString * const kMJThemeArticleListBody;
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
