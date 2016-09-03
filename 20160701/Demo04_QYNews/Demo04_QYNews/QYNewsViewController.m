//
//  ViewController.m
//  Demo04_QYNews
//
//  Created by qingyun on 16/7/1.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYNewsViewController.h"
#import "QYDetailViewController.h"
#import "QYItemView.h"

@interface QYNewsViewController () <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

/** 控制器的索引 */
@property (nonatomic, assign) NSInteger indexController;

@property (nonatomic, copy) NSArray *arrTitles;
@property (nonatomic, copy) NSArray *arrControllers;
@property (nonatomic, weak) QYItemView *itemView;

@end

@implementation QYNewsViewController

- (NSArray *)arrTitles {
    if (!_arrTitles) {
        _arrTitles = @[@"头条", @"新闻", @"体育", @"汽车", @"八卦", @"科技", @"军事", @"段子"];
    }
    return _arrTitles;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDefaultSetting];
}

- (void)loadDefaultSetting {
    // 创建控制器数组
    NSUInteger count = self.arrTitles.count;
    NSMutableArray *arrMTemp = [NSMutableArray arrayWithCapacity:count];
    for (NSUInteger index = 0; index < count; index ++) {
        QYDetailViewController *vcDetail = [QYDetailViewController new];
        vcDetail.title = self.arrTitles[index];
        [arrMTemp addObject:vcDetail];
    }
    _arrControllers = [arrMTemp copy];
    
    self.dataSource = self;
    self.delegate = self;
    
//    // 设置第一个要显示的控制器
//    [self setViewControllers:@[_arrControllers.firstObject] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    // 加载滚动视图
    QYItemView *itemView = [QYItemView new];
    itemView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 40);
    itemView.arrTitles = self.arrTitles;
    [self.view addSubview:itemView];
    self.itemView = itemView;
    __weak typeof(self) selfWeak = self;
    [itemView setBlkDidChooseButtonAtIndex:^(NSUInteger index){
        NSLog(@"'%@'被摸了...", selfWeak.arrTitles[index]);
        // 把index对应的控制器从_arrControllers取出来
        [selfWeak chooseViewControllerAtIndex:index];
    }];
}

- (void)chooseViewControllerAtIndex:(NSInteger)index {
    UIPageViewControllerNavigationDirection direction;
    if (index > self.indexController) {
        direction = UIPageViewControllerNavigationDirectionForward;
    } else {
        direction = UIPageViewControllerNavigationDirectionReverse;
    }
    QYDetailViewController *vcDetail = self.arrControllers[index];
    [self setViewControllers:@[vcDetail] direction:direction animated:YES completion:nil];
    self.indexController = index;
}

#pragma mark - UIPageViewControllerDataSource
// 下一个控制器
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    for (NSInteger index = 0; index < _arrControllers.count; index ++) {
        QYDetailViewController *vcDetail = _arrControllers[index];
        if (vcDetail == viewController) {
            if (index + 1 < _arrControllers.count) {
                return _arrControllers[index + 1];
            }
        }
    }
    return nil;
}
// 上一个控制器
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    for (NSInteger index = 0; index < _arrControllers.count; index ++) {
        QYDetailViewController *vcDetail = _arrControllers[index];
        if (vcDetail == viewController) {
            if (index - 1 >= 0) {
                return _arrControllers[index - 1];
            }
        }
    }
    return nil;
}

#pragma mark - UIPageViewControllerDelegate
/** 即将过度到下一个控制器的时候就会被调用, 但是最终会不会到pendingViewControllers, 不一定 */
//- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers {
//    NSLog(@"%@", pendingViewControllers.firstObject.title);
//}

/** 完成动画的时候调用 */
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    // 获取当前的控制器
    QYDetailViewController *vcDetailCurrent = self.viewControllers.firstObject;
    NSUInteger count = self.arrControllers.count;
    for (NSUInteger index = 0; index < count; index ++) {
        QYDetailViewController *vcTemp = self.arrControllers[index];
        if (vcTemp == vcDetailCurrent) {
            [self.itemView chooseIndex:index];
            break;
        }
    }
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
