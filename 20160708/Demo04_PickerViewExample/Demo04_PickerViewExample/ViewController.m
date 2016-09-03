//
//  ViewController.m
//  Demo04_PickerViewExample
//
//  Created by qingyun on 16/7/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>
{
    __weak UIPickerView *_pvCaiPin;
    __weak UIPickerView *_pvHede;
}

/** 菜单数据 */
@property (nonatomic, copy) NSDictionary *dicCaiDan;
@property (weak, nonatomic) IBOutlet UITextField *txfCaiPin;
@property (weak, nonatomic) IBOutlet UITextField *txfHede;

@end

@implementation ViewController

/** 懒加载数据 */
- (NSDictionary *)dicCaiDan {
    if (!_dicCaiDan) {
        NSString *strFilePath = [[NSBundle mainBundle] pathForResource:@"CaiDan" ofType:@"plist"];
        _dicCaiDan = [NSDictionary dictionaryWithContentsOfFile:strFilePath];
    }
    return _dicCaiDan;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDefaultSetting];
}

- (void)loadDefaultSetting {
    // 设置自定义键盘
    UIPickerView *pvCaiPin = [UIPickerView new];
    pvCaiPin.dataSource = self;
    pvCaiPin.delegate = self;
    self.txfCaiPin.inputView = pvCaiPin;
    _pvCaiPin = pvCaiPin;
    
    self.txfCaiPin.delegate = self;
    
    UIPickerView *pvHede = [UIPickerView new];
    pvHede.dataSource = self;
    pvHede.delegate = self;
    self.txfHede.inputView = pvHede;
    _pvHede = pvHede;
    
    self.txfHede.delegate = self;
}

#pragma mark - 🔌 Delegate Methods
#pragma mark UIPickerViewDataSource, UIPickerViewDelegate
/** 选择器中组件的个数/ 有多少列 */
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}
/** 在Component中有多少行 */
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (pickerView == _pvCaiPin) {
        return [self.dicCaiDan[@"caipin"] count];
    } else {
        return [self.dicCaiDan[@"hede"] count];
    }
}
/** 在Component中的第row行显示的标题 */
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (pickerView == _pvCaiPin) {
        return self.dicCaiDan[@"caipin"][row];
    } else {
        return self.dicCaiDan[@"hede"][row];
    }
}
/** 选中和Component中第row行 */
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (pickerView == _pvCaiPin) {
        NSString *strTitleCaiPin = self.dicCaiDan[@"caipin"][row];
        self.txfCaiPin.text = strTitleCaiPin;
    } else {
        NSString *strTitleHede = self.dicCaiDan[@"hede"][row];
        self.txfHede.text = strTitleHede;
    }
}
#pragma mark UITextFieldDelegate
/** 是否允许用户在range范围内替换字符串 */
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return NO;
}
/** 已经开始编辑 */
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == self.txfCaiPin) {
        NSInteger row = [_pvCaiPin selectedRowInComponent:0];
        [self pickerView:_pvCaiPin didSelectRow:row inComponent:0];
    } else {
        NSInteger row = [_pvHede selectedRowInComponent:0];
        [self pickerView:_pvHede didSelectRow:row inComponent:0];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
