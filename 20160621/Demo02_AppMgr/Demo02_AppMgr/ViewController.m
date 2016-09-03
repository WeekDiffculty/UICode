//
//  ViewController.m
//  Demo02_AppMgr
//
//  Created by qingyun on 16/6/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

#define QYRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

#define QYGapX (self.view.frame.size.width - QYAppLineCount * QYAppWidth) / (QYAppLineCount + 1)
#define QYGapY 15

static NSUInteger const QYAppLineCount = 4;
static CGFloat const QYAppWidth = 70;
static CGFloat const QYAppHeight = 130;

@interface ViewController ()

// 存放App信息的数组
@property (nonatomic, copy) NSArray *arrResources;

@end

@implementation ViewController

- (NSArray *)arrResources {
    if (!_arrResources) {
        
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"apps" withExtension:@"plist"];
        _arrResources = [NSArray arrayWithContentsOfURL:url];
    }
    return _arrResources;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // self.arrResources;
    // 布局九宫格视图
    [self layoutBlockView];
}

/** 布局九宫格视图 */
- (void)layoutBlockView {
    NSUInteger count = self.arrResources.count;
    for (NSInteger index = 0; index < count; index ++) {
        // 1, 创建容器view
        UIView *viewContainer = [UIView new];
        //viewContainer.backgroundColor = QYRandomColor;
        
        /* 对待常量
        // ①, const :只能是一个已经固定的值, 不能有表达式
        // ②, mocro : 基本上都可以使用
        // ③, enum : 特定的一组数字常量 */
        // 当前容器的x值
        CGFloat appX = QYGapX + (index % QYAppLineCount) * (QYAppWidth + QYGapX);
        // 当前容器的y值
        CGFloat appY = QYGapY + (index / QYAppLineCount) * (QYAppHeight + QYGapY);
        // 设置当前容器的frame
        viewContainer.frame = CGRectMake(appX, appY, QYAppWidth, QYAppHeight);
        [self.view addSubview:viewContainer];
        
        // 添加子控件
        [self addsubViewWithContainerView:viewContainer atIndex:index];
    }
}

/** 添加子控件 */
- (void)addsubViewWithContainerView:(UIView *)viewContainer atIndex:(NSInteger)index {
    NSDictionary *dicResource = self.arrResources[index];
    // 2, 给容器添加子视图
    // 2.1 添加图片
    UIImageView *imageView = [UIImageView new];
    imageView.frame = CGRectMake(0, 0, QYAppWidth, QYAppWidth);
    [viewContainer addSubview:imageView];
    [imageView setImage:[UIImage imageNamed: dicResource[@"icon"]]];
    
    // 2.2 添加app名称标签
    UILabel *lblName = [UILabel new];
    // 把结构体转化为一个字符串:NSStringFromxxx
    //NSLog(@"=======\n%@", NSStringFromCGRect(imageView.frame));
    CGFloat height = CGRectGetHeight(imageView.frame);
    //NSLog(@"%f\n======", height);
    lblName.frame = CGRectMake(0, height, QYAppWidth, 25);
    lblName.text = @"AppName";
    // weight: 控制字体的线宽
    lblName.font = [UIFont systemFontOfSize:15];
    [lblName setTextAlignment:NSTextAlignmentCenter];
    [lblName setText:dicResource[@"name"]];
    [viewContainer addSubview:lblName];
    
    // 下载按钮
    // 👉🏿:所有和状态有关的设置必须和状态一同设置才有效果
    UIButton *btnDownload = [UIButton buttonWithType:UIButtonTypeSystem];
    btnDownload.frame = CGRectMake(0, CGRectGetMaxY(lblName.frame), QYAppWidth, 25);
    // 下面这两种方式是没有效果: 因为这两种设置方式没有绑定相应的状态
    //btnDownload.titleLabel.text = @"下载";
    //btnDownload.imageView.image = [UIImage imageNamed:@"buttongreen_highlighted"];
    [btnDownload setTitle:@"下载" forState:UIControlStateNormal];
    [btnDownload setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
    [btnDownload setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];
    [viewContainer addSubview:btnDownload];
}

// 隐藏状态栏
- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
