//
//  AppDelegate.m
//  Demo03_微博
//
//  Created by qingyun on 16/6/28.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
//应用程序完成启动
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 创建窗口对象
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor  = [UIColor blackColor];
    // 创建跟控制器
    MainViewController *vcMain = [MainViewController new];
    
    // 设置窗口的根视图控制器
    self.window.rootViewController = vcMain;
    
    // 显示窗口
    [self.window makeKeyAndVisible];
    
    return YES;
}
//应用程序将失去激活状态
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}
//应用程序已经进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}
//应用程序将再次进入前台
- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}
//应用程序进入前台
- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}
//应用程序已终结
- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
