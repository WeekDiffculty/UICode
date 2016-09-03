//
//  QYHeaderView.m
//  4000000
//
//  Created by qingyun on 16/7/12.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYHeaderView.h"
#import "QYPanView.h"
#import "QYFunctionsView.h"

@implementation QYHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self loadDefaultSetting];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)decoder {
    if (self = [super initWithCoder:decoder]) {
        [self loadDefaultSetting];
    }
    return self;
}

/** Load the default UI elements And prepare some datas needed. */
- (void)loadDefaultSetting {
    // 当前这个方法用来添加子视图, 如果是在使用frame布局的环境下, 不允许在这个方法中设置frame, 设置frame移步到layoutSubViews方法中, AutoLayout中可以在这里直接布局
    
    self.backgroundColor = QLColorWithRGB(239, 239, 244);
    
    __weak typeof(self) selfWeak = self;
    // 添加轮播图
    QYPanView *panView = [QYPanView new];
    [self addSubview:panView];
    
    [panView setBlkDidTapImageViewAtIndex:^(NSUInteger index) {
        if ([selfWeak.delegate respondsToSelector:@selector(headerView:didTapImageViewAtIndex:)]) {
            [selfWeak.delegate headerView:selfWeak didTapImageViewAtIndex:index];
        }
    }];
    
    [panView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.and.top.and.trailing.equalTo(self);
        make.height.mas_equalTo(QYPanViewHeight);
    }];
    
    // 添加功能入口视图
    QYFunctionsView *functionsView = [QYFunctionsView new];
    [self addSubview:functionsView];
    
    [functionsView setBlkDidTapModal:^(NSDictionary *dicData) {
        if ([selfWeak.delegate respondsToSelector:@selector(headerView:didSelectButtonWithData:)]) {
            [selfWeak.delegate headerView:selfWeak didSelectButtonWithData:dicData];
        }
    }];
    
    [functionsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.and.trailing.equalTo(self);
        make.top.equalTo(panView.mas_bottom);
        make.bottom.equalTo(self).offset(-10);
        make.height.mas_equalTo(200);
    }];
    
}

@end
