//
//  QYOptionView.m
//  Demo_青云猜图
//
//  Created by qingyun on 16/6/24.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYOptionView.h"

@interface QYOptionView ()
{
    /** 当前用户输入的文字的个数 */
    NSInteger _currentWordCount;
    
    /** 区别是用户输入, 还是提示 */
    BOOL _isTip;
    
    /** 当前提示的索引 */
    NSInteger _indexTip;
}

/** 用户输入的数组 */
@property (nonatomic, strong) NSMutableArray *arrMWords;

@end

@implementation QYOptionView

- (NSMutableArray *)arrMWords {
    if (!_arrMWords) {
        // 1, 先取出答案文字的个数
        NSUInteger count = self.strAnswer.length;
        // 创建可变数组并开辟相应个数的空间
        _arrMWords = [NSMutableArray arrayWithCapacity:count];
        // 添加count个空字符串
        for (NSUInteger index = 0; index < count; index ++) {
            [_arrMWords addObject:@""];
        }
    }
    return _arrMWords;
}

+ (instancetype)optionView {
    return [[[NSBundle mainBundle] loadNibNamed:@"QYOptionView" owner:nil options:nil] firstObject];
}

- (void)setArrButtonTitles:(NSArray *)arrButtonTitles {
    _arrButtonTitles = [arrButtonTitles copy];
    
    // 清空之前的输入计数
    _currentWordCount = 0;
    self.arrMWords = nil;
    
    // 取出所有的子视图
    NSArray *arrSubviews = self.subviews;
    // 子视图的个数
    NSUInteger count = arrSubviews.count;
    // 遍历所有的子视图
    for (NSUInteger index = 0; index < count; index ++) {
        UIView *view = arrSubviews[index];
        // 判断这个view是不是一个UIButton
        if ([view isKindOfClass:[UIButton class]]) {
            // 强制转换Button
            UIButton *btnOption = (UIButton *)view;
            [btnOption setTitle:arrButtonTitles[index] forState:UIControlStateNormal];
            [btnOption addTarget:self action:@selector(chooseAction:) forControlEvents:UIControlEventTouchUpInside];
            
            // 设置标题的时候就说明进入了一个新的题目, 那么所有的按钮都应该是可以点击的
            btnOption.enabled = YES;
        }
    }
}

/** 按钮的触发事件 */
- (void)chooseAction:(UIButton *)button {
    if (self.blkDidChooseButton) {
        self.blkDidChooseButton([button titleForState:UIControlStateNormal], _isTip, _indexTip);
    }
    
    if (_currentWordCount < self.strAnswer.length) {
        button.enabled = NO;
        _currentWordCount += 1;
        
        NSString *strRightCollect = [button titleForState:UIControlStateNormal];
        if (_isTip) { // 表示提示
            [self.arrMWords replaceObjectAtIndex:_indexTip withObject:strRightCollect];
            _isTip = NO;
        } else { // 表示用户输入
            NSUInteger count = self.strAnswer.length;
            for (NSUInteger index = 0; index < count; index ++) {
                NSString *strTitleCollect = self.arrMWords[index];
                if ([@"" isEqualToString:strTitleCollect]) { // 找到了第一个为空的字符串
                    [self.arrMWords replaceObjectAtIndex:index withObject:strRightCollect];
                    break;
                }
            }
        }
        
    }
}

// 把不能点的Button点亮
- (void)lightButtonWithTitle:(NSString *)strTitle {
    NSArray *arrsubViews = self.subviews;
    NSUInteger count = arrsubViews.count;
    
    for (NSUInteger index = 0; index < count; index ++) {
        UIButton *btnOption = arrsubViews[index];
        NSString *strTempTitle = [btnOption titleForState:UIControlStateNormal];
        if ([strTitle isEqualToString:strTempTitle] && btnOption.enabled == NO) {
            btnOption.enabled = YES;
            _currentWordCount -= 1;
            
            // 把对应的索引的文字换成空字符串
            NSUInteger countAnswer = self.strAnswer.length;
            for (NSUInteger indexJ = 0; indexJ < countAnswer; indexJ ++) {
                NSString *strTemp  = self.arrMWords[indexJ];
                if ([strTemp isEqualToString:strTitle]) {
                    [self.arrMWords replaceObjectAtIndex:indexJ withObject:@""];
                    break;
                }
            }
            
            break;
        }
    }
}

/** 提示一下 */
- (BOOL)tipOnetime {
    // 1, 判断用户输入字符串和正确答案是否一致, 如果一致, 直接返回
    NSString *strCollect = [self.arrMWords componentsJoinedByString:@""];
    if ([strCollect isEqualToString:self.strAnswer]) return NO;
    
    // 2, 一个一个的比对, 遇到不一样的, 直接替换, 并且终止循环
    NSUInteger count = self.strAnswer.length;
    for (NSUInteger index = 0; index < count; index ++) {
        NSString *strRight = [self.strAnswer substringWithRange:NSMakeRange(index, 1)];
        NSString *strCollect = self.arrMWords[index];
        if (![strRight isEqualToString:strCollect]) {
            _indexTip = index;
            _isTip = YES;
            [self lightButtonWithTitle:strCollect];
            UIButton *button = [self buttonWithTitle:strRight];
            [self chooseAction:button];
            break;
        }
    }
    
    return YES;
}

/** 根据提供的标题找到对应的button */
- (UIButton *)buttonWithTitle:(NSString *)strTitle {
    NSUInteger count = self.subviews.count;
    for (NSUInteger index = 0; index < count; index ++) {
        UIButton *btnOption = self.subviews[index];
        NSString *strTemp = [btnOption titleForState:UIControlStateNormal];
        if ([strTemp isEqualToString:strTitle]) {
            return btnOption;
        }
    }
    return nil;
}

@end
