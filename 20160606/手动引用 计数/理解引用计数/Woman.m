//
//  Woman.m
//  理解引用计数
//
//  Created by qingyun on 16/6/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Woman.h"

@implementation Woman

- (void)dealloc
{
    NSLog(@"%@我挂了", _name);
    [super dealloc];
}


@end
