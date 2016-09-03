//
//  ViewController.m
//  Demo06.UIView&xib
//
//  Created by qingyun on 16/6/18.
//  Copyright © 2016年 qingyun. All rights reserved.
//

/**
 当手动为UIViewController的实例或者子类的实例创建xib关联的时候两步
 1，创建类和xib文件的关联
 2，filesOwner的view和xib视图的关联
 
 当手动为UIView实例或者其子类的实例创建关联的时候：
 * 什么也不用做
 
 */

#import "ViewController.h"
#import "QYLoginView.h"

@interface ViewController ()

@property (nonatomic, weak) QYLoginView *loginView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    QYLoginView *loginView = [QYLoginView loginView];
    loginView.frame = CGRectMake(100, 100, 200, 200);
    [self.view addSubview:loginView];
    
    self.loginView = loginView;
}























@end
