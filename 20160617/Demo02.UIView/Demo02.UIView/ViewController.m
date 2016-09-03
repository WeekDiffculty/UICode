//
//  ViewController.m
//  Demo02.UIView
//
//  Created by qingyun on 16/6/17.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) UIView *viewRed;
@property (weak, nonatomic) UIView *viewOrange;
@property (weak, nonatomic) IBOutlet UISwitch *switcher;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect rectViewOrange = CGRectMake(50, 50, 200, 200);
    UIView *viewOrange = [[UIView alloc] initWithFrame:rectViewOrange];
    viewOrange.backgroundColor = [UIColor orangeColor];
    viewOrange.tag = 1;
    [self.view addSubview:viewOrange];
    self.viewOrange = viewOrange;
    
    CGRect rectViewPurple = CGRectMake(40, 40, 180, 180);
    UIView *viewPurple = [[UIView alloc] initWithFrame:rectViewPurple];
    viewPurple.backgroundColor = [UIColor purpleColor];
    viewPurple.tag = 2;
    [self.view addSubview:viewPurple];
    
    CGRect rectViewYellow = CGRectMake(45, 45, 200, 200);
    UIView *viewYellow = [[UIView alloc] initWithFrame:rectViewYellow];
    viewYellow.backgroundColor = [UIColor yellowColor];
    viewYellow.tag = 3;
    //[self.view addSubview:viewYellow];
    // 把当前的视图插入到指定的索引位置
    //[self.view insertSubview:viewYellow atIndex:0];
    // 把当前的视图插入到指定视图的上面
    //[self.view insertSubview:viewYellow aboveSubview:viewOrange];
    // 把当前的视图插入到指定视图的下面
    [self.view insertSubview:viewYellow belowSubview:viewOrange];
    
    // 把一个指定的视图移动到最前面
    [self.view bringSubviewToFront:viewYellow];
    
    // 把一个指定视图送到最后面
    [self.view sendSubviewToBack:viewPurple];
    
    //NSLog(@"%@", self.view.subviews);
    NSLog(@"------%p", viewPurple);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s", __func__);
    // 从父视图中移除当前视图
    //[self.viewOrange removeFromSuperview];
    // 通过viewWithTag这个方法可以取到指定的view
    UIView *view = [self.view viewWithTag:2];
    NSLog(@"------%p", view);
}

- (void)properties {
    // 设置裁剪超出视图边界的控件的超出部分
    _viewOrange.clipsToBounds = YES;
    
    UIView *viewRed = [[UIView alloc] init];
    // 设置viewRed的frame
    //CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
    //viewRed.frame = CGRectMake(100, 100, 256, 256);
    viewRed.frame = (CGRect){CGPointMake(20, 20), CGSizeMake(256, 256)};
    
    // 设置当前视图的背景颜色
    [viewRed setBackgroundColor:[UIColor redColor]];
    
    // 设置viewRed的tag值
    viewRed.tag = 123456;
    
    // 用来设置viewRed的大小
    //viewRed.bounds = CGRectMake(0, 0, 100, 100);
    
    // 设置viewRed的中心点
    viewRed.center = self.view.center;
    
    // 透明度
    // 当alpha 的值小于等于0.01的时候， 整个viewRed对象 基本上看不见了，该视图不再拦截事件
    viewRed.alpha = 0.01;
    
    [self.view addSubview:viewRed];
    
    // superview: 当前视图的父视图
    NSLog(@"%@  -- %@", self.view, viewRed.superview);
    
    self.viewRed = viewRed;
    
    // subviews：是一个数组， 这个数组中存放了当前视图的 子视图
    //NSLog(@"%@", self.viewOrange.subviews);
    
    // 隐藏视图
    //self.viewOrange.hidden = YES;
    
    // 用户交互开关， 默认是YES
    // self.viewOrange.userInteractionEnabled = NO;
}

@end
