//
//  main.m
//  复合
//
//  Created by qingyun on 16/5/31.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Car.h"
#import "Engine.h"

int main(int argc, const char * argv[]) {

    Car *smart = [[Car alloc] init];
    smart.brand = @"Benz";
    smart.price = 150000;
    
    NSLog(@"engine >>>>> %@", smart.engine);
    
    
    Engine *engine = [[Engine alloc] init];
    engine.power = 5000;
    
    // 创建一个引擎对象，并且把它赋给 小汽车 的引擎属性，就做到了复合
    smart.engine = engine;
    
    NSLog(@"engine >>>>>> %.2f马力", smart.engine.power);
    NSLog(@"engine >>>>> %@", smart.engine);
    
    engine.power = 10000;
    NSLog(@"engine >>>>>> %.2f马力", smart.engine.power);
    
    NSLog(@"str >>>>> %@", @"something");
    
    
    return 0;
}
