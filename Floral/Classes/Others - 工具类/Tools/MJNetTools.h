//
//  MJNetTools.h
//  Floral
//
//  Created by 孙梦翔 on 16/9/26.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
// 请求成功之后回调的 Block
typedef void(^successBlock)(id  responseObject);

// 请求失败之后回调的 Block
typedef void(^failureBlock)(NSError *  error);
@interface MJNetTools : NSObject
// 精选的请求方法
+ (void)requestThemeParameters:(id)parameters success:(successBlock)success failure:(failureBlock)failure;
+ (void)requestThemeCategory:(successBlock)success failure:(failureBlock)failure;
+ (void)requestCommunityAds:(successBlock)success failure:(failureBlock)failure;
// 社区的请求方法
+ (void)requestCommunityEssenceParameter:(id)paramater success:(successBlock)success failure:(failureBlock)failure;
// community TOP10请求
+ (void)requestCommunityTOP10:(successBlock)success failure:(failureBlock)failure;
@end
