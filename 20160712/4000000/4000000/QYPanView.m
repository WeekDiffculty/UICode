//
//  QYPanView.m
//  4000000
//
//  Created by qingyun on 16/7/12.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYPanView.h"

@implementation QYPanView

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
    self.backgroundColor = QLColorRandom;
    
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.bottom.trailing.top.equalTo(self);
    }];
    
    NSUInteger count = 7;
    CGFloat width = QLScreenWidth;
    
    for (NSUInteger index = 0; index < count; index ++) {
        UIImageView *imageView = [UIImageView new];
        imageView.userInteractionEnabled = YES;
        imageView.frame = CGRectMake(index * width, 0, width, QYPanViewHeight);
        [scrollView addSubview:imageView];
        imageView.tag = index;
        imageView.backgroundColor = QLColorRandom;
        UITapGestureRecognizer *grTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [imageView addGestureRecognizer:grTap];
    }
    
    scrollView.contentSize = CGSizeMake(count * width, 0);
}

- (void)tapAction:(UITapGestureRecognizer *)grTap {
    if (self.blkDidTapImageViewAtIndex) {
        self.blkDidTapImageViewAtIndex(grTap.view.tag);
    }
}

@end
