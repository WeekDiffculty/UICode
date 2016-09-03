//
//  ThirdViewController.m
//  Demo02_UINavigationController_Code
//
//  Created by qingyun on 16/6/27.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ThirdViewController.h"
#import "SecondViewController.h"
#import "FirstViewController.h"

@interface ThirdViewController ()

@end 

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)backAction {
    // 把当前控制器出栈
    //1, 弹出栈顶控制器
    [self.navigationController popViewControllerAnimated:YES];
    
    // 2, 弹出指定控制器之后的控制器(弹, 直到某个控制器出现)
    // 遍历导航控制器中的管理的所有的控制器, 找出想要返回的控制器, 调用popToViewController
//    NSArray *arrViewControllers = self.navigationController.viewControllers;
//    for (UIViewController *vc in arrViewControllers) {
//        if ([vc isKindOfClass:[FirstViewController class]]) {
//            [self.navigationController popToViewController:vc animated:YES];
//            break;
//        }
//    }
    // 一定, 千万不要弹出一个新创建的控制器, 否则会崩溃
    //UIViewController *vcTemp = [UIViewController new];
    //[self.navigationController popToViewController:vcTemp animated:YES];
    
    // 3, 弹出到跟控制器(把跟控制器之后的所有的控制器都弹出)
    // [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"\n%@", self.navigationController.viewControllers);
    NSLog(@"\n%@", self.navigationController.childViewControllers);
}

- (void)dealloc
{
    NSLog(@"%s", __func__);
}

@end
