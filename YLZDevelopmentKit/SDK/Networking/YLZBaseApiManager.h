//
//  YLZBaseApiManager.h
//  YLZDevelopmentKit
//
//  Created by 萧宇 on 07/03/2017.
//  Copyright © 2017 ylzinfo. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 请求方法枚举值

 - HTTPMethodGet:       Get请求
 - HTTPMethodPost:      Post请求
 - HTTPMethodPut:       Put请求
 - HTTPMethodDelete:    Delete请求
 */
typedef NS_ENUM(NSUInteger, HTTPMethod) {
    HTTPMethodGet       = 0,
    HTTPMethodPost      = 1,
    HTTPMethodPut       = 2,
    HTTPMethodDelete    = 3,
};

/**
 请求完成后的回调协议
 */
@protocol RequestCompletionDelegate <NSObject>

@required

/**
 网络请求成功后的回调方法

 @param responseObject 服务器返回的数据
 */
- (void)requestDidSuccessWithResponseObject:(id _Nullable)responseObject;

/**
 网络请求失败后的回调方法

 @param error 错误信息
 */
- (void)requestDidFailureWithError:(NSError * _Nullable)error;

@end

/**
 网络请求 manager 基类，实际项目中各请求的 manager 均继承自该基类
 */
@interface YLZBaseApiManager : NSObject <NSCopying, NSMutableCopying>

/* 回调函数代理，请求完成时通过该代理调用相应方法 */
@property (nonatomic, weak, nullable) id <RequestCompletionDelegate> delegate;

/**
 api manager 单例

 @return manager 单例
 */
+ (YLZBaseApiManager * _Nonnull)sharedManager;

/**
 网络请求方法，所有的网络请求将在这里面进行封装

 @param url     API地址
 @param method  请求方法
 @param params  请求参数
 */
- (void)requestApi:(NSString * _Nonnull)url method:(HTTPMethod)method params:(NSDictionary * _Nullable)params;

@end
