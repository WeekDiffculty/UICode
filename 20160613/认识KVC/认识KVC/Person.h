//
//  Person.h
//  认识KVC
//
//  Created by qingyun on 16/6/13.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic) NSInteger age;
@property (nonatomic, strong) NSString *sex;
@property (nonatomic, readonly, strong) NSString *ID;
@property (nonatomic, strong) Person *friend;
@property (nonatomic, strong) NSMutableArray *friends;

@end
