//
//  ViewController.m
//  Demo03_VFL
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
    
    // VFL: Visual Format Language
    
    
    // 要求:让红色的view距离父控件上面100, 父控件左边50
    // 宽度: 100, 高度: 80;
    
    UIView *viewRed = [UIView new];
    viewRed.backgroundColor = [UIColor redColor];
    // 禁止把AutoResizing的属性转化成约束
    viewRed.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:viewRed];
    
    // 添加绿色视图
    UIView *viewGreen = [UIView new];
    viewGreen.backgroundColor = [UIColor greenColor];
    viewGreen.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:viewGreen];
    
    // vfl中不要添加任何的空格
    
    NSNumber *gapHor = @50;
    NSNumber *gapVer = @100;
    NSNumber *width = @100;
    NSNumber *height = @80;
    
    // 1, 创建水平方向上的约束
    NSString *strViewRedHor = @"H:|-gapHor-[viewRed(width)]-gapHor-[viewGreen(==viewRed)]";
    NSDictionary *dicViews = NSDictionaryOfVariableBindings(viewRed, viewGreen);
    // metrics: 帮我们把VFL中的数字提出来
    NSDictionary *dicMetrics = @{@"gapHor" : gapHor,
                                 @"width": width,
                                 @"gapVer": gapVer,
                                 @"height": height};
    NSArray *arrHor = [NSLayoutConstraint constraintsWithVisualFormat:strViewRedHor options:kNilOptions metrics:dicMetrics views:dicViews];
    [self.view addConstraints:arrHor];
    
    // 2, 垂直方向
    // 红色的
    NSString *strViewVerRed = @"V:|-gapVer-[viewRed(height)]";
    NSArray *arrVerRed = [NSLayoutConstraint constraintsWithVisualFormat:strViewVerRed options:kNilOptions metrics:dicMetrics views:dicViews];
    [self.view addConstraints:arrVerRed];
    
    // 绿色的
    NSString *strViewVerGreen = @"V:|-gapVer-[viewGreen(height)]";
    NSArray *arrVerGreen = [NSLayoutConstraint constraintsWithVisualFormat:strViewVerGreen options:kNilOptions metrics:dicMetrics views:dicViews];
    [self.view addConstraints:arrVerGreen];
    
}

@end
