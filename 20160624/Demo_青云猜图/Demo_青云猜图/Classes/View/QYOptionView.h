//
//  QYOptionView.h
//  Demo_青云猜图
//
//  Created by qingyun on 16/6/24.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYOptionView : UIView

/** 正确的答案 */
@property (nonatomic, copy) NSString *strAnswer;

/** Button的选择触发事件 */
@property (nonatomic, copy) void (^blkDidChooseButton)(NSString *strTitle, BOOL isTip, NSInteger indexTip);

/** 选项按钮的文字数组 */
@property (nonatomic, copy) NSArray *arrButtonTitles;

+ (instancetype)optionView;

- (void)lightButtonWithTitle:(NSString *)strTitle;

/** 提示一下, 返回值表示是否提示成功 */
- (BOOL)tipOnetime;

@end
