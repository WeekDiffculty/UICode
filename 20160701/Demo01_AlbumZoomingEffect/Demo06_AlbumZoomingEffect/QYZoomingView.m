//
//  QYZoomingView.m
//  Demo06_AlbumZoomingEffect
//
//  Created by qingyun on 16/7/1.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYZoomingView.h"

@interface QYZoomingView () <UIScrollViewDelegate>
{
    __weak UIImageView *_imageView;
}

@end

@implementation QYZoomingView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self loadDefaultSetting];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self loadDefaultSetting];
    }
    return self;
}

/** 加载默认的设置和UI元素 */
- (void)loadDefaultSetting {
    // 添加UIImageView
    UIImageView *imageView = [UIImageView new];
    imageView.frame = [[UIScreen mainScreen] bounds];
    [self addSubview:imageView];
    _imageView = imageView;
    imageView.userInteractionEnabled = YES;
    
    // 设置缩放比例
    self.minimumZoomScale = 0.5;
    self.maximumZoomScale = 1.5;
    
    // 设置代理
    self.delegate = self;
    
    // 手势
    // UIPanGesture...
    // UIPinch..
    // UITap...
    
    // UIImageview对象默认情况下不响应用户的操作
    UITapGestureRecognizer *grTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [imageView addGestureRecognizer:grTap];
}

- (void)tapAction:(UITapGestureRecognizer *)grTap {
    NSLog(@"%s", __func__);
    /** Block */
    if (self.blkDidTapedImageView) {
        self.blkDidTapedImageView();
    }
    /** 代理 */
    if ([self.delegateZooming respondsToSelector:@selector(zoomingViewDidTaped:)]) {
        [self.delegateZooming zoomingViewDidTaped:self];
    }
    /** 通知 */
    [[NSNotificationCenter defaultCenter] postNotificationName:@"QYTapedZoomingView" object:grTap.view];
}


#pragma mark - UIScrollViewDelegate
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _imageView;
}

- (void)setStrImageName:(NSString *)strImageName {
    _strImageName = strImageName;
    _imageView.image = [UIImage imageNamed:strImageName];
}

@end
