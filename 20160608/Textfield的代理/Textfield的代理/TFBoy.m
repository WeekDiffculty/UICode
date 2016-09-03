//
//  TFBoy.m
//  Textfield的代理
//
//  Created by qingyun on 16/6/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "TFBoy.h"

@implementation TFBoy


// 将要开始编辑的时候
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    //
    return YES;
}

// 输入内容时会触发该事件，如果返回NO，那个录入的内容就不会生效
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"range >>>> %@ %@ %@", textField.text, NSStringFromRange(range), string);
    if ([string isEqualToString:@"d"]) {
        return NO;
    } else {
        return YES;
    }
}

//- (BOOL)textFieldShouldClear:(UITextField *)textField;               // called when clear button pressed. return NO to ignore (no notifications)
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"RETURN");
    return YES;
}

@end
