//
//  Car.m
//  NSArryBubbleSort
//
//  Created by qingyun on 16/6/16.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Car.h"

@implementation Car

- (instancetype)initWithPrice:(NSInteger)price
{
    if (self = [super init]) {
        _price = price;
    }
    return self;
}

- (NSString *) description
{
    return [@(_price) stringValue];
}

@end
