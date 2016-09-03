//
//  ViewController.m
//  Demo02_TabBarController_Code
//
//  Created by qingyun on 16/6/28.
//  Copyright © 2016年 qingyun. All rights reserved.
//
/** Color Related */
#define QLColorWithRGB(redValue, greenValue, blueValue) ([UIColor colorWithRed:((redValue)/255.0) green:((greenValue)/255.0) blue:((blueValue)/255.0) alpha:1])
#define QLColorRandom QLColorWithRGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
#define QLColorFromHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadDefaultSetting];
}

/** Load the default UI elements And prepare some datas needed. */
- (void)loadDefaultSetting {
    
//    [self addViewControllerWithImageName:@"tabbar_home" title:@"首页"];
//    [self addViewControllerWithImageName:@"tabbar_message_center" title:@"消息"];
//    [self addViewControllerWithImageName:@"tabbar_discover" title:@"搜索"];
//    [self addViewControllerWithImageName:@"tabbar_profile" title:@"我"];
    
    //NSArray *arrImageNames = @[@"tabbar_home", @"tabbar_message_center", @"tabbar_discover", @"tabbar_profile"];
    //NSArray *arrTitles = @[@"首页", @"消息", @"搜索", @"我"];
    
    NSArray *arrTabBarDatas = @[@{@"imageName": @"tabbar_home",
                                  @"title": @"首页"},
                                @{@"imageName": @"tabbar_message_center",
                                  @"title": @"消息"},
                                @{@"imageName": @"tabbar_discover",
                                  @"title": @"搜索"},
                                @{@"imageName": @"tabbar_profile",
                                  @"title": @"我"}];
    NSUInteger count = arrTabBarDatas.count;
    for (NSUInteger index = 0; index < count; index ++) {
        NSDictionary *dicData = arrTabBarDatas[index];
        [self addViewControllerWithImageName:dicData[@"imageName"] title:dicData[@"title"]];
    }
    
    
    //self.viewControllers = @[vcHome, vcMessage, vcDiscover, vcMine];
    
    // 设置图标, 文字的显示颜色
    self.tabBar.tintColor = [UIColor orangeColor];
    // 修改TabBar的背景色
    self.tabBar.barTintColor = [UIColor purpleColor];
}

- (void)addViewControllerWithImageName:(NSString *)strImageName title:(NSString *)strTitle {
    UIViewController *vcDiscover = [UIViewController new];
    vcDiscover.view.backgroundColor = QLColorRandom;
    vcDiscover.tabBarItem.image = [UIImage imageNamed:strImageName];
    vcDiscover.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected", strImageName]];
    vcDiscover.tabBarItem.title = strTitle;
    vcDiscover.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -3);
    [self addChildViewController:vcDiscover];
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"%@", self.tabBar.subviews);
//    for (UIView *view in self.tabBar.subviews) {
//        Class cls = NSClassFromString(@"UITabBarButton");
//        if ([view isKindOfClass:cls]) {
//            NSLog(@"%@", view.superclass);
//        }
//    }
//}

@end
