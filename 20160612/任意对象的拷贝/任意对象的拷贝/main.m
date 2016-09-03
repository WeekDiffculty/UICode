//
//  main.m
//  任意对象的拷贝
//
//  Created by qingyun on 16/6/12.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Car.h"
#import "Engine.h"
#import "GeneralCar.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Car *smart = [[Car alloc] init];
        smart.brand = @"奔驰";
        smart.price = 150000;
        smart.engine.power = 10;
        
        Car *smart1 = smart; // 浅拷贝
        smart1.price = 160000;
        
        // 深拷贝
        Car *smart2 = [[Car alloc] init];
        smart2.brand = smart.brand;
        smart2.price = smart.price;
        
        //
        Car *smart3 = [[Car alloc] init];
        smart3.brand = smart.brand;
        smart3.price = smart.price;

        // 为了解决一次性拷贝的问题 copy >>> copyWithZone:
        // 当自定义对象需要进行Copy时，往往都是需要深的拷贝
//        Car *smart4 = [smart copy];
//        smart4.brand = @"benz";
//        smart4.engine.power = 20;
//        Car *smart5 = [smart copy];
//        Car *smart6 = [smart copy];
//        Car *smart7 = [smart copy];
        
        // 如果自定义对象只是为了浅拷贝，只需要赋值就可以
        Car *smart8 = smart;
        
        
        // 在继承中实现拷贝
        GeneralCar *gnCar = [[GeneralCar alloc] init];
        gnCar.brand = @"通用·雪佛兰";
        gnCar.price = 100000;
        gnCar.engine = [[Engine alloc] init];
        gnCar.engine.power = 1000;
        
        GeneralCar *Cruze = [gnCar copy];
        
//        [gnCar mutableCopy]; //mutableCopy对于一般的自定义对象是没有直接意义的
        
    }
    return 0;
}
