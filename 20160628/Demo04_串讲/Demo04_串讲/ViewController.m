//
//  ViewController.m
//  Demo04_串讲
//
//  Created by qingyun on 16/6/28.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITextField *textField = [UITextField new];
    textField.frame = CGRectMake(50, 100, 200, 40);
    [self.view addSubview:textField];
    textField.delegate = self;
    textField.backgroundColor = [UIColor orangeColor];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldClear:(UITextField *)textField {
    return YES;
}

@end
