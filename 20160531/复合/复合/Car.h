//
//  Car.h
//  复合
//
//  Created by qingyun on 16/5/31.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

//#import "Engine.h"
@class Engine; // 如果只需要知道类的名字（就是复合的时候），不需要访问类的成员变量、属性、方法时，是不需要导入头文件的，只需要 @class 声明类名即可，建议大家在所有的接口文件里全部使用 @class
// 如果是互相导入的话，就必须使用 @class

@interface Car : NSObject

@property (nonatomic) int price;
@property (nonatomic, strong) NSString *brand;  // NSString 本身是一个类，作为Car的一个属性，这种现象就是一种 复合

@property (nonatomic) Engine *engine;

@end
