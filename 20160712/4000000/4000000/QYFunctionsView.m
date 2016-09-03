//
//  QYFunctionsView.m
//  4000000
//
//  Created by qingyun on 16/7/12.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYFunctionsView.h"
#import "QYVerticalButton.h"

@interface QYFunctionsView () <NSObject>

@property (nonatomic, strong) NSArray *arrDatas;

@end

@implementation QYFunctionsView

- (NSArray *)arrDatas {
    if (!_arrDatas) {
        NSString *strFilePath = [[NSBundle mainBundle] pathForResource:@"ListData" ofType:@"plist"];
        _arrDatas = [NSArray arrayWithContentsOfFile:strFilePath];
    }
    return _arrDatas;
}

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

- (void)awakeFromNib {
    
}

/** Load the default UI elements And prepare some datas needed. */
- (void)loadDefaultSetting {
    self.backgroundColor = [UIColor whiteColor];
    
    CGFloat marginLeft = 30;
    CGFloat marginTop = 13;
    CGFloat width = 60;
    CGFloat height = 80;
    CGFloat spacing = (QLScreenWidth - marginLeft * 2 - 4 * width) / 3;
    
    NSUInteger count = 8;
    for (NSUInteger index = 0; index < count; index ++) {
        QYVerticalButton *btnVertical = [QYVerticalButton new];
        CGFloat X = marginLeft + (index % 4) * (width + spacing);
        CGFloat Y = marginTop + (index / 4) * (height + marginTop);
        CGRect rectBtnVertical = CGRectMake(X, Y, width, height);
        btnVertical.frame = rectBtnVertical;
        btnVertical.dicData = self.arrDatas[index];
        [btnVertical addTarget:self action:@selector(tapAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnVertical];
    }
}

- (void)tapAction:(QYVerticalButton *)button {
    if (self.blkDidTapModal) {
        self.blkDidTapModal(button.dicData);
    }
}

@end
