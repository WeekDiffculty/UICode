//
//  QYUpdateController.m
//  Demo01_对象间的通讯_property
//
//  Created by qingyun on 16/6/20.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYUpdateController.h"


typedef NSInteger (^SumBlock)(NSInteger, NSInteger);

@interface QYUpdateController ()

@property (weak, nonatomic) IBOutlet UITextField *txfText;

@end

@implementation QYUpdateController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 通过传进来的值，给txfText赋值
    self.txfText.text = self.text;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // 弹出键盘（进入编辑状态）
    [self.txfText becomeFirstResponder];
}

- (IBAction)update {
    // 调用Block
    //if (self.blkUpdate) {
    //    self.blkUpdate(self.txfText.text);
    //}
    
    // 调用代理
    if ([self.actionDelegate respondsToSelector:@selector(updateController:didCompleteWithText:)]) {
        [self.actionDelegate updateController:self didCompleteWithText:self.txfText.text];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


// Block回顾
- (void)previewBlock {
    // 1,无返回值的Block
    // 定义一个Block
    void (^blkTest)(void) = ^{
      NSLog(@"我被掉了");
    };
    // Block调用的时候就是给后面加一对圆括号
    blkTest();
    
    // 2,有返回值的Block
    // int, float以后不允许再使用
    NSInteger (^blkSum)(NSInteger, NSInteger) = ^(NSInteger num1, NSInteger num2) {
        NSInteger sum = num1 + num2;
        NSLog(@"%ld", sum);
        return sum;
    };
    blkSum(3, 8);
    
    //3,typedef的形式定义Block类型
    SumBlock blkSum1 = ^(NSInteger num1, NSInteger num2) {
        NSInteger sum = num1 + num2;
        NSLog(@"%ld", sum);
        return sum;
    };
    blkSum1(3, 5);
}


@end
