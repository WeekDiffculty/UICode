//
//  ViewController.m
//  Demo03_UIScrollView_Delegate
//
//  Created by qingyun on 16/6/30.
//  Copyright © 2016年 qingyun. All rights reserved.
//

/** QLDEBUG Print | M:method, L:line, C:content*/
#ifndef QLLog
#ifdef DEBUG
#define QLLog(FORMAT, ...) fprintf(stderr,"M:%s|L:%d|C->%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])
#else
#define QLLog(FORMAT, ...)
#endif
#endif

#define QLBriefLog QLLog(@"")

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
{
    __weak IBOutlet UIScrollView *_scollView;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //_scollView.delegate = self;
    
    UIImage *image = [UIImage imageNamed:@"map"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [imageView setFrame:(CGRect){CGPointZero, image.size}];
    [_scollView addSubview:imageView];
    
    _scollView.contentSize = image.size;
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //[_scollView setScrollsToTop:YES];
}

#pragma mark - UIScrollViewDelegate

///** 只要scrollView在滑动就会一直调用, 调用非常频繁 */
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    QLBriefLog;
//}

///** 将要开始滑动 */
//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
//    QLBriefLog;
//}
///*!
// * 将要停止拖动的时候, 手指即将松开的时候调用
// *  velocity: 这个时候的速度
// *  targetContentOffset: 停止滚动的时候最终偏移量
// */
//- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
//    QLLog(@"%@", NSStringFromCGPoint(*targetContentOffset));
//    QLLog(@"%@", NSStringFromCGPoint(velocity));
//}

/** 已经结束拖动 */
// decelerate: 告诉你是否要减速
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
//    QLBriefLog;
//}

/** scrollView已经滚动到最顶部 */
//- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
//    QLBriefLog;
//}

/** 即将开始减速 */
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    QLBriefLog;
}
/** 已经完成减速 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    QLBriefLog;
}

@end
