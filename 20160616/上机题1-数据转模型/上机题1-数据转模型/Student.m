//
//  Student.m
//  上机题1-数据转模型
//
//  Created by qingyun on 16/6/16.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Student.h"
@interface Student()

@end
@implementation Student

- (Student *)initWithDictionary:(NSDictionary *)dict
{
    if (self = [super init]) {
//        self.name = dict[@"name"];
//        self.sex = dict[@"sex"];
//        self.age = [dict[@"age"] intValue];
//        self.stuID = dict[@"stuID"];
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (Student *)studentWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"姓名：%@,性别：%@,年龄：%d,学号：%@",self.name,self.sex,self.age,self.stuID];
}
@end
