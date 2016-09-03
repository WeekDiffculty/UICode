//
//  ViewController.m
//  Demo04_UITextView
//
//  Created by qingyun on 16/7/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self loadDefaultSetting];
}

- (void)loadDefaultSetting {
    self.textView.layer.borderColor = [[UIColor orangeColor] CGColor];
    self.textView.layer.borderWidth = 1.0;
    
    self.textView.font = [UIFont systemFontOfSize:18];
    
    // 默认内容
    self.textView.text = @"你们真流弊你们真流弊你们真流弊你们真流弊你们真流弊你们真流弊你们真流弊你们真流弊你们真流弊你们真流弊你们真流弊你们真流弊你们真流弊你们真流弊你们真流弊你们真流弊你们真流弊你们真流弊你们真流弊你们真流弊";
    // 文字颜色
    self.textView.textColor = [UIColor orangeColor];
    
    // 对齐方式
    self.textView.textAlignment = NSTextAlignmentLeft;
    
    // 全选所有的文本
    self.textView.clearsOnInsertion = YES;
    
    // 响应这个TextView的自定义键盘
    //UIView *viewKeyBoard = [UIView new];
    //viewKeyBoard.bounds = CGRectMake(0, 0, 0, 200);
    //viewKeyBoard.backgroundColor = [UIColor cyanColor];
    //self.textView.inputView = viewKeyBoard;
    
    // 键盘上的工具条
    //UIView *viewAccessory = [UIView new];
    //viewAccessory.bounds = CGRectMake(0, 0, 0, 44);
    //viewAccessory.backgroundColor = [UIColor redColor];
    //self.textView.inputAccessoryView = viewAccessory;
    
    // 添加键盘弹出通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    
    // 添加键盘收回通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillDisappear:) name:UIKeyboardWillHideNotification object:nil];
    
    // UITextField和UITextView都有三个通知:
    // 1, 文本内容发生变化
    // 2, 已经开始编辑
    // 3, 已经结束编辑
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changedText) name:UITextViewTextDidChangeNotification object:nil];
    
    self.textView.delegate = self;
}

#pragma mark - 🎬 Action Methods
/** 键盘即将显示的时候调用的方法 */
// 所有的结构体存放在数组等集合内, 必须先封装成NSValue对象
- (void)keyBoardWillAppear:(NSNotification *)notification {
    NSValue *valueRect = notification.userInfo[UIKeyboardFrameEndUserInfoKey];
    CGRect rectEnd = [valueRect CGRectValue];
    
    NSLog(@"%@", NSStringFromCGRect(rectEnd));
}

/** 键盘即将消失的时候调用该方法 */
- (void)keyBoardWillDisappear:(NSNotification *)notification {
    NSValue *valueRect = notification.userInfo[UIKeyboardFrameEndUserInfoKey];
    CGRect rectEnd = [valueRect CGRectValue];
    
    NSLog(@"%@", NSStringFromCGRect(rectEnd));
}

- (void)changedText {
    NSLog(@"Text:%@", self.textView.text);
}

#pragma mark - UITextViewDelegate
/** 是否应该开始编辑 */
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    return YES;
}
/** 是否应该结束编辑 */
- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    return YES;
}
/** 已经开始编辑 */
- (void)textViewDidBeginEditing:(UITextView *)textView {
    NSLog(@"%s", __func__);
}
/** 已经结束编辑 */
- (void)textViewDidEndEditing:(UITextView *)textView {
    NSLog(@"%s", __func__);
}
/** 是否在指定的范围替换文本:text */
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    NSLog(@"%s", __func__);
    return YES;
}
/** 文本已经改变 */
- (void)textViewDidChange:(UITextView *)textView {
    NSLog(@"%s", __func__);
}

/** 选中的范围已经改变 */
- (void)textViewDidChangeSelection:(UITextView *)textView {
    NSLog(@"%@", NSStringFromRange(textView.selectedRange));
}

/** 是否在指定范围内相应URL的点击 */
- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    NSLog(@"%s", __func__);
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)dealloc {
    // 把自己从通知中心移除
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
