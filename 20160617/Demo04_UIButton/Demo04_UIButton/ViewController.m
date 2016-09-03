//
//  ViewController.m
//  Demo04_UIButton
//
//  Created by qingyun on 16/6/17.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(80, 80, 200, 200);
    [button setBackgroundColor:[UIColor orangeColor]];
    [button setBackgroundImage:[UIImage imageNamed:@"dog1"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"dog2"] forState:UIControlStateHighlighted];
    
    [button setTitle:@"你瞅啥~~？？" forState:UIControlStateNormal];
    [button setTitle:@"再瞅咬你！！" forState:UIControlStateHighlighted];
    
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
    
    [button addTarget:self action:@selector(tapAction:) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:button];
    
}

- (void)tapAction:(UIButton *)button {
    NSLog(@"我点点点点。。。");
}

@end
