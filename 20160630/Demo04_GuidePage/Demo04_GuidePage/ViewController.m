//
//  ViewController.m
//  Demo04_GuidePage
//
//  Created by qingyun on 16/6/30.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
{
    __weak IBOutlet UIScrollView *_scrollView;
    __weak IBOutlet UIPageControl *_pageCtrl;
}

@property (nonatomic, copy) NSArray *arrImageNames;

@end

@implementation ViewController

// 懒加载图片名
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

/** 加载默认的一些设置, UI元素 */
- (void)loadDefaultSetting {
    //1, 设置ScrollView
    CGFloat imageViewWidth = _scrollView.frame.size.width;
    CGFloat imageViewHeight = _scrollView.frame.size.height;
    
    NSUInteger count = self.arrImageNames.count;
    for (NSUInteger index = 0; index < count; index ++) {
        UIImageView *imageView = [UIImageView new];
        [imageView setImage:[UIImage imageNamed:self.arrImageNames[index]]];
        [_scrollView addSubview:imageView];
        [imageView setFrame:CGRectMake(index * imageViewWidth, 0, imageViewWidth, imageViewHeight)];
    }
    
    _scrollView.contentSize = CGSizeMake(count * imageViewWidth, 0);
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    // 2, 设置pageCtrl
    [_pageCtrl addTarget:self action:@selector(valueChangedAction:) forControlEvents:UIControlEventValueChanged];
}

- (void)valueChangedAction:(UIPageControl *)pageCtrl {
    NSLog(@"%ld", pageCtrl.currentPage);
    // 在这个方法中设置scrollView滑动到指定的page
    //[_scrollView setContentOffset:<#(CGPoint)#> animated:<#(BOOL)#>];
}

#pragma mark - 🔌 Delegate Methods
#pragma mark UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    _pageCtrl.currentPage = scrollView.contentOffset.x / scrollView.bounds.size.width;
}

@end
