//
//  ViewController.m
//  UITextfield
//
//  Created by qingyun on 16/6/3.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad]; 
    
    _username = [[UITextField alloc] initWithFrame:CGRectMake(50, 200, CGRectGetWidth(self.view.frame)-100, 44)];
    // 边框样式
    _username.borderStyle = UITextBorderStyleBezel;
    
    // 内容提示
    _username.placeholder = @"请输入您的名字";
    
    // 清楚按钮
    _username.clearButtonMode = UITextFieldViewModeAlways;
    
    // 键盘格式
    //_username.keyboardType = UIKeyboardTypeASCIICapable;
    _username.keyboardAppearance = UIKeyboardAppearanceDark;
    
//    // 辅助键盘
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 44)];
//    view.backgroundColor = [UIColor orangeColor];
//    _username.inputAccessoryView = view;
//    //_username.inputView = view;
    
    // 左右视图
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    leftView.backgroundColor = [UIColor orangeColor];
    _username.leftView = leftView;
    _username.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *rightView = [[ UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    rightView.backgroundColor = [UIColor greenColor];
    _username.rightView = rightView;
    _username.rightViewMode = UITextFieldViewModeAlways;
    
    
    [_loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchDown];
    
    // 给username添加一个编辑改变的事件，可以用来监控用户输入的改变
    [_username addTarget:self action:@selector(editing:) forControlEvents:UIControlEventEditingChanged];
    
    [self.view addSubview:_username];
    

}

- (void)login
{
    NSLog(@"username >>>>> %@", _username.text);
    // 让文本框失去第一响应者，就是结束编辑，收起键盘
    [_username resignFirstResponder];
}

- (void)editing:(UITextField *)textfield
{
    NSLog(@"username >>>>>>> %@", textfield.text);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
