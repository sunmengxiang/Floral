//
//  MJNetTools.m
//  Floral
//
//  Created by 孙梦翔 on 16/9/26.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJNetTools.h"
#import "MJCommonAPIConstant.h"
@interface AFHTTPSessionManager (Shared)
// 设置为单利
+ (instancetype)sharedManager;
@end

@implementation AFHTTPSessionManager (Shared)

+ (instancetype)sharedManager {
    
    static AFHTTPSessionManager *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [AFHTTPSessionManager manager];
        _instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain", @"text/json", @"text/javascript", @"text/html", nil];
    });
    return _instance;
}
@end

@implementation MJNetTools

// theme 文章 请求数据获取
+ (void)requestThemeParameters:(id)parameters success:(successBlock)success failure:(failureBlock)failure
{
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager sharedManager];
    
    [manager GET:kMJThemeArticleListHead parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            failure(error);
        }
    }];
}
// theme 分类栏 请求数据获取
+ (void)requestThemeCategory:(successBlock)success failure:(failureBlock)failure
{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager sharedManager];
    
    [manager GET:kMJThemeCategoryAPI parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            failure(error);
        }
    }];
}
// community 精选 广告轮播图数据
+ (void)requestCommunityAds:(successBlock)success failure:(failureBlock)failure
{
    AFHTTPSessionManager * manager = [AFHTTPSessionManager sharedManager];
    
    [manager GET:kMJCommunityAdsListAPI parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
        success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
        failure(error);
        }
    }];
}


@end
