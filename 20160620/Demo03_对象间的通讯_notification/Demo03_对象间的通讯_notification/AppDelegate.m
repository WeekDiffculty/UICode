//
//  AppDelegate.m
//  Demo01_对象间的通讯_property
//
//  Created by qingyun on 16/6/20.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChangedWithNotification:) name:@"QYDidCompleteWithText" object:nil];
    return YES;
}

//- (void)textDidChangedWithNotification:(NSNotification *)noti {
//    NSLog(@"%@", noti);
//    // noti.name : 这个通知的名字
//    // noti.object: 在发送通知的时候传过来的对象(发送通知的人传什么, 我们接收什么)
//}

@end
