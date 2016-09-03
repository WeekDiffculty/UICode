//
//  AppDelegate.m
//  Demo01_Test
//
//  Created by qingyun on 16/6/17.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) UIWindow *wd;

@end

@implementation AppDelegate

// 假设， 已经指定了Main.storyboard

// 程序启动完成的时候调用
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"%s", __FUNCTION__);
    
    // 0，获取屏幕的尺寸
    // UIScreen：最常用的就是[[UIScreen mainScreen] bounds]
    // 常见的单例：
    /*
     [UIScreen mainScreen]; // 屏幕对象的单例
     [UIDevice currentDevice]; // 设备对象的单例
     [UIApplication sharedApplication]; // 应用程序的单例
     */
    
    // UIApplication对象不能alloc，否则崩溃处理
    //UIApplication *app = [[UIApplication alloc] init];
    //NSLog(@"%p---%p", application, [UIApplication sharedApplication]);
    //NSLog(@"%@", app);
    
    CGRect rectScreen = [[UIScreen mainScreen] bounds];
    
    // 1,创建UIWindow
    // 一个程序只能有一个主窗口
    // application.keyWindow key:主要的， 关键的
    self.window = [[UIWindow alloc] initWithFrame:rectScreen];
    self.window.backgroundColor = [UIColor redColor];
    
    
    // 2，设置跟控制器
    ViewController *vc = [[ViewController alloc] init];
    self.window.rootViewController = vc;
    
    // 3，显示在屏幕上
    [self.window makeKeyAndVisible];
    // makeKeyAndVisible内部其实让当前的window对象变为主window， 显示出来
    //window.hidden = NO; // Visible
    
    //self.window = window;
    
    // 在iOS9.0以后，自己创建的UIWindow对象必须有一个跟控制器
    //UIWindow *wd = [[UIWindow alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    //wd.backgroundColor = [UIColor greenColor];
    //wd.rootViewController = [UIViewController new];
    //wd.hidden = NO;
    //self.wd = wd;
    
    return YES;
}

// Resign：分发
// 应用程序失去焦点
- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"%s", __FUNCTION__);
}

// 程序已经进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"%s", __FUNCTION__);
}

// 程序即将进入前台
- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"%s", __FUNCTION__);
}

// 程序进入激活状态
- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"%s", __FUNCTION__);
}

// 程序即将挂掉的时候就会调用这个方法（从内存销毁）
- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"%s", __FUNCTION__);
}

@end
