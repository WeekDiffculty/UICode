//
//  GeneralCar.m
//  任意对象的拷贝
//
//  Created by qingyun on 16/6/12.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "GeneralCar.h"
#import "Engine.h"

@implementation GeneralCar

- (instancetype)copyWithZone:(NSZone *)zone
{
//    GeneralCar *gnCarCopy = [[GeneralCar allocWithZone:zone] init];
//    
//    gnCarCopy.brand = self.brand;
//    gnCarCopy.price = self.price;
//    gnCarCopy.engine = [self.engine copy];
    
    GeneralCar *gnCarCopy = [super copyWithZone:zone];
    
    gnCarCopy.address = self.address;
    
    return gnCarCopy;
}

@end
