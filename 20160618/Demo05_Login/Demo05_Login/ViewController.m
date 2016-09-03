//
//  ViewController.m
//  Demo05_Login
//
//  Created by qingyun on 16/6/18.
//  Copyright © 2016年 qingyun. All rights reserved.
//  登录页面

#import "ViewController.h"
#import "QYMainViewController.h"
#import "QYRegisterController.h"

@interface ViewController ()


@property (weak, nonatomic) IBOutlet UITextField *txfUserName;
@property (weak, nonatomic) IBOutlet UITextField *txfPassword;
@property (weak, nonatomic) IBOutlet UILabel *lblTips;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 收回键盘
    //[self.view endEditing:YES];
}

- (IBAction)login {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *userName = [defaults objectForKey:@"userName"];
    NSString *pwd = [defaults objectForKey:@"password"];
    
    // 判断用户名和密码是否为空
    if (self.txfUserName.text.length == 0) {
        self.lblTips.text = @"用户名不能为空！";
        return;
    }
    if (self.txfPassword.text.length == 0) {
        self.lblTips.text = @"密码不能为空";
        return;
    }
    // 用户名和密码的正确性
    if (![self.txfPassword.text isEqualToString:pwd] ||
        ![self.txfUserName.text isEqualToString:userName]) {
        self.lblTips.text = @"用户名或密码错误！";
        return;
    }
    // 当程序运行好这里的时候一定是符合条件的，那么久应该调到主页
    self.lblTips.text = @""; // nil
    
    // 弹出主控制器页面
    // bundle参数如果传入的值是nil的话，默认就是[NSBundle mainBundle]
    //QYMainViewController *vcMain = [[QYMainViewController alloc] initWithNibName:@"QYMainViewController" bundle:nil];
    QYMainViewController *vcMain = [QYMainViewController new];
    
    // 模态视图：管理控制器的一种方式
    // 特点：默认从屏幕的底部钻出来覆盖整个屏幕 消失（dismiss）的时候又回到原来的位置
    // 只要调用了 -[UIViewController presentViewController:animated:completion:] 这个方法，系统就会自动的把这个控制器的视图添加到窗口上， 然后通过特定的动画展示出来
    [self presentViewController:vcMain animated:YES completion:nil];
}
- (IBAction)registerUser {
    QYRegisterController *vcRegister = [QYRegisterController new];
    [self presentViewController:vcRegister animated:YES completion:^{
        NSLog(@"动画已经结束了");
    }];
}

@end
