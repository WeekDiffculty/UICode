//
//  ViewController.m
//  Demo02_TestMVC
//
//  Created by qingyun on 16/6/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "TestController.h"
#import "QYTestView.h"
#import "QYTestModel.h"

static CGFloat const QYTestViewGap = 20;
static CGFloat const QYTestViewHeight = 100;

@interface TestController ()

// 存放原数据的数组, 可以理解为服务器返回的数据
@property (nonatomic, copy) NSArray *arrDatas;

// 存放本地转化好的数据模型
@property (nonatomic, copy) NSArray *arrDataModels;

@end

@implementation TestController

- (NSArray *)arrDatas {
    if (!_arrDatas) {
        _arrDatas = @[@{@"name": @"飞毛腿三轮车",
                        @"wheelsCount": @"3",
                        @"identifier": @"TG8888"},
                      @{@"name": @"劳斯莱斯",
                        @"wheelsCount": @"4",
                        @"identifier": @"TG9999"},
                      @{@"name": @"比亚迪",
                        @"wheelsCount": @"4",
                        @"identifier": @"TG6666"},
                      @{@"name": @"凤凰牌自行车",
                        @"wheelsCount": @"2",
                        @"identifier": @"暂无办理"},
                      @{@"name": @"推土机-XX重工",
                        @"wheelsCount": @"8",
                        @"identifier": @"TG11112345"}
                      ];
    }
    return _arrDatas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDefaultSetting];
}

// 做一些初始化的工作, 数据转模型, 添加自定义的View
- (void)loadDefaultSetting {
    // 1, 数据转模型
    NSUInteger count = self.arrDatas.count;
    // 创建了一个临时变量
    NSMutableArray *arrMDatas = [NSMutableArray arrayWithCapacity:count];
    for (NSUInteger index = 0; index < count; index ++) {
        NSDictionary *dicData = self.arrDatas[index];
        QYTestModel *testModel = [QYTestModel testModelWithDictionary:dicData];
        [arrMDatas addObject:testModel];
    }
    self.arrDataModels = arrMDatas;
    
    // 2, 布局QYTestView类对象
    for (NSUInteger index = 0; index < count; index ++) {
        // 2.1 创建子视图
        QYTestView *testView = [QYTestView testView];
        CGFloat testViewY = QYTestViewGap + (QYTestViewHeight + QYTestViewGap) * index;
        CGFloat testViewWidth = self.view.frame.size.width - 2 * QYTestViewGap;
        testView.frame = CGRectMake(QYTestViewGap, testViewY, testViewWidth, QYTestViewHeight);
        // 2.2 添加子视图到self.view上
        [self.view addSubview:testView];
        // 2.3 传入数据模型
        QYTestModel *model = self.arrDataModels[index];
        [testView setTestModel:model];
    }
}





















@end
