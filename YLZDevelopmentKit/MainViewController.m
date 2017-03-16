//
//  MainViewController.m
//  YLZDevelopmentKit
//
//  Created by 萧宇 on 07/03/2017.
//  Copyright © 2017 ylzinfo. All rights reserved.
//

#import "MainViewController.h"
#import "YLZDevelopmentKit.h"
#import "YLZDNSMappingManager.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *ip = [[YLZDNSMappingManager sharedManager] resolvedUrl:@"https://api.daniellam.cn/ego/v1/user"];
    if (ip) {
        NSLog(@"%@", ip);
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reachabilityChanged:(NSNotification *)notification {
    YLZNetworkReachability *curReach = [notification object];
    YLZNetworkStatus netStatus = [curReach currentReachabilityStatus];
    switch (netStatus) {
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
