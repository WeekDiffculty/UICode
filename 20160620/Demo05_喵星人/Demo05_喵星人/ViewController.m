//
//  ViewController.m
//  Demo05_喵星人
//
//  Created by qingyun on 16/6/20.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

// 方式一: 常量的形式
//static NSInteger const QYTurnLeftTag = 200;
// 方式二: 宏定义形式
//#define QYTurnLeftTag 200

typedef enum : NSInteger {
    /** 向左翻tag */
    QYTurnTypeLeft = 200,
    /** 向右翻tag */
    QYTurnTypeRight = 250,
} QYTurnType;

@interface ViewController ()

// plist中存放字典的数组
@property (nonatomic, copy) NSArray *arrSources;

// 当前在总数中的索引的标签
@property (weak, nonatomic) IBOutlet UILabel *lblCurrentIndexInTotal;
// 向左翻按钮
@property (weak, nonatomic) IBOutlet UIButton *btnTurnLeft;
// 向右翻按钮
@property (weak, nonatomic) IBOutlet UIButton *btnTurnRight;
// 描述标签
@property (weak, nonatomic) IBOutlet UILabel *lblDescription;
// 显示喵星人的图片控件
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

// 记录当前是第几张图片
@property (nonatomic, assign) NSUInteger currentIndex;

@end

@implementation ViewController

// 懒加载资源
- (NSArray *)arrSources {
    if (!_arrSources) {
        //1.获取文件路径
        NSString *strPath = [[NSBundle mainBundle] pathForResource:@"Images.plist" ofType:nil];
        //2.根据路径加载数组
        _arrSources = [NSArray arrayWithContentsOfFile:strPath];
    }
    return _arrSources;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // enabled
    // disable
    // 初始化数据
    [self updateData];
}

- (IBAction)turnAction:(UIButton *)button {
    NSInteger tag = button.tag;
    if (tag == QYTurnTypeLeft) { // 向左翻
        self.currentIndex --;
    } else if (tag == QYTurnTypeRight) { // 向右翻
        self.currentIndex ++;
    }
    
    // 更新数据
    [self updateData];
}

- (void)updateData {
    self.btnTurnLeft.enabled = self.currentIndex == 0 ? NO : YES;
    self.btnTurnRight.enabled = self.currentIndex == self.arrSources.count-1 ? NO : YES;
    
    // 根据索引取出资源
    NSDictionary *dicSource = self.arrSources[self.currentIndex];
    
    // 索引
    NSString *strIndexInTotal = [NSString stringWithFormat:@"%ld/%ld", self.currentIndex + 1, self.arrSources.count];
    self.lblCurrentIndexInTotal.text = strIndexInTotal;
    
    // 图片
    NSString *strImageName = dicSource[@"name"];
    [self.imageView setImage:[UIImage imageNamed:strImageName]];
    
    // 图片描述
    NSString *strDescription = dicSource[@"desc"];
    [self.lblDescription setText:strDescription];
}

@end
