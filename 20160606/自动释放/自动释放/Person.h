//
//  Person.h
//  自动释放
//
//  Created by qingyun on 16/6/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong) NSString *name;

+ (instancetype)personWithName:(NSString *)name;

+ (instancetype)sharedPerson; // defualt   current   shared

@end
