//
//  YLZDNSMappingManager.m
//  YLZDevelopmentKit
//
//  Created by 萧宇 on 15/03/2017.
//  Copyright © 2017 ylzinfo. All rights reserved.
//

#import "YLZDNSMappingManager.h"

@implementation YLZDNSMappingManager {
    NSDictionary *_dnsMappingDictionary;
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
    
    /* 读取 DNS 映射信息 */
    if (_dnsMappingDictionary == nil) {
        [self getDNSMappingFromFile];
    }
    
    return self;
}

/**
 使用 GCD 实现单例模式
 
 @return sharedManager
 */
+ (YLZDNSMappingManager *)sharedManager {
    static YLZDNSMappingManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[super allocWithZone:NULL] init];
    });
    return sharedManager;
}

/**
 override allocWithZone: 方法，确保使用 [YLZDNSMappingManager alloc] 得到的是 sharedManager
 
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

- (NSString *)resolvedUrl:(NSString *)originalUrl {
    /* 获取当前 URL 中的域名部分 */
    NSString *domain = [self getDomainFromUrlString:originalUrl];
    if (domain == nil || domain.length == 0) {
        return originalUrl;
    }
    
    NSLog(@"%@", _dnsMappingDictionary);
    return nil;
    
    /* 遍历当前映射，如匹配成功则返回解析后的 URL，否则返回原始 URL */
    for (NSString *key in _dnsMappingDictionary.allKeys) {
        if ([domain isEqualToString:key]) {
            return [originalUrl stringByReplacingOccurrencesOfString:domain withString:[NSString stringWithFormat:@"%@/", _dnsMappingDictionary[key]]];
        }
    }
    return originalUrl;
}

#pragma mark - Private method

/**
 从本地文件中读取 DNS 映射信息
 */
- (void)getDNSMappingFromFile {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"DNSMapping" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSError *error;
    _dnsMappingDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                            options:NSJSONReadingAllowFragments
                                                              error:&error];
}

/**
 从 URL 中截取域名部分，用于 DNS 匹配

 @param url 原始 URL
 @return URL 中的域名部分
 */
- (NSString *)getDomainFromUrlString:(NSString *)url {
    NSString *pattern = @"http[s]{0,1}://[a-zA-Z0-9\\.\\-]+/";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:0 error:nil];
    NSTextCheckingResult *matches = [regex firstMatchInString:url options:0 range:NSMakeRange(0, url.length)];
    return [url substringWithRange:matches.range];
}

@end
