//
//  ViewController.m
//  Demo05_UITableViewCell自定义
//
//  Created by qingyun on 16/7/2.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "QYDefinationCell.h"
#import "QYXibCell.h"

@interface ViewController () <UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDefaultSetting];
}

- (void)loadDefaultSetting {
    UITableView *tableView = [UITableView new];
    tableView.frame = self.view.bounds;
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    tableView.rowHeight = 130;
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 创建cell
    QYXibCell *cell = [QYXibCell cellWithTableView:tableView];
    
    // 覆盖cell的数据
    //cell.textLabel.text = @"呼啦呼啦...";
    
    // 返回cell
    return cell;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
