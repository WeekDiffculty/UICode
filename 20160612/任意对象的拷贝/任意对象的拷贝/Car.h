//
//  Car.h
//  任意对象的拷贝
//
//  Created by qingyun on 16/6/12.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Engine;

@interface Car : NSObject <NSCopying, NSMutableCopying>

@property (nonatomic, copy) NSString *brand;
@property (nonatomic) NSInteger price;
@property (nonatomic, strong) Engine *engine;

@end
