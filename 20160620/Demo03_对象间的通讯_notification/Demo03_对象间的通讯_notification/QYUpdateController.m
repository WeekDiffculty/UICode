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
    
    // 通知外界, 文字已经改变完成
    // 第一个参数:通知的名字
    // 第二个参数:发送通知的对象, 可以为iOS中的任意对象, 但是建议使用self
    // 第三个参数:传递一些自定义的参数, 是一个字典类型, 以键值对的方式传递
    [[NSNotificationCenter defaultCenter] postNotificationName:@"QYDidCompleteWithText" object:self userInfo:@{@"text1": self.txfText.text}];
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"QYDidCompleteWithText" object:self];
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
