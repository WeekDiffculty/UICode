//
//  ViewController.m
//  Demo02_NSLayoutConstraint_纯代码
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
    
    // 要求:让红色的view距离父控件上面100, 父控件左边50
    // 宽度: 100, 高度: 80;
    
    UIView *viewRed = [UIView new];
    viewRed.backgroundColor = [UIColor redColor];
    // 禁止把AutoResizing的属性转化成约束
    viewRed.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:viewRed];
    
    // 添加约束的时候, 一定要把约束添加到和两个相关联的对象的共同的父视图上
    // 添加约束前, 添加约束的view必须已经有父视图, 就是已经添加到view上了
    
    //viewRed.frame = CGRectMake(50, 100, 100, 80);
    
    /** 创建顶部和左边的约束 */
    NSLayoutConstraint *lcTop = [NSLayoutConstraint constraintWithItem:viewRed attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:100];
    [self.view addConstraint:lcTop];
    
    NSLayoutConstraint *lcLeft = [NSLayoutConstraint constraintWithItem:viewRed attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:50];
    
    [self.view addConstraint:lcLeft];
    
    // 创建宽度和高度的约束
    NSLayoutConstraint *lcWidth = [NSLayoutConstraint constraintWithItem:viewRed attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:kNilOptions multiplier:0 constant:100];
    
    NSLayoutConstraint *lcHeight = [NSLayoutConstraint constraintWithItem:viewRed attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:kNilOptions multiplier:0 constant:80];
    
    [viewRed addConstraints:@[lcWidth, lcHeight]];
    
    // 添加绿色视图
    UIView *viewGreen = [UIView new];
    viewGreen.backgroundColor = [UIColor greenColor];
    viewGreen.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:viewGreen];
    
    NSLayoutConstraint *lcGreenTop = [NSLayoutConstraint constraintWithItem:viewGreen attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:viewRed attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    NSLayoutConstraint *lcGreenLeft = [NSLayoutConstraint constraintWithItem:viewGreen attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:viewRed attribute:NSLayoutAttributeRight multiplier:1.0 constant:50];
    [self.view addConstraints:@[lcGreenTop, lcGreenLeft]];
    
    // 创建宽度和高度的约束
    NSLayoutConstraint *lcGreenWidth = [NSLayoutConstraint constraintWithItem:viewGreen attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:kNilOptions multiplier:0 constant:100];
    NSLayoutConstraint *lcGreenHeight = [NSLayoutConstraint constraintWithItem:viewGreen attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:kNilOptions multiplier:0 constant:80];
    [viewGreen addConstraints:@[lcGreenWidth, lcGreenHeight]];
}















@end
