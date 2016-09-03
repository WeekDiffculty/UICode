//
//  ViewController.m
//  Demo01_UIpageControl
//
//  Created by qingyun on 16/6/30.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    
}

@property (nonatomic, weak) UIPageControl *pageCtrl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1, 创建一个UIPageControl对象
    UIPageControl *pageCtrl = [UIPageControl new];
    [pageCtrl setBackgroundColor:[UIColor orangeColor]];
    [pageCtrl setFrame:CGRectMake(50, 100, 200, 30)];
    [self.view addSubview:pageCtrl];
    
    // 总页数: 指的是总个数
    [pageCtrl setNumberOfPages:8];
    
    // 当前页: 索引
    [pageCtrl setCurrentPage:4];
    
    // 设置普通状态下的颜色
    //[pageCtrl setTintColor:<#(UIColor * _Nullable)#>]; // UIView的属性
    [pageCtrl setPageIndicatorTintColor:[UIColor blueColor]];
    
    // 当前页的显示颜色
    [pageCtrl setCurrentPageIndicatorTintColor:[UIColor redColor]];
    
    // 当只有一页的时候隐藏
    [pageCtrl setHidesForSinglePage:YES];
    
    // 告诉pageCtrl, 当我点击的时候先不要更新, 等到我调用updateCurrentPageDisplay的时候再更新
    [pageCtrl setDefersCurrentPageDisplay:YES];
    //[pageCtrl updateCurrentPageDisplay];
    
    self.pageCtrl = pageCtrl;
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 测试
    //[self.pageCtrl setNumberOfPages:1];
}

@end
