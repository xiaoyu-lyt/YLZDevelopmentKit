//
//  YLZNetworkReachability.h
//  YLZDevelopmentKit
//
//  Created by 萧宇 on 08/03/2017.
//  Copyright © 2017 ylzinfo. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 网络状态枚举值

 - YLZNetworkStatusNotReachable:    无网络
 - YLZNetworkStatusUnknown:         未知网络
 - YLZNetworkStatusWWAN2G:          2G网络
 - YLZNetworkStatusWWAN3G:          3G网络
 - YLZNetworkStatusWWAN4G:          4G网络
 - YLZNetworkStatusWiFi:            WiFi网络
 */
typedef NS_ENUM(NSUInteger, YLZNetworkStatus) {
    YLZNetworkStatusNotReachable    = 0,
    YLZNetworkStatusUnknown         = 1,
    YLZNetworkStatusWWAN2G          = 2,
    YLZNetworkStatusWWAN3G          = 3,
    YLZNetworkStatusWWAN4G          = 4,
    YLZNetworkStatusWiFi            = 9,
};

/* 网络状态变更通知名称 */
extern NSString *kNetworkReachabilityChangedNotification;

/**
 网络状态类，监听当前设备的网络状态并通知 NotificationCenter
 */
@interface YLZNetworkReachability : NSObject

+ (instancetype)reachabilityWithHostName:(NSString *)hostName;
+ (instancetype)reachabilityWithAddress:(const struct sockaddr *)hostAddress;
+ (instancetype)reachabilityForInternetConnection;

- (BOOL)startNotifier;
- (void)stopNotifier;
- (YLZNetworkStatus)currentReachabilityStatus;

@end
