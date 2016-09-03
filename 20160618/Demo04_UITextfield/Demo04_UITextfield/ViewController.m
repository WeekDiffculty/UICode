//
//  ViewController.m
//  Demo04_UITextfield
//
//  Created by qingyun on 16/6/18.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (nonatomic, assign) NSUInteger times;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.times = 0;
    
    // 键盘也是在一个UIWindow对象上显示的
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(50, 50, 200, 40)];
    textField.backgroundColor = [UIColor orangeColor];
    // text属性是经常用来取用户输入的字符串
    //textField.text = @"你狠流弊";
    // 占位字符串， 提示用户输入的内容
    //textField.placeholder = @"你流弊吗？";
    
    // 左边的占位view
    // 在iOS中 属性中凡是有left，right，center之类的一些view， 设置他的frame的位置是没有作用的
    UIView *viewLeft = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 1)];
    //viewLeft.backgroundColor = [UIColor greenColor];
    textField.leftView = viewLeft;
    textField.leftViewMode = UITextFieldViewModeAlways;
    
    // 设置return键的文字
    textField.returnKeyType = UIReturnKeyDone;
    
    
    // 右边的view
    textField.rightView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [textField setRightViewMode:UITextFieldViewModeAlways];
    
    textField.delegate = self;
    
    [self.view addSubview:textField];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

#pragma mark - UITextFieldDelegate
// 当用户点击键盘上的回车键的时候就会调用这个代理方法
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.view endEditing:YES];
    return YES;
}

// 结束编辑的时候调用
- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"%s", __FUNCTION__);
}
// 开始编辑的时候调用
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"%s", __FUNCTION__);
}
// 是否允许进入编辑状态
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NSLog(@"%s", __FUNCTION__);
    self.times ++;
    if (self.times % 2 == 0) {
        return YES;
    } else {
        return NO;
    }
}

// 询问String字符串是否应该替换在range的位置
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSLog(@"=========\n%@", NSStringFromRange(range));
    NSLog(@"%@=======\n", string);
    self.times ++;
    if (self.times % 2 == 0) {
        return YES;
    } else {
        return NO;
    }
}

@end
