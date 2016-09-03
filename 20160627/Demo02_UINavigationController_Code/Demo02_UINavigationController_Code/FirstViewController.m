//
//  ViewController.m
//  Demo02_UINavigationController_Code
//
//  Created by qingyun on 16/6/27.
//  Copyright © 2016年 qingyun. All rights reserved.
//

/*!
 * 导航控制器的使用
 * 注意点:
 *  在视图控制器中访问导航控制器(self.navigationController)的时候一定要考虑, 当前的控制器有没有被导航控制器管理(当前的控制器有没有在一个导航控制器的导航栈中)
 *  入栈, 调用导航控制器的 -[UINavogationController pushViewController:animated:];
 *  出栈, 调用导航控制器的 -[UINavogationController popxxx]; 弹出的控制器默认情况下会被销毁; 弹出的控制器必须是导航控制器已经管理的控制器, 已经存在在导航栈里面的控制器
 */

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDefaultSetting];
}

/** Load the default UI elements And prepare some datas needed. */
- (void)loadDefaultSetting {
    self.title = @"撒女神";
    self.view.backgroundColor = [UIColor orangeColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //NSLog(@"%@", self.navigationController);
    // 1,创建SecondViewController
    SecondViewController *vcSecond = [SecondViewController new];
    
    // 2,入栈
    [self.navigationController pushViewController:vcSecond animated:YES];
}

@end
