//
//  ViewController.m
//  Demo01_对象间的通讯_property
//
//  Created by qingyun on 16/6/20.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "QYUpdateController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lblText;
@property (nonatomic, strong) QYUpdateController *vcUpdate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 各个参数的名称
    // 第一个参数: 把当前对象当做监听器传入
    // 第二个参数: 监听器响应的方法
    // 第三个参数: 通知的名称
    // 第四个参数: 告诉通知中心, 我要谁的通知, 当这个对象为nil的时候只要是名字一样就会接收这个通知, 触发这个监听方法
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChangedWithNotification:) name:@"QYDidCompleteWithText" object:nil];
}

// 作为监听器的方法:
// 要么不带参数, 要么参数必须是NSNotification类型的
- (void)textDidChangedWithNotification:(NSNotification *)noti {
    NSLog(@"%@", noti);
    // noti.name : 这个通知的名字
    // noti.object: 在发送通知的时候传过来的对象(发送通知的人传什么, 我们接收什么)
    self.lblText.text = noti.userInfo[@"text1"];
}

- (IBAction)modify {
    // 模态形式展示更新控制器的View
    QYUpdateController *vcUpdate = [QYUpdateController new];
    // 属性传值（正向传值）
    vcUpdate.text = self.lblText.text;
    
    [self presentViewController:vcUpdate animated:YES completion:nil];
    self.vcUpdate = vcUpdate;
}

- (void)dealloc {
    // 如果当前类有添加监听器, 那么在当前对象从内存中销毁的时候就要把这个监听器移除
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
