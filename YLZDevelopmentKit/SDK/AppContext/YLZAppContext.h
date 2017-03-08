//
//  YLZAppContext.h
//  YLZDevelopmentKit
//
//  Created by 萧宇 on 08/03/2017.
//  Copyright © 2017 ylzinfo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 运行环境枚举值

 - RuntimeEnvironmentDevelop:       开发环境
 - RuntimeEnvironmentTest:          测试环境
 - RuntimeEnvironmentPreRelease:    预发布环境
 - RuntimeEnvironmentRelease:       发布环境
 */
typedef NS_ENUM(NSUInteger, RuntimeEnvironment) {
    RuntimeEnvironmentDevelop,
    RuntimeEnvironmentTest,
    RuntimeEnvironmentPreRelease,
    RuntimeEnvironmentRelease,
};

/**
 应用相关信息， 其中未标注为 readonly 的属性均需要在初始化的时候由外部赋值
 */

@interface YLZAppContext : NSObject <NSCopying, NSMutableCopying>

/* 设备信息 */

/* 设备名称 e.g. @"My iPhone" */
@property (nonatomic, copy, readonly, nullable) NSString *name;
/* 设备类型 e.g. @"iPhone", @"iPod touch" */
@property (nonatomic, copy, readonly, nonnull) NSString *model;
/* 设备IMEI编号，设备的标识符 */
@property (nonatomic, copy, readonly, nonnull) NSString *imei;
/* 设备操作系统名称 e.g. @"iOS" */
@property (nonatomic, copy, readonly, nonnull) NSString *systemName;
/* 设备操作系统版本 e.g. @"10.2" */
@property (nonatomic, copy, readonly, nonnull) NSString *systemVersion;
/* 设备ppi e.g. @"326" */
@property (nonatomic, copy, readonly, nonnull) NSString *ppi;
/* 设备分辨率 e.g. CGSizeMake(640, 1136) */
@property (nonatomic, assign, readonly) CGSize resolution;

/* 运行环境信息 */

/* 运行环境 */
@property (nonatomic, assign) RuntimeEnvironment runtimeEnvironment;
/* 网络状态 */
@property (nonatomic, assign, readonly) NSUInteger networkStatus;

/**
 app context 单例

 @return context 单例
 */
+ (YLZAppContext * _Nonnull)sharedContext;

@end
