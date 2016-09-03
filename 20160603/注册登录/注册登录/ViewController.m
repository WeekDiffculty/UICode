//
//  ViewController.m
//  注册登录
//
//  Created by qingyun on 16/6/3.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong,nonatomic) UITextField *tf1;
@property (strong,nonatomic) UITextField *tf2;
@property (strong,nonatomic) UITextField *tf3;
@property (strong,nonatomic) UITextField *tf4;
@property (strong,nonatomic) UITextField *tf5;
@property (strong,nonatomic) UITextField *tf6;
@property (strong,nonatomic) UILabel *errorInfo;
@property (strong, nonatomic) NSArray *numbers;
@property (nonatomic) NSInteger count;
@property (strong,nonatomic) NSTimer *timer;
@property (strong,nonatomic) UIButton *button;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _numbers = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"星空"]];
    imageView.frame = self.view.bounds;
    
    /** 错误提示信息label */
    _errorInfo = [[UILabel alloc] initWithFrame:CGRectMake(35, 15, CGRectGetWidth(self.view.frame)-70, 40)];
    _errorInfo.backgroundColor = [UIColor orangeColor];
    _errorInfo.adjustsFontSizeToFitWidth = YES;
    _errorInfo.textAlignment = NSTextAlignmentLeft;
    
    /** 用户名 */
    _tf1 = [[UITextField alloc] initWithFrame:CGRectMake(35, 70, CGRectGetWidth(self.view.frame)-70, 40)];
    _tf1.tag = 1;
    _tf1.backgroundColor = [UIColor whiteColor];
    _tf1.borderStyle = UITextBorderStyleBezel;// 边框
    _tf1.placeholder = @"请输入您的用户名";// 内容提示
    _tf1.clearButtonMode = UITextFieldViewModeAlways;// 清除按钮
    [_tf1 addTarget:self action:@selector(editing:) forControlEvents:UIControlEventEditingChanged];
    
    /** 手机号 */
    _tf2 = [[UITextField alloc] initWithFrame:CGRectMake(35, 130, CGRectGetWidth(self.view.frame)-70, 40)];
    _tf2.tag = 2;
    _tf2.backgroundColor = [UIColor whiteColor];
    _tf2.borderStyle = UITextBorderStyleBezel;// 边框
    _tf2.placeholder = @"请输入您的手机号";// 内容提示
    _tf2.clearButtonMode = UITextFieldViewModeAlways;// 清除按钮
    [_tf2 addTarget:self action:@selector(editing:) forControlEvents:UIControlEventEditingChanged];
    _tf2.keyboardType = UIKeyboardTypeNumberPad;// 必须数字键盘
    
    /** 验证码 */
    _tf3 = [[UITextField alloc] initWithFrame:CGRectMake(35, 190, CGRectGetWidth(self.view.frame)-70, 40)];
    _tf3.tag = 3;
    _tf3.backgroundColor = [UIColor whiteColor];
    _tf3.borderStyle = UITextBorderStyleBezel;// 边框
    _tf3.placeholder = @"请输入您的验证码";// 内容提示
    [_tf3 addTarget:self action:@selector(editing:) forControlEvents:UIControlEventEditingChanged];
    
    /** 获取验证码 */
    _button = [[UIButton alloc] initWithFrame:CGRectMake(225, 190, CGRectGetWidth(self.view.frame)-260, 40)];
    _button.backgroundColor = [UIColor orangeColor];
    [_button setTitle:@"获取手机验证码" forState:UIControlStateNormal];
    [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(authCode:) forControlEvents:UIControlEventTouchUpInside];
    
    /** 身份证号 */
    _tf4 = [[UITextField alloc] initWithFrame:CGRectMake(35, 250, CGRectGetWidth(self.view.frame)-70, 40)];
    _tf4.tag = 4;
    _tf4.backgroundColor = [UIColor whiteColor];
    _tf4.borderStyle = UITextBorderStyleBezel;// 边框
    _tf4.placeholder = @"请输入您的身份证号";// 内容提示
    _tf4.clearButtonMode = UITextFieldViewModeAlways;// 清除按钮
    [_tf4 addTarget:self action:@selector(editing:) forControlEvents:UIControlEventEditingChanged];
    
    /** 密码 */
    _tf5 = [[UITextField alloc] initWithFrame:CGRectMake(35, 310, CGRectGetWidth(self.view.frame)-70, 40)];
    _tf5.tag = 5;
    _tf5.backgroundColor = [UIColor whiteColor];
    _tf5.borderStyle = UITextBorderStyleBezel;// 边框
    _tf5.placeholder = @"请输入您的密码";// 内容提示
    _tf5.clearButtonMode = UITextFieldViewModeAlways;// 清除按钮
    [_tf5 addTarget:self action:@selector(editing:) forControlEvents:UIControlEventEditingChanged];
    
    /** 密码确认 */
    _tf6 = [[UITextField alloc] initWithFrame:CGRectMake(35, 370, CGRectGetWidth(self.view.frame)-70, 40)];
    _tf6.tag = 6;
    _tf6.backgroundColor = [UIColor whiteColor];
    _tf6.borderStyle = UITextBorderStyleBezel;// 边框
    _tf6.placeholder = @"请再次输入您的密码";// 内容提示
    _tf6.clearButtonMode = UITextFieldViewModeAlways;// 清除按钮
    [_tf6 addTarget:self action:@selector(editing:) forControlEvents:UIControlEventEditingChanged];
    
    /** 勾选按钮 */
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(35, 430, 30, 30)];
    [btn setImage:[UIImage imageNamed:@"小方框"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"勾选框"] forState:UIControlStateHighlighted];
