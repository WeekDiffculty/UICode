//
//  ViewController.m
//  Demo02_AppMgr
//
//  Created by qingyun on 16/6/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "QYAppView.h"


/** QLDEBUG Print | M:method, L:line, C:content*/
#ifndef QLLog
#ifdef DEBUG
#define QLLog(FORMAT, ...) fprintf(stderr,"M:%s|L:%d|C->%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])
#else
#define QLLog(FORMAT, ...)
#endif
#endif

/** QLScreenSize */
#define QLScreenSize [[UIScreen mainScreen] bounds].size
#define QLScreenWidth QLScreenSize.width
#define QLScreenHeight QLScreenSize.height

/** Color Related */
#define QLColorWithRGB(redValue, greenValue, blueValue) ([UIColor colorWithRed:((redValue)/255.0) green:((greenValue)/255.0) blue:((blueValue)/255.0) alpha:1])

#define QLColorRandom QLColorWithRGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#define QLColorFromHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#define QYRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

#define QYGapX (self.view.frame.size.width - QYAppLineCount * QYAppWidth) / (QYAppLineCount + 1)
#define QYGapY 15

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
        // 通过NSURL加载本地文件
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"apps" withExtension:@"plist"];
        _arrResources = [NSArray arrayWithContentsOfURL:url];
    }
    return _arrResources;
}

#pragma mark - ♻️ LifeCycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 一般情况下, viewDidLoad这个方法中只用调用方法
    
    // self.arrResources;
    // 布局九宫格视图
    [self layoutBlockView];
    
    // 1, view和私有变量的初始化
    //[];
    // 2, 网络加载数据
    //[];
    
    // 有关颜色的补充
    // 我们能遇到颜色一般分为两类:
    // 24色 : Red Green Blue
    // 👉🏿:32色 : Alpha Red Green Blue
    // 每一个颜色点都有一个取值范围: 0 ~ 255 | 0 ~ 1
    //[UIColor colorWithRed:23 / 255.0 green:<#(CGFloat)#> blue:<#(CGFloat)#> alpha:<#(CGFloat)#>];
    
    // 经常见到的颜色还有: 16进制的
    // FF B6 C1
    // #FF 66 33 == #F63
    //UIColor *color = QLColorWithRGB(23, 33, 234);
    QLColorWithRGB(213, 205, 123);
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
        NSDictionary *dicResouce = self.arrResources[index];
        [appView setDicResource: dicResouce];
        [self.view addSubview:appView];
        
        [appView setBlkDidTapDownloadButton:^(NSDictionary *dicResource){
            NSLog(@"我被%@摸了", dicResource[@"name"]);
//            // @"http://www.baidu.com"
          NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
            [[UIApplication sharedApplication] openURL:url];
        }];
        
//        NSDictionary *dicTemp = appView.dicResource;
    }
}

// 隐藏状态栏
- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
