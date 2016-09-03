//
//  ViewController.m
//  Demo02_UICollectionViewController
//
//  Created by qingyun on 16/7/12.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "QYCollectionViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    QYCollectionViewController *vcCollection = [QYCollectionViewController new];
    [self.navigationController pushViewController:vcCollection animated:YES];
}

@end