//    [btn addTarget:self action:@selector(checkBtn:) forControlEvents:UIControlEventTouchUpInside];
    btn.enabled = YES;
    
    /** 用户协议label */
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(80, 425, 200, 40)];
    label.text = @"我已看过并同意《用户协议》";
    label.textColor = [UIColor whiteColor];
    label.adjustsFontSizeToFitWidth = YES;
    label.textAlignment = NSTextAlignmentLeft;
    
    /** 注册按钮 */
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 550, CGRectGetWidth(self.view.frame)-200, 44)];
    btn1.backgroundColor = [UIColor orangeColor];
    btn1.layer.cornerRadius = 5;
    [btn1 setTitle:@"点击注册" forState:UIControlStateNormal];
    
    /** 将控件添加到父视图 */
    [self.view addSubview:imageView];
    [self.view addSubview:_errorInfo];
    [self.view addSubview:_tf1];
    [self.view addSubview:_tf2];
    [self.view addSubview:_tf3];
    [self.view addSubview:_button];
    [self.view addSubview:_tf4];
    [self.view addSubview:_tf5];
    [self.view addSubview:_tf6];
    [self.view addSubview:btn];
    [self.view addSubview:label];
    [self.view addSubview:btn1];

}

# pragma mark 生成验证码
-(void)authCode:(UIButton *)sender
{
    sender.enabled = NO;
    _count = 60;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(time:) userInfo:nil repeats:YES];
    
    // 制造一个随机数字
    NSMutableString *codeStr = [NSMutableString string];
    for (int i=0; i<6; i++) {
        [codeStr appendFormat:@"%d", arc4random()%10];
    }
    _tf3.text = codeStr;
}

# pragma mark 定时器
-(void)time:(NSTimer *)timer
{
    _count--;
    // 当时间到0时需要重新启用按钮 并且把时间设置成60 计时器失效 下次计时不会出错
    if (_count <= 0) {
        _button.enabled = YES;
        _count = 60;
        [_timer invalidate];
    } else {
        NSString *timerStr = [@(_count) stringValue];
        [_button setTitle:[[NSString string] stringByAppendingFormat:@"重新发送(%@秒)",timerStr] forState:UIControlStateDisabled];
    }
}

