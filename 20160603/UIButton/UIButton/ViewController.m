//
//  ViewController.m
//  UIButton
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

    // 创建Button
    // 系统按钮的样式
    // UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 200, 40);
    btn.backgroundColor = [UIColor purpleColor];
    
    // 设置按钮上的文字
    [btn setTitle:@"点我呀" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    
    [btn setTitle:@"点你咋地" forState:UIControlStateHighlighted];
    [btn setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    
    //[btn setImage:[UIImage imageNamed:@"榴莲.jpg"] forState:UIControlStateNormal];
//    [btn setBackgroundImage:[UIImage imageNamed:@"草莓.jpg"] forState:UIControlStateNormal];
    
    [btn setTitle:@"这回点不了了" forState:UIControlStateDisabled];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateDisabled];
    btn.tag = 10;
    
    // 给btn绑定事件，通过 addTarget:action:forControlEvents:，第一个参数是让谁做，第二个参数是做什么（就是对应的方法），第三个参数是 对应的事件类型
    [btn addTarget:self action:@selector(disableBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

- (void)disableBtn:(UIButton *)sender
{
#if 0
    UIButton *btn = (UIButton *)[self.view viewWithTag:10];
    btn.enabled = NO;
#endif
    
    sender.enabled = NO;
    
}

- (IBAction)click:(UIButton *)sender {
    NSLog(@"这是一个草莓");
    [sender setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
