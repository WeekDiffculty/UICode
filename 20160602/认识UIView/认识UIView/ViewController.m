//
//  ViewController.m
//  认识UIView
//
//  Created by qingyun on 16/6/2.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view  = [[UIView alloc] initWithFrame:CGRectMake(50, 200, 100, 100)];

    view.backgroundColor = [UIColor magentaColor];
    
//    view.alpha = 0.8; // 0-1 的浮点型
    view.hidden = NO; // 是否隐藏
    view.tag = 101;
    
    
    NSLog(@"superview >>>>>>> %@", view.superview);
    [self.view addSubview:view];
    // superview表示父视图，被add在哪，谁就是他的父视图
    NSLog(@"superview >>>>>>> %@", view.superview);
    
    // subviews
    NSLog(@"subviews >>>>>> %@", self.view.subviews);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // 这里可以处理内存警告发生的逻辑
    // 在不使用 属性的情况下，可以通过tag值来获取到 对应的view
    UIView *view = [self.view viewWithTag:101];
#if 0
    view.backgroundColor = [UIColor orangeColor];
#endif
    // removeFromSuperview 表示从父视图上移除掉某个子视图
    [view removeFromSuperview];
    
}

@end
