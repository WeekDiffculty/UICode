//
//  ViewController.m
//  Demo02_传值
//
//  Created by qingyun on 16/7/1.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "A.h"
#import "B.h"
#import "C.h"

@interface A () <BDelegate>
{
    B *_wc;
}

@end

@implementation A

- (void)viewDidLoad {
    [super viewDidLoad];
    
    B *b = [B new];
    b.delegate = self;
    [b wang];
    _wc = b;
}

- (void)笑了 {
    NSLog(@"%s", __func__);
    [self performSelector:@selector(showC) withObject:nil afterDelay:3.0];
}

- (void)showC {
    C *c = [C new];
    [self presentViewController:c animated:YES completion:nil];
}

@end
