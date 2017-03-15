//
//  YLZNetworkManager.m
//  YLZDevelopmentKit
//
//  Created by 萧宇 on 15/03/2017.
//  Copyright © 2017 ylzinfo. All rights reserved.
//

#import "YLZNetworkManager.h"
#import <AFNetworking/AFNetworking.h>
#import <CocoaSPDY/SPDYProtocol.h>

@implementation YLZNetworkManager {
    AFHTTPSessionManager *_manager;
    YLZNetworkReachability *_reachability;
}

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
    
    /* 配置SPDY */
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    configuration.protocolClasses = @[[SPDYURLSessionProtocol class]];
    _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"https://api.github.com"] sessionConfiguration:configuration];
    
    return self;
}

/**
 使用 GCD 实现单例模式
 
 @return sharedManager
 */
+ (YLZNetworkManager *)sharedManager {
    static YLZNetworkManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[super allocWithZone:NULL] init];
    });
    return sharedManager;
}

/**
 override allocWithZone: 方法，确保使用 [YLZNetworkManager alloc] 得到的是 sharedManager
 
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

- (void)startMonitoringReachability {
    /* 配置网络状态类 */
    YLZNetworkReachability *reachability = [YLZNetworkReachability reachabilityForInternetConnection];
    _reachability = reachability;
    self.currentNetworkStatus = reachability.currentReachabilityStatus;
    [reachability startNotifier];
    
    /* 设置网络状态变换通知回调 */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kNetworkReachabilityChangedNotification object:nil];
}

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

#pragma mark - Call back method

/**
 网络状态变换通知回调
 
 @param notification 通知
 */
- (void)reachabilityChanged:(NSNotification *)notification {
    YLZNetworkReachability *currentReachability = [notification object];
    self.currentNetworkStatus = [currentReachability currentReachabilityStatus];
    switch (self.currentNetworkStatus) {
        case YLZNetworkStatusNotReachable:
            NSLog(@"网络不可用");
            break;
        case YLZNetworkStatusUnknown:
            NSLog(@"未知网络");
            break;
        case YLZNetworkStatusWWAN2G:
            NSLog(@"2G网络");
            break;
        case YLZNetworkStatusWWAN3G:
            NSLog(@"3G网络");
            break;
        case YLZNetworkStatusWWAN4G:
            NSLog(@"4G网络");
            break;
        case YLZNetworkStatusWiFi:
            NSLog(@"WiFi网络");
            break;
        default:
            break;
    }
}

@end
