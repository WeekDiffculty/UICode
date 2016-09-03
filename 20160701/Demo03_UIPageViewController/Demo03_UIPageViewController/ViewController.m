//
//  ViewController.m
//  Demo03_UIPageViewController
//
//  Created by qingyun on 16/7/1.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"

@interface ViewController () <UIPageViewControllerDataSource>

@property (nonatomic, copy) NSArray *arrControllers;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 把所有要显示的控制器创建出来并添加到数组中
    NSUInteger count = 4;
    NSMutableArray *arrMControllers = [NSMutableArray arrayWithCapacity:count];
    for (NSUInteger index = 0; index < count; index ++) {
        TestViewController *vc = [TestViewController new];
        [arrMControllers addObject:vc];
    }
    self.arrControllers = arrMControllers;
    
    /*!
     * 参数1: 要调到哪个控制器
     * 参数2: 调到这个控制器的方向
     * 参数3: 是否需要动画
     * 参数4: 当跳过去完成之后应该执行的Block
     */
    [self setViewControllers:@[self.arrControllers.firstObject] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    self.dataSource = self;
}

#pragma mark - UIPageViewControllerDataSource
/** 返回前一个控制器, 其view显示在前一个位置 */
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    for (NSInteger index = 0; index < self.arrControllers.count; index ++) {
        TestViewController *vcTemp = self.arrControllers[index];
        if (vcTemp == viewController) {
            NSInteger indexCurrent = index - 1;
            if (indexCurrent >= 0) {
                return self.arrControllers[indexCurrent];
            } else {
                return nil;
            }
        }
    }
    return nil;
}

/** 返回后一个控制器, 其view显示在后一个位置 */
- (nullable UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    for (NSInteger index = 0; index < self.arrControllers.count; index ++) {
        TestViewController *vcTemp = self.arrControllers[index];
        if (vcTemp == viewController) {
            NSInteger indexCurrent = index + 1;
            if (indexCurrent < self.arrControllers.count) {
                return self.arrControllers[indexCurrent];
            } else {
                return nil;
            }
        }
    }
    return nil;
}

@end
