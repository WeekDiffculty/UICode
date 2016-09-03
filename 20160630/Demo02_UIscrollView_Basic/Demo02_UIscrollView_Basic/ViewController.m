//
//  ViewController.m
//  Demo02_UIscrollView_Basic
//
//  Created by qingyun on 16/6/30.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    __weak UIScrollView *_scrollView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1, 创建一个UIScrollView的对象
    CGRect rectScrollView = CGRectMake(50, 50, 300, 500);
    UIScrollView *scrollView = [UIScrollView new];
    [scrollView setFrame:rectScrollView];
    [self.view addSubview:scrollView];
    _scrollView = scrollView;
    
    [_scrollView.layer setBorderColor:[UIColor orangeColor].CGColor];
    [_scrollView.layer setBorderWidth:2.0];
    [_scrollView.layer setMasksToBounds:YES];
    
    UIImage *image = [UIImage imageNamed:@"map.jpg"];
    UIImageView *imageView = [UIImageView new];
    [imageView setImage:image];
    [imageView setFrame:(CGRect){CGPointZero, image.size}];
    [scrollView addSubview:imageView];
    
    // 2, 属性设置
    // 设置内容尺寸
    [scrollView setContentSize: image.size];
    
    // 设置偏移量
    //[scrollView setContentOffset:CGPointMake(0, 100) animated:YES];
    
    // 设置内边距
    //[scrollView setContentInset:UIEdgeInsetsMake(100, 0, 0, 0)];
    
    // 滚动条是否显示
    [scrollView setShowsHorizontalScrollIndicator:YES];//水平
    [scrollView setShowsVerticalScrollIndicator:NO];
    
    // 滚动条的样式
    //[scrollView setIndicatorStyle:UIScrollViewIndicatorStyleWhite];
    
    // 锁定某一个方向的滚动, 开始的方向是什么, 只要手指还在scrooView上拖动, 就一直是这个方向滑动
    [scrollView setDirectionalLockEnabled:YES];
    
    // 是否有弹簧效果, 只要滑动到ContentView的边缘就没有再滑动的空间
    //[scrollView setBounces:NO];
    
    // 是否一直有弹簧效果: 使用范围 ContentSize.height < ScrollView.height 的情况下垂直方向默认情况下是没有弹簧效果的, 但是设置了AlwaysBounceVertical = YES的时候就会让在这种情况下仍然有弹簧效果
    [scrollView setAlwaysBounceVertical:YES];
    
    // 设置是否可以滚动/滑动
    //[scrollView setScrollEnabled:NO];
    
    // 设置减速的速率
    [scrollView setDecelerationRate:0.5];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 测试代码
    // [_scrollView setContentOffset:CGPointMake(200, 100) animated:YES];
    //[_scrollView setContentInset:UIEdgeInsetsMake(100, 50, 80, 10)];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
