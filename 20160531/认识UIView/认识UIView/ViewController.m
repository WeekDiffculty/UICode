//
//  ViewController.m
//  认识UIView
//
//  Created by qingyun on 16/5/31.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

// 这个方法运行的时候表示 该 界面（视图控制器）的底层视图已经加载成功，我们在这里可以自定义我们的其他界面元素
- (void)viewDidLoad {
    [super viewDidLoad];
    
#if 0
    // 创建一个 UIView
    // 使用初始化的方式来创建UIView，用Frame的初始化
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    view1.backgroundColor = [UIColor cyanColor];
    // self.view 访问的是该视图控制器（界面）最底层的view，该view代表着整个界面的视图基础，在界面上展示的其他所有view都是以该view作为底层视图的
    //[self.view addSubview:view1];
    
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(150, 150, 200, 200)];
    view2.backgroundColor = [UIColor purpleColor];
    
    //[self.view addSubview:view2];
#endif
    
    // self.view  [uiscreen mainscreen]
    UIView *view3 = [[UIView alloc] init];
    view3.frame = CGRectMake(50, 200, self.view.frame.size.width-50*2, self.view.frame.size.height-2*200);
    view3.backgroundColor = [UIColor magentaColor];
    
    [self.view addSubview:view3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
