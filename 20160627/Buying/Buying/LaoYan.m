//
//  ViewController.m
//  Buying
//
//  Created by qingyun on 16/6/27.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "LaoYan.h"
#import "UserViewController.h"

@interface LaoYan () <UserDelegate>

@end

@implementation LaoYan

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)maiYan {
    UserViewController *vcUser = [UserViewController new];
    vcUser.strBrand = @"旺财";
    vcUser.delegate = self;
    [self.navigationController pushViewController:vcUser animated:YES];
}

#pragma mark - UserDelegate
- (void)user:(UserViewController *)user didCompleteBuyingSmoke:(Smoke *)smoke {
    NSLog(@"%@", user.strBrand);
    NSLog(@"%@", smoke.strBrand);
}

@end
