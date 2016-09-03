//
//  ViewController.m
//  Demo06_AlbumZoomingEffect
//
//  Created by qingyun on 16/6/30.
//  Copyright © 2016年 qingyun. All rights reserved.
//

/** QLScreenSize */
#define QLScreenSize [[UIScreen mainScreen] bounds].size
#define QLScreenWidth QLScreenSize.width
#define QLScreenHeight QLScreenSize.height

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
{
    __weak IBOutlet UIScrollView *_scrollView;
    NSUInteger _indexCurrent;
}

/** 所有的图片名称 */
@property (nonatomic, copy) NSArray *arrImageNames;

@end

@implementation ViewController

- (NSArray *)arrImageNames {
    if (!_arrImageNames) {
        NSUInteger count = 6;
        NSMutableArray *arrMImageNames = [NSMutableArray arrayWithCapacity:count];
        for (NSUInteger index = 0; index < count; index ++) {
            NSString *strImageName = [NSString stringWithFormat:@"new_feature_%ld", index + 1];
            [arrMImageNames addObject:strImageName];
        }
        _arrImageNames = [arrMImageNames copy];
    }
    return _arrImageNames;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadDefaultSetting];
}

- (void)loadDefaultSetting {
    // _scrollView: 作用是: 滑动
    // scvZooming: 缩放
    
    _scrollView.delegate = self;
    
    // 取出图片总个数
    NSUInteger count = self.arrImageNames.count;
    // 设置内容尺寸
    _scrollView.contentSize = CGSizeMake(count * QLScreenWidth, 0);
    // 设置分页
    _scrollView.pagingEnabled = YES;
    // 隐藏水平滚动指示器
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    // 添加count个ScrollView, 然后在每个scrollView上面添加一个IMageView
    for (NSUInteger index = 0; index < count; index ++) {
        UIScrollView *scvZomming = [UIScrollView new];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.arrImageNames[index]]];
        imageView.frame = CGRectMake(0, 0, QLScreenWidth, QLScreenHeight);
        scvZomming.frame = CGRectMake(index * QLScreenWidth, 0, QLScreenWidth, QLScreenHeight);
        
        
        scvZomming.delegate = self;
        scvZomming.minimumZoomScale = 0.5;
        scvZomming.maximumZoomScale = 1.5;
        [scvZomming addSubview:imageView];
        [_scrollView addSubview:scvZomming];
    }
}

#pragma mark - UIScrollViewDelegate
// 返回缩放的view
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    if (_scrollView == scrollView) return nil;
    
    NSArray *arrSubViews = scrollView.subviews;
    for (UIImageView *imageView in arrSubViews) {
        if ([imageView isKindOfClass:[UIImageView class]]) {
            return imageView;
        }
    }
    
    return nil;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (_scrollView == scrollView) {
        _indexCurrent = scrollView.contentOffset.x / scrollView.bounds.size.width;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (_scrollView == scrollView) {
        NSUInteger indexNow = scrollView.contentOffset.x / scrollView.bounds.size.width;
        if (indexNow == _indexCurrent) return;
        
        NSArray *arrSubViews = scrollView.subviews;
        for (UIScrollView *scvZooming in arrSubViews) {
            if ([scvZooming isKindOfClass:[UIScrollView class]]) {
                scvZooming.zoomScale = 1.0;
            }
        }
    }
}

@end
