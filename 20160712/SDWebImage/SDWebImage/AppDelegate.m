//
//  AppDelegate.m
//  SDWebImage
//
//  Created by qingyun on 16/7/12.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "AppDelegate.h"
#import "UIImageView+WebCache.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 最大缓存的时间, 以秒计算, 超过这个时间就会删除缓存
    
    SDImageCache *cache = [SDImageCache sharedImageCache];
    //[cache setMaxCacheAge:<#(NSInteger)#>];
    // 存储这些下载过图片的仓库的大小, 字节计算
    //[cache setMaxCacheSize:1024 * 1024 * 5];
    // 在内存中最大缓存多少张图片
    // [cache setMaxMemoryCountLimit:10];
    
    NSLog(@"%@", NSHomeDirectory());
    
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
