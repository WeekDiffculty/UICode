//
//  TestViewController.m
//  Demo03_UIPageViewController
//
//  Created by qingyun on 16/7/1.
//  Copyright © 2016年 qingyun. All rights reserved.
//

/** Color Related */
#define QLColorWithRGB(redValue, greenValue, blueValue) ([UIColor colorWithRed:((redValue)/255.0) green:((greenValue)/255.0) blue:((blueValue)/255.0) alpha:1])
#define QLColorRandom QLColorWithRGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
#define QLColorFromHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = QLColorRandom;
}

- (void)dealloc
{
    NSLog(@"%s", __func__);
}

@end
