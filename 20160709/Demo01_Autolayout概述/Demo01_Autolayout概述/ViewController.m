//
//  ViewController.m
//  Demo01_Autolayout概述
//
//  Created by qingyun on 16/7/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *viewGreen = [UIView new];
    viewGreen.backgroundColor = [UIColor greenColor];
    viewGreen.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    viewGreen.frame = CGRectMake(0, 0, 100, self.view.frame.size.height);
    [self.view addSubview:viewGreen];
    
}

@end
