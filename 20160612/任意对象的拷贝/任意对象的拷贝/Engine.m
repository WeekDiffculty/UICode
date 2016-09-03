//
//  Engine.m
//  任意对象的拷贝
//
//  Created by qingyun on 16/6/12.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Engine.h"

@implementation Engine

- (instancetype)copyWithZone:(NSZone *)zone
{
    Engine *engCopy = [[Engine allocWithZone:zone] init];
    engCopy.power = self.power;
    return engCopy;
}



@end
