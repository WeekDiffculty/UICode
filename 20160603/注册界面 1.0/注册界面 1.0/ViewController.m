//
//  ViewController.m
//  注册界面 1.0
//
//  Created by qingyun on 16/6/3.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (nonatomic,assign) NSInteger count;
@property (nonatomic,assign) NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"qw.jpg"]];
    image.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [self.view addSubview:image];
    
    _la1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 20,180, 30)];
    _la1.text = @"杨亚栋,登录后更多精彩 ";
    _la1.textColor = [UIColor blackColor];
    _la1.font = [UIFont systemFontOfSize:15];
    _la1.textAlignment = NSTextAlignmentLeft;
    
    _la2 = [[UILabel alloc] initWithFrame:CGRectMake(30, 60, self.view.frame.size.width-60, 30)];
    _la2.textColor = [UIColor grayColor];
    _la2.font = [UIFont systemFontOfSize:15];
    _la2.textAlignment = NSTextAlignmentLeft;
    
    _la3 = [[UILabel alloc] initWithFrame:CGRectMake(70, 400,220, 30)];
    
    _la3.text = @"我已看过并同意《用户协议》";
    _la3.textColor = [UIColor blackColor];
    _la3.font = [UIFont systemFontOfSize:15];
    _la3.textAlignment = NSTextAlignmentLeft;

    [self.view addSubview:_la1];
    [self.view addSubview:_la2];
    [self.view addSubview:_la3];
    
    _text1 = [[UITextField alloc] initWithFrame:CGRectMake(30, 100, self.view.frame.size.width-60, 40)];
    _text1.backgroundColor = [UIColor whiteColor];
    _text1.borderStyle = UITextBorderStyleRoundedRect;
    _text1.placeholder = @"  请输入用户名";
    _text1.clearButtonMode = UITextFieldViewModeAlways;
    _text1.keyboardType = UIKeyboardTypeASCIICapable;
    
    _text2 = [[UITextField alloc] initWithFrame:CGRectMake(30, 150, self.view.frame.size.width-60, 40)];
    _text2.backgroundColor = [UIColor whiteColor];
    _text2.borderStyle = UITextBorderStyleRoundedRect;
    _text2.placeholder = @"  请输入用户账户(手机号)";
    _text2.clearButtonMode = UITextFieldViewModeAlways;
    _text2.keyboardType = UIKeyboardTypeNumberPad;
    
    _text3= [[UITextField alloc] initWithFrame:CGRectMake(30, 200, 203, 40)];
    _text3.backgroundColor = [UIColor whiteColor];
    _text3.borderStyle = UITextBorderStyleRoundedRect;
    _text3.placeholder = @"  请输入手机验证码";
    _text3.clearButtonMode = UITextFieldViewModeAlways;
    _text3.keyboardType = UIKeyboardTypeNumberPad;
    
    _text4 = [[UITextField alloc] initWithFrame:CGRectMake(30, 250, self.view.frame.size.width-60, 40)];
    _text4.backgroundColor = [UIColor whiteColor];
    _text4.borderStyle = UITextBorderStyleRoundedRect;
    _text4.placeholder = @"  请输入身份证号";
    _text4.clearButtonMode = UITextFieldViewModeAlways;
    _text4.keyboardType = UIKeyboardTypeNumberPad;
    
    _text5 = [[UITextField alloc] initWithFrame:CGRectMake(30, 300, self.view.frame.size.width-60, 40)];
    _text5.backgroundColor = [UIColor whiteColor];
    _text5.borderStyle = UITextBorderStyleRoundedRect;
    _text5.placeholder = @"  请输入登录密码";
    _text5.clearButtonMode = UITextFieldViewModeAlways;
    _text5.keyboardType = UIKeyboardTypeNumberPad;
    
    _text6 = [[UITextField alloc] initWithFrame:CGRectMake(30, 350, self.view.frame.size.width-60, 40)];
    _text6.backgroundColor = [UIColor whiteColor];
    _text6.borderStyle = UITextBorderStyleRoundedRect;
    _text6.placeholder = @"  请再次输入一次密码";
    _text6.clearButtonMode = UITextFieldViewModeAlways;
    _text6.keyboardType = UIKeyboardTypeNumberPad;

    
    [self.view addSubview:_text1];
    [self.view addSubview:_text2];
    [self.view addSubview:_text3];
    [self.view addSubview:_text4];
    [self.view addSubview:_text5];
    [self.view addSubview:_text6];
    
    UIButton *b1 = [[UIButton alloc] initWithFrame:CGRectMake(230, 200, CGRectGetWidth(self.view.frame)-260, 40)];
    b1.backgroundColor = [UIColor orangeColor];
    [b1 setTitle:@"获取手机验证码" forState:UIControlStateNormal];
    [b1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    b1.titleLabel.adjustsFontSizeToFitWidth = YES;
    b1.layer.cornerRadius = 5;
    b1.layer.masksToBounds = YES;
    
    UIButton *b2 = [[UIButton alloc] initWithFrame:CGRectMake(30, 400, 30, 30)];
    [b2 setImage:[UIImage imageNamed:@"小方框"] forState:UIControlStateNormal];
    
    UIButton *b3 = [[UIButton alloc] initWithFrame:CGRectMake(40, 445, self.view.frame.size.width-80, 45)];
    b3.backgroundColor = [UIColor orangeColor];
    b3.layer.cornerRadius = 9;
    b3.layer.masksToBounds = YES;
    [b3 setTitle:@"点击注册" forState:UIControlStateNormal];
    [b3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.view addSubview:b1];
    [self.view addSubview:b2];
    [self.view addSubview:b3];
    
    [_text1 addTarget:self action:@selector(editing1:) forControlEvents:UIControlEventEditingChanged];
    [_text2 addTarget:self action:@selector(editing2:) forControlEvents:UIControlEventEditingChanged];
    [_text4 addTarget:self action:@selector(editing4:) forControlEvents:UIControlEventEditingChanged];
    [_text5 addTarget:self action:@selector(editing5:) forControlEvents:UIControlEventEditingChanged];
    [_text6 addTarget:self action:@selector(editing6:) forControlEvents:UIControlEventEditingChanged];
    
    [b1 addTarget:self action:@selector(click1:) forControlEvents:UIControlEventTouchUpInside];
    
    [b2 addTarget:self action:@selector(click2:) forControlEvents:UIControlEventTouchUpInside];
    
    [b3 addTarget:self action:@selector(click3:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)backGroung:(id)sender
{
    [_text6 resignFirstResponder];
    [_text5 resignFirstResponder];
    [_text4 resignFirstResponder];
    [_text3 resignFirstResponder];
    [_text2 resignFirstResponder];
    [_text1 resignFirstResponder];
}

- (void)editing1:(UITextField *)text1
{
    if ([text1.text containsString:@"qy"]||[text1.text containsString:@"qingyun"]||[text1.text containsString:@"青云"]) {
        _la2.text = @"你输入的内容包含敏感词汇";
        text1.text = [text1.text stringByReplacingCharactersInRange:[text1.text rangeOfString:@"qy"] withString:@""];
    }else {
        _la2.text = @"";
    }
    if (text1.text.length > 12) {
        _la2.text = @"你输入的内容过长";
        text1.text = [text1.text substringToIndex:12];
    }else {
        _la2.text = @"";
    }
    
}

- (void)editing2:(UITextField *)text2
{
    if (text2 == self.text2) {
        if (text2.text.length > 11) {
            _la2.text = @"输入的数字不能超过11位";
            text2.text = [text2.text substringToIndex:11];
        }else if(text2.text.length <=11){
            _la2.text = @"";
        }if (![text2.text hasPrefix:@"1"]) {
        _la2.text = @"手机号第一位是1";
        
    }
    }
}

- (void)editing4:(UITextField *)text4
{
    if (text4 == self.text4) {
        if (![text4.text hasPrefix:@"4"]) {
            _la2.text = @"河南身份证开始是4";
        }else if ( [text4.text hasPrefix :@"4"]){
            _la2.text = @"";
        }
        if (text4.text.length > 18) {
            _la2.text = @"身份证号码长度不能超过18位";
            text4.text = [text4.text substringToIndex:18];
        }
    }
}

- (void)editing5:(UITextField *)text5
{
    text5.secureTextEntry = YES;
    if (text5 == self.text5) {
        if (text5.text.length > 6) {
            _la2.text = @"请输入6位密码";
            text5.text = [text5.text substringToIndex:6];
        }else {
            _la2.text  = @"";
        }
    }
    
}

- (void)editing6:(UITextField *)text6
{
    text6.secureTextEntry = YES;
    if (text6 == self.text6) {
        if (text6.text.length > 6) {
            _la2.text = @"请输入6位密码";
            text6.text = [text6.text substringToIndex:6];
        }else {
            _la2.text  = @"";
        }
        if (!(text6.text == _text5.text)) {
            _la2.text = @"请输入相同的密码";
        }else {
            _la2.text = @"";
        }
    }
}

- (void)click1:(UIButton *)sender
{
    
    sender.enabled = NO;
    _count = 59;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(time:) userInfo:nil repeats:YES];
    
    NSMutableString *changeString = [NSMutableString string];
    for (int i = 0; i<6; i++) {
        [changeString appendFormat:@"%d",arc4random()%10];
    }
    _text3.text = changeString;
    
    
}

- (void)time:(NSTimer *)timer
{
    _count--;
    if (_count <= 0) {
        _btn1.enabled = YES;
        _count = 59;
        [_timer invalidate];
    }else {
        NSString *timerStr = [@(_count) stringValue];
        //NSMutableString *stt = [NSMutableString stringWithFormat:@"s后重新发送验证码"];
        //[stt stringByAppendingString:timerStr];
        [_btn1 setTitle:timerStr forState:UIControlStateNormal];
    }
}

- (void)click2:(UIButton *)sender
{
    if ([sender  isEqual: @"小方框"]) {
        [sender setImage:[UIImage imageNamed:@"勾选框"] forState:UIControlStateNormal];
    }else if ([sender isEqual:@"勾选框"]){
        [sender setImage:[UIImage imageNamed:@"小方框"] forState:UIControlStateNormal];
    }
}

- (void)click3:(UIButton *)sender
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
