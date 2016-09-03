//
//  GeneralCar.h
//  任意对象的拷贝
//
//  Created by qingyun on 16/6/12.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Car.h"

@interface GeneralCar : Car <NSCopying>

@property (nonatomic, strong) NSString *address;

@end
