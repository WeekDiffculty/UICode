//
//  ViewController.m
//  Demo05_Zooming
//
//  Created by qingyun on 16/6/30.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
{
    __weak IBOutlet UIScrollView *_scrollView;
    __weak UIImageView *_imageView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"new_feature_4"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [_scrollView addSubview:imageView];
    _imageView = imageView;
    _scrollView.delegate = self;
    _scrollView.contentSize = image.size;
    
    // 在让ScrollView里面的视图缩放的时候,必须设置它的最大和最小缩放比例
    _scrollView.minimumZoomScale = 0.5;
    _scrollView.maximumZoomScale = 2.0;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _imageView;
}

@end
