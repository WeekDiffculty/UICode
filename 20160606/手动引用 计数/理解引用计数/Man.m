//
//  Man.m
//  理解引用计数
//
//  Created by qingyun on 16/6/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Man.h"

#import "Woman.h"

@implementation Man

#if 0
- (void)setGirl:(Woman *)girl
{
    [_girl release]; // 不再使用的第二种情况：持有者需要替换持有对象的时候，这时候需要老的对象进行release 对新的对象进行 retain
    [girl retain];
    _girl = girl;
    //[_girl retain]; // _girl +1 谁使用 ，谁retain，绝大部分情况就是成员变量被赋值那一个刻
}
#endif

#if 0
- (void)setGirl:(Woman *)girl
{
    [_girl release]; // 不再使用的第二种情况：持有者需要替换持有对象的时候，这时候需要老的对象进行release 对新的对象进行 retain
    _girl = [girl retain];
    //[_girl retain]; // _girl +1 谁使用 ，谁retain，绝大部分情况就是成员变量被赋值那一个刻
}
#endif

- (void)setGirl:(Woman *)girl
{
    // 最终版本，替换的时候需要考虑传入的持有对象是否重复，如果不重复才需要 进行引用计数，否则什么都不做
    if (_girl != girl) {
        [_girl release];
        _girl = [girl retain];
    }
}

- (void)live
{
    NSLog(@"有%@的陪伴，活着真好！", _girl.name);
}

- (void)dealloc
{
    NSLog(@"%@我挂了", _name);
    [_girl release]; // 不再使用的第一种情况：持有者本身被销毁的时候，需要对持有的对象 release ，谁不在使用，谁释放
    [super dealloc];
}

@end
