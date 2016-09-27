//
//  MJNetTools.m
//  Floral
//
//  Created by 孙梦翔 on 16/9/26.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJNetTools.h"

@interface AFHTTPSessionManager (share)
// 设置请求为单例
+ (instancetype)shareManager;
@end
@implementation AFHTTPSessionManager (share)

//- (NSURLSessionDataTask *)GET:(NSString *)URLString parameters:(id)parameters progress:(void (^)(NSProgress * _Nonnull))downloadProgress success:(void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success failure:(void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure{}
+ (instancetype)shareManager
{
    static AFHTTPSessionManager * _instance;
    static dispatch_once_t once_token;
    dispatch_once(&once_token, ^{
        _instance = [AFHTTPSessionManager manager];
        _instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain",@"text/javascript",@"text/html", nil];
    });
    return _instance;
}
@end

@implementation MJNetTools

// theme 请求数据获取


@end
