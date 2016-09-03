//
//  Student.h
//  初始化
//
//  Created by qingyun on 16/5/30.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property (nonatomic) int age;
@property (nonatomic) float height;
@property (nonatomic) long sid;
@property (nonatomic) char sex;

// 以 - 开始的方法叫 对象方法，将来必须由对象来执行
- (Student *)initWithAge:(int)age andSid:(long)sid;

- (void)study;
- (void)play;
- (void)sleep;

// 以 + 开始的方法叫 类方法，将来由类来执行
+ (void)introduce;


@end
