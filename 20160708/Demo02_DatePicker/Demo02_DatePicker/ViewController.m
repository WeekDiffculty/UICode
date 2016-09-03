//
//  ViewController.m
//  Demo02_DatePicker
//
//  Created by qingyun on 16/7/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txfDate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDefaultSetting];
}

- (void)loadDefaultSetting {
    UIDatePicker *datePicker = [UIDatePicker new];
    // 设置只显示日期
    datePicker.datePickerMode = UIDatePickerModeDate;
    // 设置显示中文
    datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh_cn"];
    // 添加valueChanged事件的监听器
    [datePicker addTarget:self action:@selector(changedValueAction:) forControlEvents:UIControlEventValueChanged];
    
    self.txfDate.inputView = datePicker;
    
    // self.txfDate.enabled = NO;
    self.txfDate.delegate = self;
}

#pragma mark - 🎬 Action Methods
- (void)changedValueAction:(UIDatePicker *)datePicker {
    NSLog(@"%@", datePicker.date);
    // 创建一个格式化工具
    NSDateFormatter *formatter = [NSDateFormatter new];
    // 设置格式化工具目标样式
    formatter.dateFormat = @"yyyy-MM-dd";
    // 把DatePicker当前的日期转化成目标样式的字符串
    NSString *strDate = [formatter stringFromDate:datePicker.date];
    // 赋值
    self.txfDate.text = strDate;
}

#pragma mark - 🔌 Delegate Methods
#pragma mark UITextFieldDelegate
//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
//    return NO;
//}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self changedValueAction:(UIDatePicker *)self.txfDate.inputView];
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSLog(@"%s", __FUNCTION__);
    return NO;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //[self.view endEditing:YES];
    [self.txfDate resignFirstResponder];
}

@end
