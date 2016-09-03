//
//  ViewController.m
//  Demo02_传值
//
//  Created by qingyun on 16/7/1.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "A.h"
#import "B.h"

@interface A () <QYWangCaiDelegate>
{
    B *_wc;
}

@end

@implementation A

- (void)viewDidLoad {
    [super viewDidLoad];
    
    B *b = [B new];
    //[b setBlkDidWang:^(NSUInteger count){
    //    NSLog(@"旺财叫完了, 叫了%ld次", count);
    //}];
    [b wang];
    _wc = b;
    
    //b.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receivedNotification:) name:@"QWERTYUIOP" object:b];
}

- (void)receivedNotification:(NSNotification *)notification {
    
}

#pragma mark - QYWangCaiDelegate
//- (void)wangcai:(B *)wangcai didFinishWithCount:(NSUInteger)count {
//    NSLog(@"旺财叫完了, didFinishWithCount:%ld次", count);
//}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
