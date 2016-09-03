//
//  SecondViewController.m
//  Demo02_UINavigationController_Code
//
//  Created by qingyun on 16/6/27.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)nextAction {
    ThirdViewController *vcThird = [ThirdViewController new];
    [self.navigationController pushViewController:vcThird animated:YES];
    
}

- (IBAction)backAction {
    // 把当前控制器出栈
    //1, 弹出栈顶控制器
    [self.navigationController popViewControllerAnimated:YES];
    
    // 2, 弹出指定控制器之后的控制器(弹, 直到某个控制器出现)
//    [self.navigationController popToViewController:<#(nonnull UIViewController *)#> animated:<#(BOOL)#>];
}


- (void)dealloc
{
    NSLog(@"%s", __func__);
}

@end
