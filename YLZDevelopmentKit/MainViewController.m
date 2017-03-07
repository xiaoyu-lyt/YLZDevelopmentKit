//
//  MainViewController.m
//  YLZDevelopmentKit
//
//  Created by 萧宇 on 07/03/2017.
//  Copyright © 2017 ylzinfo. All rights reserved.
//

#import "MainViewController.h"
#import "YLZDevelopmentKit.h"

@interface MainViewController ()<RequestCompletionDelegate>

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    YLZBaseApiManager *manager1 = [YLZBaseApiManager sharedManager];
    YLZBaseApiManager *manager2 = [manager1 copy];
    YLZBaseApiManager *manager3 = [[YLZBaseApiManager alloc] init];
    YLZBaseApiManager *manager4 = [manager3 mutableCopy];
    NSLog(@"%@\n%@\n%@\n%@", manager1, manager2, manager3, manager4);
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
