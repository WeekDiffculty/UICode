//
//  ViewController.m
//  Demo03_微博
//
//  Created by qingyun on 16/6/28.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "DiscoverViewController.h"
#import "ProfileViewController.h"
#import "QYTabBar.h"
#import "QYNavigationController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDefaultSetting];
}

/** 加载默认设置 */
- (void)loadDefaultSetting {
    
//    NSArray *arrTabBarDatas = @[@{@"imageName": @"tabbar_home",
//                                  @"title": @"首页",
//                                  @""},
//                                @{@"imageName": @"tabbar_message_center",
//                                  @"title": @"消息"},
//                                @{@"imageName": @"tabbar_discover",
//                                  @"title": @"搜索"},
//                                @{@"imageName": @"tabbar_profile",
//                                  @"title": @"我"}];
//    NSUInteger count = arrTabBarDatas.count;
//    for (NSUInteger index = 0; index < count; index ++) {
//        NSDictionary *dicData = arrTabBarDatas[index];
//        [self addViewControllerWithViewController: ImageName:dicData[@"imageName"] title:dicData[@"title"]];
    //    }
    HomeViewController *vcHome = [HomeViewController new];
    [self addViewController:vcHome imageName:@"tabbar_home" title:@"首页"];
    
    MessageViewController *vcMessage = [MessageViewController new];
    [self addViewController:vcMessage imageName:@"tabbar_message_center" title:@"消息"];
    
    DiscoverViewController *vcDiscover = [DiscoverViewController new];
    [self addViewController:vcDiscover imageName:@"tabbar_discover" title:@"搜索"];
    
    ProfileViewController *vcProfile = [ProfileViewController new];
    [self addViewController:vcProfile imageName:@"tabbar_profile" title:@"我"];
    
    self.tabBar.tintColor = [UIColor orangeColor];
    
    //[self.tabBar addSubview:[UIButton buttonWithType:UIButtonTypeInfoLight]];
    
    // 创建自己的TabBar
    QYTabBar *tabBar = [QYTabBar new];
    //self.tabBar = tabBar;
    [self setValue:tabBar forKey:@"tabBar"];
}

- (void)addViewController:(UIViewController *)viewController imageName:(NSString *)imageName title:(NSString *)title {
    viewController.tabBarItem.image = [UIImage imageNamed:imageName];
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected", imageName]];
    //viewController.tabBarItem.title = title;
    viewController.title = title;
    viewController.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -3);
    // 创建一个导航控制器
    QYNavigationController *vcNav = [[QYNavigationController alloc] initWithRootViewController:viewController];
    // 把导航控制器添加到TanBarController中
    [self addChildViewController:vcNav];
}

@end
