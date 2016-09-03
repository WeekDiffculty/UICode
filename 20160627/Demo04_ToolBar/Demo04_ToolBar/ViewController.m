//
//  ViewController.m
//  Demo04_ToolBar
//
//  Created by qingyun on 16/6/27.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - ♻️ LifeCycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDefaultSetting];
}

- (void)loadDefaultSetting {
    self.view.backgroundColor = [UIColor orangeColor];
    // 导航控制器的工具栏(toolBar)
    [self.navigationController setToolbarHidden:NO];
    // 和NavigationItem一样里面放的也是: UIBarButtonItem
//    // 常规的一个UIBarButtonItem
//    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:nil action:nil];
//    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:nil action:nil];
//    UIBarButtonItem *item3 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:nil action:nil];
//    // 特殊的UIBarButtonItem
//    UIBarButtonItem *itemFixed = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//    itemFixed.width = 20;
//    
//    UIBarButtonItem *itemFlexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
//    
//    self.toolbarItems = @[itemFixed, item1, itemFlexible, item2, itemFlexible, item3, itemFixed];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self.navigationController setToolbarHidden:NO animated:YES];
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:nil action:nil];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:nil action:nil];
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:nil action:nil];
    // 特殊的UIBarButtonItem
    UIBarButtonItem *itemFixed = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    itemFixed.width = 20;
    
    UIBarButtonItem *itemFlexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    NSArray *arrItems = @[itemFixed, item1, itemFlexible, item2, itemFlexible, item3, itemFixed];
    [self setToolbarItems:arrItems animated:YES];
}

@end
