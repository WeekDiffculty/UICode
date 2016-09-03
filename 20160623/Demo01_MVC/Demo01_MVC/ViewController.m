//
//  ViewController.m
//  Demo01_MVC
//
//  Created by Shreker on 16/6/19.
//  Copyright © 2016年 Shreker. All rights reserved.
//

#import "ViewController.h"
#import "QYCar.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIStepper *stepper;

@property (nonatomic, copy) NSArray *arrDatas;

@end

@implementation ViewController

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
    NSUInteger count = self.arrDatas.count;
    NSMutableArray *arrMData = [NSMutableArray arrayWithCapacity:count];
    for (NSUInteger index = 0; index < count; index ++) {
        NSDictionary *dicData = self.arrDatas[index];
        // 1, 土办法字典转模型
        //QYCar *car = [[QYCar alloc] init];
        //car.name = dicData[@"name"];
        //car.wheelsCount = [dicData[@"wheelsCount"] intValue];
        //car.identifier = dicData[@"identifier"];
        // 2, 稍微洋气一点的方法
        //QYCar *car = [[QYCar alloc] initWithDictionary:dicData];
        // 3, 比较洋气的一种方式
        QYCar *car = [QYCar carWithDictionary:dicData];
        
        [arrMData addObject:car];
    }
    NSLog(@"%@", arrMData);
}


@end
