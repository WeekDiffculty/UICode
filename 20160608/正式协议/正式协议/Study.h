//
//  Study.h
//  正式协议
//
//  Created by qingyun on 16/6/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

// @protocol 是正式协议的声明关键字
@protocol Study <NSObject>

//{
//    int age;
//}

// 在正式协议中写属性是不推荐的做法，协议一般只用来规定做什么事情，不规定长什么样子
@property (nonatomic, strong) NSString *school;

// @Optional 表示可以选择实现的行为
@optional
- (void)sleep;
// @required  代表协议中规定必须实现的行为（方法）
@required
- (void)coding;
- (void)goToClassRoom;
- (void)discussion;
@end