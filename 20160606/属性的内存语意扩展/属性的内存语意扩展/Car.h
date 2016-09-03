//
//  Car.h
//  属性的内存语意扩展
//
//  Created by qingyun on 16/6/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Tire.h"

@interface Car : NSObject

@property (nonatomic, strong) Tire *tire;

@end
