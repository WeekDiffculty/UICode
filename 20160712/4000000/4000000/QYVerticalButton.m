//
//  QYVerticalButton.m
//  4000000
//
//  Created by qingyun on 16/7/12.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYVerticalButton.h"

@implementation QYVerticalButton

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
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.imageView.contentMode = UIViewContentModeCenter;
}

- (void)setDicData:(NSDictionary *)dicData {
    _dicData = dicData;
    [self setImage:[UIImage imageNamed:dicData[@"iconStr"]] forState:UIControlStateNormal];
    [self setTitle:dicData[@"title"] forState:UIControlStateNormal];
}

// 图片占据整个Button的70%

/** 设置图片的frame */
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGRect rectImageView = CGRectMake(0, 0, CGRectGetWidth(contentRect), CGRectGetHeight(contentRect) * 0.7);
    return rectImageView;
}

/** 设置Button标题的frame */
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGRect rectTitle = CGRectMake(0, CGRectGetHeight(contentRect) * 0.7, CGRectGetWidth(contentRect), CGRectGetHeight(contentRect) * 0.3);
    return rectTitle;
}

@end
