//
//  ViewController.m
//  Demo03.UILabel
//
//  Created by qingyun on 16/6/17.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 200, 500)];
    label.backgroundColor = [UIColor orangeColor];
    // 设置文本（显示的内容）
    label.text = @"我很流弊我很流弊我很流弊我很流弊我很流弊我很流弊我很流弊我很流弊我很流弊我很流弊我很流弊";
    // 设置字体大小
    [label setHighlightedTextColor:[UIColor redColor]];
    label.userInteractionEnabled = YES;
    label.font = [UIFont systemFontOfSize:25];
    //NSLog(@"%@", [UIFont familyNames]);
    label.textColor = [UIColor whiteColor];
    // 设置文本的对齐方式
    [label setTextAlignment:NSTextAlignmentCenter];
    
    [label setNumberOfLines:0];
    
    [self.view addSubview:label];
    
}

@end
