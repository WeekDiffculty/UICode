//
//  ViewController.m
//  类扩展
//
//  Created by qingyun on 16/6/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

// 私有的类
@interface Person : NSObject

@end

@implementation Person

@end

// 私有的类别
@interface NSString (lengthAsNSNumber)

- (NSNumber *)lengthObj;

@end

// 在.m出现的没有名字的类别就是 类扩展，用来创建该类的私有属性、方法、成员变量
@interface ViewController ()

// 私有的成员变量
{
    NSString *password;
}

// 私有的属性
@property (nonatomic, strong) UILabel *passwordLabel;
@property (nonatomic, strong, readwrite) NSString *ID;

// 私有的方法
//- (void)takePassword;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    password
//    self.passwordLabel
    [self takePassword];
}

- (void)takePassword
{
    NSLog(@"我是私有的");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
