//
//  YLZAppContext.m
//  YLZDevelopmentKit
//
//  Created by 萧宇 on 08/03/2017.
//  Copyright © 2017 ylzinfo. All rights reserved.
//

#import "YLZAppContext.h"

@implementation YLZAppContext

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
 
 @return sharedContext
 */
+ (YLZAppContext *)sharedContext {
    static YLZAppContext *sharedContext = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedContext = [[super allocWithZone:NULL] init];
    });
    return sharedContext;
}

/**
 override allocWithZone: 方法，确保使用 [YLZAppContext alloc] 得到的是 sharedContext
 
 @param zone zone
 @return sharedContext
 */
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [self sharedContext];
}

/**
 override copyWithZone: 方法，确保使用 [context copy] 得到的是 sharedContext
 
 @param zone zone
 @return sharedContext
 */
- (id)copyWithZone:(NSZone *)zone {
    return self;
}

/**
 override mutableCopyWithZone: 方法，确保使用 [context mutableCopy] 得到的是 sharedContext
 
 @param zone zone
 @return sharedContext
 */
- (id)mutableCopyWithZone:(NSZone *)zone {
    return self;
}

#pragma mark - 设备信息

- (NSString *)name {
    return [[UIDevice currentDevice] name];
}

- (NSString *)model {
    return [[UIDevice currentDevice] model];
}

- (NSString *)imei {
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}

- (NSString *)systemName {
    return [[UIDevice currentDevice] systemName];
}

- (NSString *)systemVersion {
    return [[UIDevice currentDevice] systemVersion];
}

- (NSString *)ppi {
    NSString *ppi = @"";
    if ([self.name isEqualToString:@"iPod1,1"] ||
        [self.name isEqualToString:@"iPod2,1"] ||
        [self.name isEqualToString:@"iPod3,1"] ||
        [self.name isEqualToString:@"iPhone1,1"] ||
        [self.name isEqualToString:@"iPhone1,2"] ||
        [self.name isEqualToString:@"iPhone2,1"]) {
        ppi = @"163";
    } else if ([self.name isEqualToString:@"iPod4,1"] ||
               [self.name isEqualToString:@"iPhone3,1"] ||
               [self.name isEqualToString:@"iPhone3,3"] ||
               [self.name isEqualToString:@"iPhone4,1"]) {
        ppi = @"326";
    } else if ([self.name isEqualToString:@"iPhone5,1"] ||
               [self.name isEqualToString:@"iPhone5,2"] ||
               [self.name isEqualToString:@"iPhone5,3"] ||
               [self.name isEqualToString:@"iPhone5,4"] ||
               [self.name isEqualToString:@"iPhone6,1"] ||
               [self.name isEqualToString:@"iPhone6,2"]) {
        ppi = @"326";
    } else if ([self.name isEqualToString:@"iPhone7,1"]) {
        ppi = @"401";
    } else if ([self.name isEqualToString:@"iPhone7,2"]) {
        ppi = @"326";
    } else if ([self.name isEqualToString:@"iPad1,1"] ||
               [self.name isEqualToString:@"iPad2,1"]) {
        ppi = @"132";
    } else if ([self.name isEqualToString:@"iPad3,1"] ||
               [self.name isEqualToString:@"iPad3,4"] ||
               [self.name isEqualToString:@"iPad4,1"] ||
               [self.name isEqualToString:@"iPad4,2"]) {
        ppi = @"264";
    } else if ([self.name isEqualToString:@"iPad2,5"]) {
        ppi = @"163";
    } else if ([self.name isEqualToString:@"iPad4,4"] ||
               [self.name isEqualToString:@"iPad4,5"]) {
        ppi = @"326";
    } else {
        ppi = @"264";
    }
    
    return ppi;
}

- (CGSize)resolution {
    CGSize resolution = CGSizeZero;
    if ([self.name isEqualToString:@"iPod1,1"] ||
        [self.name isEqualToString:@"iPod2,1"] ||
        [self.name isEqualToString:@"iPod3,1"] ||
        [self.name isEqualToString:@"iPhone1,1"] ||
        [self.name isEqualToString:@"iPhone1,2"] ||
        [self.name isEqualToString:@"iPhone2,1"]) {
        resolution = CGSizeMake(320, 480);
    } else if ([self.name isEqualToString:@"iPod4,1"] ||
               [self.name isEqualToString:@"iPhone3,1"] ||
               [self.name isEqualToString:@"iPhone3,3"] ||
               [self.name isEqualToString:@"iPhone4,1"]) {
        resolution = CGSizeMake(640, 960);
    } else if ([self.name isEqualToString:@"iPhone5,1"] ||
               [self.name isEqualToString:@"iPhone5,2"] ||
               [self.name isEqualToString:@"iPhone5,3"] ||
               [self.name isEqualToString:@"iPhone5,4"] ||
               [self.name isEqualToString:@"iPhone6,1"] ||
               [self.name isEqualToString:@"iPhone6,2"]) {
        resolution = CGSizeMake(640, 1136);
    } else if ([self.name isEqualToString:@"iPhone7,1"]) {
        resolution = CGSizeMake(1080, 1920);
    } else if ([self.name isEqualToString:@"iPhone7,2"]) {
        resolution = CGSizeMake(750, 1334);
    } else if ([self.name isEqualToString:@"iPad1,1"] ||
               [self.name isEqualToString:@"iPad2,1"]) {
        resolution = CGSizeMake(768, 1024);
    } else if ([self.name isEqualToString:@"iPad3,1"] ||
               [self.name isEqualToString:@"iPad3,4"] ||
               [self.name isEqualToString:@"iPad4,1"] ||
               [self.name isEqualToString:@"iPad4,2"]) {
        resolution = CGSizeMake(1536, 2048);
    } else if ([self.name isEqualToString:@"iPad2,5"]) {
        resolution = CGSizeMake(768, 1024);
    } else if ([self.name isEqualToString:@"iPad4,4"] ||
               [self.name isEqualToString:@"iPad4,5"]) {
        resolution = CGSizeMake(1536, 2048);
    } else {
        resolution = CGSizeMake(640, 960);
    }
    
    return resolution;
}

#pragma mark - 运行环境信息

- (NSUInteger)networkStatus {
    return 1;
}

@end