# pragma mark 监控编辑事件
-(void)editing:(UITextField *)sender
{
    // 验证是否包含敏感词汇
    if ([sender.text containsString:@"qy"] || [sender.text containsString:@"qingyun"] || [sender.text containsString:@"青云"]) {
        _errorInfo.text = @"您输入的内容包含敏感词汇";
        // 如果包含敏感词汇  替换成空格
        sender.text = [sender.text stringByReplacingOccurrencesOfString:@"qy" withString:@""];
        sender.text = [sender.text stringByReplacingOccurrencesOfString:@"qingyun" withString:@""];
        sender.text = [sender.text stringByReplacingOccurrencesOfString:@"青云" withString:@""];
    }
    
    // 用户名
    if (sender.tag == uesrname) {
        // 判断长度是否超过20
        if (sender.text.length > 20) {
            _errorInfo.text = @"您输入的内容超过了规定长度";
            sender.text = [sender.text substringFromIndex:20];
        } else if (sender.text.length <= 20) {
            _errorInfo.text = @"";
        }
        // 判断是否以数字开始
        NSString *firstchar = [sender.text substringToIndex:1];
        if ([_numbers containsObject:firstchar]) {
            _errorInfo.text = @"用户名不能以数字开始";
            sender.text = @"";
        }
        // 判断是否包含*&^#等特殊字符
        if ([sender.text containsString:@"#"] || [sender.text containsString:@"^"] || [sender.text containsString:@"&"] || [sender.text containsString:@"*"]) {
            _errorInfo.text = @"您输入的内容包含特殊字符";
            sender.text = [sender.text stringByReplacingOccurrencesOfString:@"#" withString:@""];
            sender.text = [sender.text stringByReplacingOccurrencesOfString:@"^" withString:@""];
            sender.text = [sender.text stringByReplacingOccurrencesOfString:@"&" withString:@""];
            sender.text = [sender.text stringByReplacingOccurrencesOfString:@"*" withString:@""];
        }
    }
    
    // 手机号
    if (sender.tag == phone) {
        // 只能以 1 开始
        if ([sender.text hasPrefix:@"1"]) {
            // 长度必须是11位
            if (sender.text.length > 11) {
                _errorInfo.text = @"超过了规定的长度";
                sender.text = [sender.text substringToIndex:11];
            } else if (sender.text.length <= 11) {
                _errorInfo.text = @"";
            }
        } else {
            sender.text = @"1";
        }
    }
    
    // 身份证
    if (sender.tag == ID) {
        // 必须开头是 410
        if ([sender.text hasPrefix:@"410"]) {
            // 长度不能超过18位
            if (sender.text.length > 18) {
                _errorInfo.text = @"超过了规定长度";
                sender.text = [sender.text substringToIndex:18];
            } else if (sender.text.length <= 18) {
                _errorInfo.text = @"";
            }
        } else {
            sender.text = @"410";
        }
    }
    
    // 密码
    if (sender.tag == password) {
//        NSString *str = @"[0-9]";
//        NSRegularExpression *regular = [[NSRegularExpression alloc] initWithPattern:str options:NSRegularExpressionCaseInsensitive error:nil];
//        if ([regular matchesInString:sender.text options:0 range:NSMakeRange(0, sender.text.length)]) {
//            _errorInfo.text = @"安全度低";
//        } else {
//            _errorInfo.text = @"12e3";
//        }
//        if ([sender.text compare:@"[0-9]" options:NSRegularExpressionSearch]) {
//            _errorInfo.text = @"安全度低";
//        } else if ([sender.text compare:@"[A-z]" options:NSRegularExpressionSearch] && [sender.text compare:@"[0-9]" options:NSRegularExpressionSearch]) {
//            _errorInfo.text = @"安全度适中";
//        } else if ([sender.text compare:@"[A-z]" options:NSRegularExpressionSearch] && [sender.text compare:@"[0-9]" options:NSRegularExpressionSearch] && [sender.text compare:@"." options:NSRegularExpressionSearch]) {
//            _errorInfo.text = @"安全度最高";
//        } else {
//            _errorInfo.text = @"kgbj";
//        }
    
    }
    
    // 密码确认
    if (sender.tag == repassword) {
        if ([(_tf5.text) isEqualToString:(_tf6.text)]) {
            return;
        } else {
            _errorInfo.text = @"确认密码错误,请重新输入";
        }
    }
    
}

# pragma mark 文本框失去第一响应者，就是编辑结束，收起键盘
-(IBAction)putaway:(UITextField *)textfield
{
    [_tf1 resignFirstResponder];
    [_tf2 resignFirstResponder];
    [_tf3 resignFirstResponder];
    [_tf4 resignFirstResponder];
    [_tf5 resignFirstResponder];
    [_tf6 resignFirstResponder];
}

@end
