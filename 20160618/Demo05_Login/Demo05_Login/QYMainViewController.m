//
//  QYMainViewController.m
//  Demo05_Login
//
//  Created by qingyun on 16/6/18.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYMainViewController.h"

@interface QYMainViewController ()

@end

@implementation QYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)backAction {
    // 返回到之前页面
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc {
    NSLog(@"%s", __func__);
}

@end
