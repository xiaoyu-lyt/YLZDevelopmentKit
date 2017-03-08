//
//  MainViewController.m
//  YLZDevelopmentKit
//
//  Created by 萧宇 on 07/03/2017.
//  Copyright © 2017 ylzinfo. All rights reserved.
//

#import "MainViewController.h"
#import "YLZDevelopmentKit.h"
#import "LoginApiManager.h"
#import "YLZAppContext.h"

@interface MainViewController ()<RequestCompletionDelegate>

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Request Completion Delegate
- (void)requestDidSuccessWithResponseObject:(id)responseObject {
    NSLog(@"success:%@", responseObject);
}

- (void)requestDidFailureWithError:(NSError *)error {
    NSLog(@"failure:%ld", (long)error.code);
}

@end
