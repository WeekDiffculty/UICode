//
//  QYAnswerView.m
//  Demo_青云猜图
//
//  Created by qingyun on 16/6/24.
//  Copyright © 2016年 qingyun. All rights reserved.
//

/** Color Related */
#define QLColorWithRGB(redValue, greenValue, blueValue) ([UIColor colorWithRed:((redValue)/255.0) green:((greenValue)/255.0) blue:((blueValue)/255.0) alpha:1])
#define QLColorRandom QLColorWithRGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
#define QLColorFromHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#import "QYAnswerView.h"

static CGFloat const QYWordButtonWidth = 40;
static CGFloat const QYWordButtonHeight = 40;
static CGFloat const QYWordGap = 10;

@interface QYAnswerView ()
{
    /** 当前用户输入的文字的个数 */
    NSInteger _currentWordCount;
}

@property (nonatomic, strong) NSMutableArray *arrMWords;

@end

@implementation QYAnswerView

/** 懒加载数组 */
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

+ (instancetype)answerViewWithWordCount:(NSUInteger)count {
    QYAnswerView *answerView = [QYAnswerView new];
    CGFloat answerViewWidth = (count * QYWordButtonWidth) + (count - 1) * QYWordGap;
    answerView.bounds = CGRectMake(0, 0, answerViewWidth, QYWordButtonHeight);
    
    for (NSUInteger index = 0; index < count; index ++) {
        UIButton *btnWord = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat wordButtonX = index * (QYWordButtonWidth + QYWordGap);
        btnWord.frame = CGRectMake(wordButtonX, 0, QYWordButtonWidth, QYWordButtonHeight);
        [btnWord setBackgroundImage:[UIImage imageNamed:@"btn_answer"] forState:UIControlStateNormal];
         [btnWord setBackgroundImage:[UIImage imageNamed:@"btn_answer_highlighted"] forState:UIControlStateHighlighted];
        [btnWord setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        // target: 响应btnWord点击事件的对象
        // 类对象只能调用类方法
        [btnWord addTarget:answerView action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
        [answerView addSubview:btnWord];
    }
    
    return answerView;
}

// 传入一个文字并赋值到对应的Button上
- (void)pushWord:(NSString *)strWord isTip:(BOOL)isTip index:(NSInteger)indexTip {
    if (isTip) { // 提示输入文字
        // 1, 修改当前用户输入的文字个数
        NSString *strCollect = self.arrMWords[indexTip];
        if ([strCollect isEqualToString:@""]) { // 如果为空, 说明类似在相应的位置输入一个文字
            _currentWordCount += 1;
        }
        
        // 2, 修改数组中对应索引的字符串
        [self.arrMWords replaceObjectAtIndex:indexTip withObject:strWord];
        
        // 3, 修改对应button上的标题
        UIButton *btnWord = self.subviews[indexTip];
        [btnWord setTitle:strWord forState:UIControlStateNormal];
        btnWord.enabled = YES;
        
        
    } else {
        // 1, 先取出答案文字的个数
        NSUInteger count = self.strAnswer.length;
        if (_currentWordCount < count) {
            // 2, 遍历所有的数组中的内容看是不是空字符串
            for (NSUInteger index = 0; index < count; index ++) {
                // 把数组中第一个为空的元素替换成传进来的标题
                if ([self.arrMWords[index] isEqualToString:@""]) { // 当前的内容是@""
                    // 替换数组中的内容
                    [self.arrMWords replaceObjectAtIndex:index withObject:strWord];
                    
                    // 设置对应Button的标题
                    UIButton *btnWord = self.subviews[index];
                    [btnWord setTitle:strWord forState:UIControlStateNormal];
                    btnWord.enabled = YES;
                    
                    // 添加文字成功, 文字个数加1
                    _currentWordCount ++;
                    
                    break;
                }
            }
            
        }
    }
    // 判断当输入当前这个字的时候文字应该显示什么颜色
    NSString *strResultTemp = [self.arrMWords componentsJoinedByString:@""];
    if ([strResultTemp isEqualToString:self.strAnswer]) { // 用户输入和答案是相等的
        if (self.blkDidCompleteCollectting) {
            self.blkDidCompleteCollectting(YES);
        }
    } else { // 用户的输入和答案不等
        if (_currentWordCount == self.strAnswer.length) { // 长度一样但是答案是错误的
            if (self.blkDidCompleteCollectting) {
                self.blkDidCompleteCollectting(NO);
            }
        }
    }
    
    // 修改颜色
    [self judgeColor];
    
}

- (void)cancelAction:(UIButton *)button {
    // 调用代理
    if ([self.delegate respondsToSelector:@selector(answerView:didTapedButtonWithTitle:)]) {
        // button.currentTitle
        NSString *strTitle = [button titleForState:UIControlStateNormal];
        [self.delegate answerView:self didTapedButtonWithTitle:strTitle];
    }
    // 踢出点击按钮对应的文字
    [self kickoutWord:button];
}

/** 踢出一个文字 */
- (void)kickoutWord:(UIButton *)button {
    if (_currentWordCount == 0) return;
    
    // 改变用户输入文字的个数
    _currentWordCount -= 1;
    
    // 1, 设置这个Button的title
    [button setTitle:@"" forState:UIControlStateNormal];
    button.enabled = NO;
    
    // 2, 设置数组中对应的索引为占位符(@"")
    NSUInteger index = [self.subviews indexOfObject:button];
    [self.arrMWords replaceObjectAtIndex:index withObject:@""];
    
    // 3, 改变颜色
    [self judgeColor];
}

- (void)judgeColor {
    NSString *strResultTemp = [self.arrMWords componentsJoinedByString:@""];
    if ([strResultTemp isEqualToString:self.strAnswer]) { // 用户输入和答案是相等的
        [self updateTitleColor:[UIColor greenColor]];
    } else { // 用户的输入和答案不等
        if (_currentWordCount == self.strAnswer.length) { // 长度一样但是答案是错误的
            [self updateTitleColor:[UIColor redColor]];
        } else { // 长度不一样
            [self updateTitleColor:[UIColor blackColor]];
        }
    }
}

- (void)updateTitleColor:(UIColor *)color {
    NSArray *arrSubviews = self.subviews;
    NSUInteger count = arrSubviews.count;
    for (NSUInteger index = 0; index < count; index ++) {
        UIButton *button = arrSubviews[index];
        [button setTitleColor:color forState:UIControlStateNormal];
    }
}

/*!
 * 
 // 0, 添加到数组中
 [self.arrMWords addObject:strWord];
 
 // 1, 取出对应的Button
 UIButton *btnWord = self.subviews[_indexCurrent];
 
 // 2, 给对应的Button设置Title
 [btnWord setTitle:strWord forState:UIControlStateNormal];
 
 // 3, 判断正确性
 // 当用户把文字输入完成后进行判断
 if (self.arrMWords.count == self.strAnswer.length) { // 输入完毕
 NSString *strTest = [self.arrMWords componentsJoinedByString:@""];
 if ([strTest isEqualToString:self.strAnswer]) { // 输入正确
 [self adjustColor:[UIColor greenColor]];
 } else {
 [self adjustColor:[UIColor redColor]];
 }
 }
 
 // 4, 索引自增
 _indexCurrent ++;
 */

@end
