//
//  main.m
//  NSCopying
//
//  Created by qingyun on 16/6/12.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Person.h"
#import "Toy.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Person *xiaoming = [[Person alloc] init];
        xiaoming.name = @"小明"; // >>>>>> _name = [@"小明" copy]; >>> strong >>> _name = @"小明"; copy >>>> [obj copyWithZone:xxxx];
        
//        Toy *car = [[Toy alloc] init];
//        xiaoming.toy = car;
        
        
        // 系统对象的深浅拷贝 String Array Dictionary
        NSArray *arr = @[@"王伟亮", @"李凌来", @"王娇灵", @"史建国"];
        NSArray *arrCopy = [arr copy];
        
        NSLog(@"\narr >>> %p\narrCopy >>>> %p", arr, arrCopy);
        
        NSMutableArray *mtArr = [NSMutableArray arrayWithArray:arr];
        NSMutableArray *mtArrCopy = [mtArr copy];
        
        NSLog(@"\nmtarr >>> %p\nmtArrCopy >>>> %p", mtArr, mtArrCopy);
        [mtArr addObject:@"张奥"];
        NSLog(@"\nmtarr >>> %@\nmtArrCopy >>>> %@", mtArr, mtArrCopy);
        
        // mutableCopy
        NSLog(@"\narr >>> %p\nArrCopy >>>> %p", arr, [arr mutableCopy]);
        NSLog(@"\nmtarr >>> %p\nmtArrCopy >>>> %p", mtArr, [mtArr mutableCopy]);
        
        // 不可变对象的 copy 都是浅拷贝，mutableCopy（从不可变到可变） 都是深拷贝
        // 可变对象的 cppy 都是深拷贝（从可变到不可变）， mutableCopy 也是深拷贝
        // copy 的结果一定是不可变的 mutableCopy 的结果一定是可变的
        
        // 对对象的强引用指针也是一种浅拷贝
        NSString *str = @"AVVCSCEWFFEWFFWF";
        NSString *str1 = str; // copy >>> strong
        
        
        
        
        
        
        
    }
    return 0;
}
