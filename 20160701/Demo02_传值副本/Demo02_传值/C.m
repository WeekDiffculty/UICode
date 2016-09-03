//
//  C.m
//  Demo02_传值
//
//  Created by qingyun on 16/7/1.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "C.h"
#import "B.h"

@interface C () <BDelegate>

@end

@implementation C

- (void)viewDidLoad {
    B *b = [B new];
    b.delegate = self;
    [b wang];
}

- (void)笑了 {
    NSLog(@"%s", __func__);
}

@end
