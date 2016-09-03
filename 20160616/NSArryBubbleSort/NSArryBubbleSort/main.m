//
//  main.m
//  NSArryBubbleSort
//
//  Created by qingyun on 16/6/16.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSObject+BubbleSort.h"
#import "Car.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSArray *nums = @[@123,@45,@65,@3.14F,@0];
        
        NSLog(@"sorted >>>>> %@", [nums sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return [(NSNumber*)obj2 compare:(NSNumber *)obj1];
        }]);
        
        NSArray *bubbleSort = [nums bubbleSort:^NSComparisonResult(NSNumber *obj1, NSNumber *obj2) {
            return [obj2 compare:obj1];
        }];
    
        NSLog(@"bubbleSort >>>> %@", bubbleSort);
        
        // 按照汽车的价格顺序给数组排序
        Car *smart = [[Car alloc] initWithPrice:100000];
        Car *cruze = [[Car alloc] initWithPrice:120000];
        Car *qq = [[Car alloc] initWithPrice:50000];
        Car *f0 = [[Car alloc] initWithPrice:30000];
        NSArray *cars = @[qq, cruze, f0, smart];
        
        
        
        
        NSLog(@"sortc >>>>>> %@", [cars bubbleSort:^NSComparisonResult(Car *c1, Car *c2) {
#if 0
            if (c1.price < c2.price) {
                return NSOrderedAscending; // -1
            } else if (c1.price > c2.price) {
                return NSOrderedDescending; // 1
            } else {
                return NSOrderedSame; // 0
            }
#endif
            
            return [@(c1.price) compare:@(c2.price)];
            
        }]);
        
        
        
    }
    return 0;
}
