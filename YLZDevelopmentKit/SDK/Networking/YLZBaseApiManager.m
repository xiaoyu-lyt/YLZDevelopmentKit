//
//  YLZBaseApiManager.m
//  YLZDevelopmentKit
//
//  Created by 萧宇 on 07/03/2017.
//  Copyright © 2017 ylzinfo. All rights reserved.
//

#import "YLZBaseApiManager.h"
#import <AFNetworking/AFNetworking.h>

@implementation YLZBaseApiManager

#pragma mark - Singleton

/**
 初始化方法

 @return self
 */
- (instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    return self;
}

/**
 使用 GCD 实现单例模式

 @return sharedManager
 */
+ (YLZBaseApiManager *)sharedManager {
    static YLZBaseApiManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[super allocWithZone:NULL] init];
    });
    return sharedManager;
}

/**
 override allocWithZone: 方法，确保使用 [YLZBaseApiManager alloc] 得到的是 sharedManager

 @param zone zone
 @return sharedManager
 */
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [self sharedManager];
}

/**
 override copyWithZone: 方法，确保使用 [manager copy] 得到的是 sharedManager

 @param zone zone
 @return sharedManager
 */
- (id)copyWithZone:(NSZone *)zone {
    return self;
}

/**
 override mutableCopyWithZone: 方法，确保使用 [manager mutableCopy] 得到的是 sharedManager

 @param zone zone
 @return sharedManager
 */
- (id)mutableCopyWithZone:(NSZone *)zone {
    return self;
}

#pragma mark - Public method

- (void)requestApi:(NSString *)url method:(HTTPMethod)method params:(NSDictionary *)params {
    
    /* 检查回调代理是否设置 */
    if (!self.delegate) {
        NSLog(@"未设置回调代理！");
        return;
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    /* 判断请求方法 */
    switch (method) {
        case HTTPMethodGet: {
            [manager GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [self.delegate requestDidSuccessWithResponseObject:responseObject];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self.delegate requestDidFailureWithError:error];
            }];
        }
            break;
        case HTTPMethodPost: {
            [manager POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [self.delegate requestDidSuccessWithResponseObject:responseObject];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self.delegate requestDidFailureWithError:error];
            }];
        }
            break;
        case HTTPMethodPut: {
            [manager PUT:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [self.delegate requestDidSuccessWithResponseObject:responseObject];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self.delegate requestDidFailureWithError:error];
            }];
        }
            break;
        case HTTPMethodDelete: {
            [manager DELETE:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                [self.delegate requestDidSuccessWithResponseObject:responseObject];
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                [self.delegate requestDidFailureWithError:error];
            }];
        }
            break;
        default:
            NSLog(@"请设置正确的请求方法！");
            break;
    }
    
}

@end
