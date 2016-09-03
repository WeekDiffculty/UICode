//
//  Student.h
//  深入理解初始化
//
//  Created by qingyun on 16/6/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Person.h"

@interface Student : Person

@property (nonatomic, strong) NSString *school;

- (instancetype)initWithSchool:(NSString *)school;

@end
