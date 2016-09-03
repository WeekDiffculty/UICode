//
//  MessageViewController.m
//  Demo03_微博
//
//  Created by qingyun on 16/6/28.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "MessageViewController.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIViewController *vc = [UIViewController new];
    vc.view.backgroundColor = [UIColor cyanColor];
    [self.navigationController pushViewController:vc animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
