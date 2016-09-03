//
//  main.m
//  Demo01_Test
//
//  Created by qingyun on 16/6/17.
//  Copyright © 2016年 qingyun. All rights reserved.
//

/**
 UIApplicationMain函数内部做了什么事情
 1，根据函数给定的类名创建一个UIApplication或者其子类的对象， 如果是nil， 就会默认创建UIApplication
 2，根据跟定的类名创建一个程序的代理对象， 默认的就是 AppDelegate，如果传nil
 3，设置UIApplication或者其子类的代理为AppDelegate对象
 4，检查性的加载程序的主窗口（）
 5，创建主运行循环(NSRunLoop)，开启这个循环监听事件
 
 */

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "QYApplication.h"

// 应用程序的入口
int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        // 函数UIApplicationMain的各个参数的含义
        // 1，2：和命令行相关， 我们不用关心
        // 3，UIApplication类或者其子类的字符串， 如果这个参数是nil的话， 程序会默认传入@“UIApplication”
        // 4，整个应用程序的代理类的字符串
        
        // 为了程序的严谨性，一般情况下类名相关的字符串都NSStringFromClass(Class  _Nonnull __unsafe_unretained aClass)来进行转化
        
        return UIApplicationMain(argc, argv, NSStringFromClass([QYApplication class]), NSStringFromClass([AppDelegate class]));
    }
}
