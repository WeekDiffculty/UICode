//
//  Person.m
//  Block对变量的截获
//
//  Created by qingyun on 16/6/14.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Math.h"

@implementation Math

- (instancetype)initWithBlock:(int (^)(int, int))block
{
    if (self = [super init]) {
        _block = block;
    }
    return self;
}

- (void)caculator
{
    NSLog(@"result >>>> %d", _block(_firstNum, _secondNum));
}

- (void)minus
{
    // 当block作为对象时，在block内部使用self会造成自我引用导致内存泄漏， 在block内部使用该对象的 弱引用指针即可解决
    __weak Math * weakSelf = self;
    _block = ^(int x, int y){
//        NSLog(@"self >>>> %@", weakSelf);
        NSLog(@"self >>>> %@", weakSelf);
        return x-y;
    };
}

- (void)dealloc
{
    NSLog(@"dealloc");
}


@end
