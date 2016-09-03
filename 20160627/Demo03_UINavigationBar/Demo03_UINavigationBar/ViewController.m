//
//  ViewController.m
//  Demo03_UINavigationBar
//
//  Created by qingyun on 16/6/27.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDefaultSetting];
}

/** Load the default UI elements And prepare some datas needed. */
- (void)loadDefaultSetting {
    // 导航栏的相关设置
    [self loadNavigationBarSetting];
    
    // 设置导航控制器中的navigationItem
    // [self loadNavigationItem];
    
    self.title = @"我很流弊";
    self.navigationItem.titleView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    UIButton *btnTest = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [self.view addSubview:btnTest];
}

/** 自定义导航栏 */
- (void)loadNavigationBarSetting {
    // 取出NavogationBar
    UINavigationBar *bar = self.navigationController.navigationBar;
    bar.barStyle = UIBarStyleDefault;
    // 👉🏿: 一定注意如果需要坐标原点从导航栏左下角开始计算, 设置bar.translucent为NO, 默认情况下是YES, 也就是说, 坐标原点导航栏的左上角开始计算
    bar.translucent = YES;
    bar.tintColor = [UIColor redColor];
    // 取出图片中的颜色并返回
    bar.barTintColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"img_nav"]];
    // 图片的显示优先级高于tintColor
    //[bar setBackgroundImage:[UIImage imageNamed:@"img_nav"] forBarMetrics:0];
    //bar.shadowImage = [UIImage imageNamed:@"img_shadow"];
    // 设置标题文本的属性
    [bar setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:25],
                                  NSForegroundColorAttributeName: [UIColor yellowColor]}];
}

- (void)loadNavigationItem {
    // 设置导航控制器中的navigationItem
    // UIBarButtonItem: 是一个数据模型, NavigationBar上面显示的是一个继承自UIButton的一个View
    // 1, 系统自带图标的item
    // self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(tapAction:)];
    UIBarButtonItem *itemLeft = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(tapAction:)];
    UIBarButtonItem *itemLeft1 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_nav_more"] landscapeImagePhone:[UIImage imageNamed:@"back-icon"] style:0 target:nil action:nil];
    self.navigationItem.leftBarButtonItems = @[itemLeft, itemLeft1];
    
    // 2, 图片的形式
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_nav_more"] style:0 target:nil action:nil];
    // 3, 自定义标题的item
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"青云" style:UIBarButtonItemStylePlain target:self action:@selector(tapAction:)];
    // 4, 自定义的视图
    UIButton *btnRight = [UIButton buttonWithType:UIButtonTypeSystem];
    btnRight.bounds = CGRectMake(0, 0, 30, 30);
    [btnRight setImage:[UIImage imageNamed:@"back-icon"] forState:UIControlStateNormal];
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc] initWithCustomView:btnRight];
    
    self.navigationItem.rightBarButtonItems = @[item1, item2, item3];
    
    self.navigationItem.prompt = @"正在加载, 客官莫急...";
}

- (void)tapAction:(UIBarButtonItem *)item {
    NSLog(@"%s", __func__);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@", self.navigationController.navigationBar.subviews);
    NSArray *views = self.navigationController.navigationBar.subviews;
    for (UIView *view in views) {
        // 把一个字符串传化成为一个类
        // iOS中如果某一个类在Xcode中不能提示, 说明这个类是一个私有类(私有的API)
        Class cls = NSClassFromString(@"UINavigationButton");
        // [[cls alloc] init]; 私有的一旦创建就会被拒绝上架
        if ([view isKindOfClass:cls]) {
            NSLog(@"%@", view.superclass);
        }
    }
    
    self.navigationItem.prompt = nil;
}

@end
