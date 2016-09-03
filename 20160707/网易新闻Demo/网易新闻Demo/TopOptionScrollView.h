//
//  TopOptionScrollView.h
//  网易新闻Demo
//
//  Created by qingyun on 16/7/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopOptionScrollView : UIScrollView
@property (nonatomic, copy) void (^optionBtnClicked)(NSInteger index);
@property (nonatomic, assign) NSInteger currentIndex;
+ (instancetype)viewWithFrame:(CGRect)frame andNames:(NSArray *)names;
@end
