//
//  MJCommonAPIConstant.m
//  Floral
//
//  Created by 孙梦翔 on 16/9/26.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJCommonAPIConstant.h"

@implementation MJCommonAPIConstant
#pragma mark - Theme-首页的请求路径
/** Theme 左侧分类请求API GET 9.27已修正*/
NSString * const kMJThemeCategoryAPI = @"http://m.htxq.net/servlet/SysCategoryServlet?action=getListNew";
/** Theme 文章请求头 9.27 已修正*/
NSString * const kMJThemeArticleListHead = @"http://m.htxq.net/servlet/SysArticleServlet";

#pragma mark -community-社区的请求路径
/** 每周TOP10的请求路径*/
NSString *const kMJCommunityTOP10API = @"http://ec.htxq.net/servlet/SysArticleServlet?currentPageIndex=0&pageSize=10";
/** 社区页面头部轮播图列表 10.1已修正*/
NSString *const kMJCommunityAdsListAPI = @"http://m.htxq.net/servlet/SysAdvertisingServlet?action=getAdList";
/**社区页面请求*/
NSString *const kMJCommunityAPI  = @"http://m.htxq.net/servlet/UserBbsServlet?action=getJianOrJingList&currentPageIndex=0&pageSize=0&type=荐";

#pragma mark -商场页面的请求
/**商场页面轮播图请求*/
NSString *const kMJMallAdsAPI = @"http://ec.htxq.net/rest/htxq/index/carousel";
/** 商场页面商品列表请求/jing*/
NSString *const kMallShopsListAPI = @"http://ec.htxq.net/rest/htxq/index";

@end
