//
//  AppDelegate.m
//  YLZDevelopmentKit
//
//  Created by 萧宇 on 07/03/2017.
//  Copyright © 2017 ylzinfo. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "YLZNetworkManager.h"

@interface AppDelegate ()

@property (nonatomic) YLZNetworkReachability *reachability;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /* 监听网络状态，必须经过这三步配置才能成功监听 */
//    YLZNetworkReachability *reachability = [YLZNetworkReachability reachabilityWithHostName:@"www.baidu.com"];
//    YLZNetworkReachability *reachability = [YLZNetworkReachability reachabilityForInternetConnection];
//    self.reachability = reachability;
//    [YLZBaseApiManager sharedManager].currentNetworkStatus = reachability.currentReachabilityStatus;
//    [reachability startNotifier];
    [[YLZNetworkManager sharedManager] startMonitoringReachability];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    MainViewController *myViewController = [[MainViewController alloc] init];
    self.window.rootViewController = myViewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
