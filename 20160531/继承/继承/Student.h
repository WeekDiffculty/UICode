//
//  Student.h
//  继承
//
//  Created by qingyun on 16/5/31.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Person.h"

@interface Student : Person   // 类名后面的冒号代表这个继承于哪个类

@property (nonatomic, strong) NSString *school;

- (void)study;

- (void)eat:(NSString *)food;

@end
