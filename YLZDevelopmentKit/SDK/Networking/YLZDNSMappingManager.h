//
//  YLZDNSMappingManager.h
//  YLZDevelopmentKit
//
//  Created by 萧宇 on 15/03/2017.
//  Copyright © 2017 ylzinfo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YLZDNSMappingManager : NSObject

/**
 network manager 单例
 
 @return manager 单例
 */
+ (YLZDNSMappingManager * _Nonnull)sharedManager;

/**
 DNS 解析

 @param originalUrl 原始 URL
 @return 解析成功则返回解析后的 URL，解析失败则返回原始 URL
 */
- (NSString * _Nullable)resolvedUrl:(NSString * _Nonnull)originalUrl;

@end
