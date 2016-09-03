//
//  QYAnswerView.h
//  Demo_青云猜图
//
//  Created by qingyun on 16/6/24.
//  Copyright © 2016年 qingyun. All rights reserved.
//

// 实现代理①:定义协议

#import <UIKit/UIKit.h>


@class QYAnswerView;

@protocol QYAnswerViewDelegate <NSObject>

/** 用户点击了其中一个按钮, 参数代表, 点击按钮的标题 */
- (void)answerView:(QYAnswerView *)answerView didTapedButtonWithTitle:(NSString *)strTitle;

@end

@interface QYAnswerView : UIView

/** 用户已经输入完毕, isRight代表: 答案的正确性 */
@property (nonatomic, copy) void (^blkDidCompleteCollectting)(BOOL isRight);

/** 通知点击按钮的代理 */
@property (nonatomic, weak) id<QYAnswerViewDelegate> delegate;

@property (nonatomic, copy) NSString *strAnswer;

+ (instancetype)answerViewWithWordCount:(NSUInteger)count;

- (void)pushWord:(NSString *)strWord isTip:(BOOL)isTip index:(NSInteger)index;

@end
