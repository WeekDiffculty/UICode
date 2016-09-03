//
//  AppDelegate.m
//  Demo02_UIViewController_层次结构
//
//  Created by qingyun on 16/6/18.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "AppDelegate.h"
#import "QYTest1ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

// 应用程序出现报错的原因如果是：Application windows are expected to have a root view controller at the end of application launch。 在iOS9之前是警告的形式， iOS9.0之后变成了崩溃


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 创建UIWindow对象
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // 创建根控制器
    QYTest1ViewController *vcRoot = [[QYTest1ViewController alloc] init];

    // 设置主窗口的跟控制器
    self.window.rootViewController = vcRoot;
    
    //[self.window addSubview:vcRoot.view];
    
    // 让主窗口显示出来
    [self.window makeKeyAndVisible];
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
