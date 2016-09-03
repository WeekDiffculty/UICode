//
//  ViewController.m
//  打地鼠1.0
//
//  Created by qingyun on 16/6/2.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

#import "Game.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 创建Game视图
    Game *game = [[Game alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:game];

//    game.mouse.image = [UIImage imageNamed:@"redhat"];
}

// 视图控制器是否支持旋转
- (BOOL)shouldAutorotate
{
    return YES;
}

// 怎么旋转
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscapeRight;
}

@end
