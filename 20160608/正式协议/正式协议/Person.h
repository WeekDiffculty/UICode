//
//  Person.h
//  正式协议
//
//  Created by qingyun on 16/6/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Study.h"

@interface Person : NSObject <Study> // 在类的声明后面追加<protoclo>，称为 遵循协议

@property (nonatomic, strong) NSString *name;

@end
