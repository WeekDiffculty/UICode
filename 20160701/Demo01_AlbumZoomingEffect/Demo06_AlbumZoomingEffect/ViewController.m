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
#import "QYZoomingView.h"

@interface ViewController () <UIScrollViewDelegate, QYZoomingViewDelegate>
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
        QYZoomingView *scvZomming = [[QYZoomingView alloc] initWithFrame:CGRectMake(index * QLScreenWidth, 0, QLScreenWidth, QLScreenHeight)];
        scvZomming.strImageName = _arrImageNames[index];
        [_scrollView addSubview:scvZomming];
        scvZomming.delegateZooming = self;
        /** 设置点击之后执行的方法 */
        [scvZomming setBlkDidTapedImageView:^{
            NSLog(@"%s", __func__);
        }];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recievedNotification:) name:@"QYTapedZoomingView" object:nil];
}

- (void)recievedNotification:(NSNotification *)notification {
    NSLog(@"%@", notification.object);
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    _indexCurrent = scrollView.contentOffset.x / scrollView.bounds.size.width;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSUInteger indexNow = scrollView.contentOffset.x / scrollView.bounds.size.width;
    if (indexNow == _indexCurrent) return;
    
    NSArray *arrSubViews = scrollView.subviews;
    for (UIScrollView *scvZooming in arrSubViews) {
        if ([scvZooming isKindOfClass:[UIScrollView class]]) {
            scvZooming.zoomScale = 1.0;
        }
    }
    
}

#pragma mark - QYZoomingViewDelegate
- (void)zoomingViewDidTaped:(QYZoomingView *)zoomingView {
    NSLog(@"%s", __func__);
}

- (void)dealloc {
    // 移除当前的所有监听器
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
