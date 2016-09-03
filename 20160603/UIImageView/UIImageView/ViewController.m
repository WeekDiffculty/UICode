//
//  ViewController.m
//  UIImageView
//
//  Created by qingyun on 16/6/3.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"redhat"] highlightedImage:[UIImage imageNamed:@"girl"]];
    imageView.frame = CGRectMake(50, 100, CGRectGetWidth(self.view.frame)-100, CGRectGetWidth(self.view.frame)-100);
    imageView.highlighted = YES;
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame)-200)/2, CGRectGetMaxY(imageView.frame)+50, 200, 200)];
    imageView2.image = [UIImage imageNamed:@"grass"];
    // 图片内容的显示模式
    imageView2.contentMode = UIViewContentModeCenter;
    
    
    // 超出view边界的时候是否剪裁
    imageView2.clipsToBounds = YES;
    imageView2.backgroundColor = [UIColor grayColor];
    
    
    
    [self.view addSubview:imageView];
    [self.view addSubview:imageView2];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
