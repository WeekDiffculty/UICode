//
//  ViewController.m
//  Demo02_AppMgr
//
//  Created by qingyun on 16/6/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "QYAppView.h"
#import "QYAppModel.h"

#define QYRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

#define QYGapX (self.view.frame.size.width - QYAppLineCount * QYAppWidth) / (QYAppLineCount + 1)
#define QYGapY 20

static NSUInteger const QYAppLineCount = 4;
static CGFloat const QYAppWidth = 70;
static CGFloat const QYAppHeight = 125;

@interface ViewController ()

// 存放App信息的数组
@property (nonatomic, copy) NSArray *arrResources;

@end

@implementation ViewController

#pragma mark - 💤 LazyLoad Methods
- (NSArray *)arrResources {
    if (!_arrResources) {
        // 通过NSURL加载本地文件路径
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"apps" withExtension:@"plist"];
        // 通过路径加载数组
        NSArray *arrResources = [NSArray arrayWithContentsOfURL:url];
        // 获取加载得到的数组的内容个数
        NSUInteger count = arrResources.count;
        // 新建一个有特定容量的可变数组
        NSMutableArray *arrMResources = [NSMutableArray arrayWithCapacity:count];
        // 字典转模型, 最后添加到可变数组中
        for (NSUInteger index = 0; index < count; index ++) {
            // 从资源中加载特定下标的字典
            NSDictionary *dicData = arrResources[index];
            // 根据获取到的字典创建一个QYAppModel对象
            QYAppModel *app = [QYAppModel appModelWithDictionary:dicData];
            // 把创建的对象添加到可变数组中
            [arrMResources addObject:app];
        }
        _arrResources = arrMResources;
    }
    return _arrResources;
}

#pragma mark - ♻️ LifeCycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    // 布局九宫格视图
    [self layoutBlockView];
}

/** 布局九宫格视图 */
- (void)layoutBlockView {
    NSUInteger count = self.arrResources.count;
    for (NSInteger index = 0; index < count; index ++) {
        QYAppView *appView = [QYAppView appView];
        
        // 当前容器的x值
        CGFloat appX = QYGapX + (index % QYAppLineCount) * (QYAppWidth + QYGapX);
        // 当前容器的y值
        CGFloat appY = QYGapY + (index / QYAppLineCount) * (QYAppHeight + QYGapY);
        // 设置当前容器的frame
        appView.frame = CGRectMake(appX, appY, QYAppWidth, QYAppHeight);
        
        QYAppModel *appModel = self.arrResources[index];
        [appView setAppModel: appModel];
        [self.view addSubview:appView];
        
        [appView setBlkDidTapDownloadButton:^(QYAppModel *appModel){
            NSLog(@"我被%@摸了", appModel.name);
            // @"http://www.baidu.com"
            NSURL *url = [NSURL URLWithString:@"telprompt://10086"];
            [[UIApplication sharedApplication] openURL:url];
        }];
    }
}

// 隐藏状态栏
- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
