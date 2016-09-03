//
//  Student.h
//  上机题1-数据转模型
//
//  Created by qingyun on 16/6/16.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
@property (nonatomic, copy)NSString *name;
@property (nonatomic, copy)NSString *sex;
@property (nonatomic, assign)int age;
@property (nonatomic, copy)NSString *stuID;

- (Student *)initWithDictionary:(NSDictionary *)dict;

+ (Student *)studentWithDictionary:(NSDictionary *)dict;

@end
