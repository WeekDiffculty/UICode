//
//  AppDelegate.m
//  First iOS
//
//  Created by qingyun on 16/5/30.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // window代表整个应用程序的窗口
    // 使用整个主屏的大小来创建一个主窗口对象
    UIScreen *mainScreen = [UIScreen mainScreen];
    UIWindow *window = [[UIWindow alloc] initWithFrame:mainScreen.bounds];
    // 将该窗口的背景颜色设置成 橙色
    window.backgroundColor = [UIColor orangeColor];
    
    // 把刚创建的window对象作为整个应用程序的主窗口
    self.window = window;
    //[self.window makeKeyAndVisible];
    
    UIWindow *window2 = [[UIWindow alloc] initWithFrame:mainScreen.bounds];
    // 将该窗口的背景颜色设置成 橙色
    window2.backgroundColor = [UIColor grayColor];
    self.secondeWindow = window2;
    [self.secondeWindow makeKeyAndVisible];
    

    // UIViewController类可以理解成一个界面的类，创建一个UIViewController对象，就表示创建了一个界面
    UIViewController *viewcontroller = [UIViewController new];
    // window对象有一个属性是rootViewController，表示程序的第一个界面
    window2.rootViewController = viewcontroller;
    
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
