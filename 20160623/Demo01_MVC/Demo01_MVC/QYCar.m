//
//  QYCar.m
//  Demo01_MVC
//
//  Created by qingyun on 16/6/23.
//  Copyright © 2016年 Shreker. All rights reserved.
//

#import "QYCar.h"

@implementation QYCar

- (instancetype)initWithDictionary:(NSDictionary *)dicData {
    self = [super init];
    if (self) {
        self.name = dicData[@"name"];
        self.wheelsCount = [dicData[@"wheelsCount"] intValue];
        self.identifier = dicData[@"identifier"];
    }
    return self;
}

+ (instancetype)carWithDictionary:(NSDictionary *)dicData {
    //return [[self alloc] initWithDictionary:dicData];
    QYCar *car = [[QYCar alloc] init];
    car.name = dicData[@"name"];
    car.wheelsCount = [dicData[@"wheelsCount"] intValue];
    car.identifier = dicData[@"identifier"];
    return car;
}

@end
