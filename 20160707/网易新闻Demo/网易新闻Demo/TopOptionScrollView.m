//
//  TopOptionScrollView.m
//  网易新闻Demo
//
//  Created by qingyun on 16/7/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "TopOptionScrollView.h"
#import "QYCommon.h"

@interface TopOptionScrollView()
@property (nonatomic, strong) UIColor *selectedColor;
@end
@implementation TopOptionScrollView

- (instancetype)initWithFrame:(CGRect)frame andNames:(NSArray *)names
{
    if (self = [super initWithFrame:frame]) {
        //初始化contentSize
        self.selectedColor = [UIColor blackColor];
        self.backgroundColor = [UIColor redColor];
        self.contentSize = CGSizeMake(kOPTION_WIDTH * names.count, 0);
       //初始化btn
        for (NSUInteger index = 0; index < names.count; index ++) {
            UIButton *optionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            optionBtn.frame = CGRectMake(index * kOPTION_WIDTH, 0, kOPTION_WIDTH, self.frame.size.height);
            [optionBtn setTitle:names[index] forState:UIControlStateNormal];
            [optionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//           当设置optionBtn.selected = YES 时, 是被选中状态;
            [optionBtn setTitleColor:self.selectedColor forState:UIControlStateSelected];
            [self addSubview:optionBtn];
            
            SEL optionAction = @selector(optionClicked:);
            [optionBtn addTarget:self action:optionAction forControlEvents:UIControlEventTouchUpInside];
            
            optionBtn.tag = index + 100;
            
        }
        _currentIndex = 100;
        self.currentIndex = 100;
    }
    return  self;
}

- (void)optionClicked:(UIButton *)optionBtn
{
    self.currentIndex = optionBtn.tag;//100
    if (_optionBtnClicked) {
        self.optionBtnClicked(_currentIndex);
    }
}
- (void)setCurrentIndex:(NSInteger)currentIndex
{
    UIButton *lastBtn = [self viewWithTag:_currentIndex];
    lastBtn.selected = NO;
    
    UIButton *currentBtn = [self viewWithTag:currentIndex];
    currentBtn.selected = YES;
    
    CGFloat offSetX = currentBtn.frame.origin.x - kSCREEN_WIDTH/2;
    offSetX = offSetX > 0 ? (offSetX + kOPTION_WIDTH/2) : 0;
    
    offSetX = offSetX > self.contentSize.width - kSCREEN_WIDTH ? self.contentSize.width - kSCREEN_WIDTH : offSetX;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.contentOffset = CGPointMake(offSetX, 0);
    }];
    _currentIndex = currentIndex;
}
+ (instancetype)viewWithFrame:(CGRect)frame andNames:(NSArray *)names
{
    return [[self alloc] initWithFrame:frame andNames:names];
}
@end
