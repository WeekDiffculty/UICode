//
//  ViewController.m
//  UILable
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
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 80, self.view.frame.size.width-100, 44)];
    // 继承自uiview
    //label.backgroundColor = [UIColor lightGrayColor];
    
    label.textColor = [UIColor yellowColor];
    label.textAlignment = NSTextAlignmentCenter;
    
    label.highlighted = YES;
    label.highlightedTextColor = [UIColor magentaColor];
    
//    label.shadowColor = [UIColor greenColor];
//    label.shadowOffset = CGSizeMake(5, 5);
    
    NSLog(@"fonts >>>>>>> %@", [UIFont familyNames]);
    
    // UIFont
//    label.font = [UIFont boldSystemFontOfSize:30];
    
    label.text = @"中华人民共和国河南省郑州市高新区青云学院 中华人民共和国河南省郑州市高新区青云学院 中华人民共和国河南省郑州市高新区青云学院 中华人民共和国河南省郑州市高新区青云学院";
    // 文本的省略方式
//    label.lineBreakMode = NSLineBreakByTruncatingMiddle;
    
    
    label.adjustsFontSizeToFitWidth = YES; // 调整字体大小来适应label的大小
    label.numberOfLines = 0; // 显示的行数，0的时候表示自动调整行数
    
    
    
    
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
