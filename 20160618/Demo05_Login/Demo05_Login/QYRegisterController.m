//
//  QYRegisterController.m
//  Demo05_Login
//
//  Created by qingyun on 16/6/18.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYRegisterController.h"

@interface QYRegisterController ()

/** 用户名输入框 */
@property (weak, nonatomic) IBOutlet UITextField *txfUsername;

/** 密码输入框 */
@property (weak, nonatomic) IBOutlet UITextField *txfPwd;

/** 确认密码 */
@property (weak, nonatomic) IBOutlet UITextField *txfPwdConfirm;

/** 提示语标签 */
@property (weak, nonatomic) IBOutlet UILabel *lblTips;

@end

@implementation QYRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
}

- (IBAction)registerUser {
    // 判断用户名和密码是否为空
    if (self.txfUsername.text.length == 0) {
        self.lblTips.text = @"用户名不能为空！";
        return;
    }
    if (self.txfPwd.text.length == 0) {
        self.lblTips.text = @"密码不能为空";
        return;
    }
    if (self.txfPwdConfirm.text.length == 0) {
        self.lblTips.text = @"确认密码不能为空";
        return;
    }
    
    // 判断密码和确认密码是否一致
    if (![self.txfPwd.text isEqualToString:self.txfPwdConfirm.text]) {
        self.lblTips.text = @"密码和确认密码不一致！";
        return;
    }
    
    // 用户输入的内容全部符合要求
    // 默认情况下是把信息写入MainBundle中的一个plist文件中
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.txfUsername.text forKey:@"userName"];
    [defaults setObject:self.txfPwd.text forKey:@"password"];
    // 强制现在把存储的内容写入defaults对象
    [defaults synchronize];
    
    // 弹回页面
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
