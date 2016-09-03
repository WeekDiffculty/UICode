//
//  ViewController.m
//  Demo01_UItableView概述
//
//  Created by qingyun on 16/7/2.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    
    UIView *viewTableViewHeader = [UIView new];
    viewTableViewHeader.bounds = CGRectMake(0, 0, 0, 150);
    viewTableViewHeader.backgroundColor = [UIColor redColor];
    self.tableView.tableHeaderView = viewTableViewHeader;
    
    
    UIView *viewTableViewFooter = [UIView new];
    viewTableViewFooter.bounds = CGRectMake(0, 0, 0, 150);
    viewTableViewFooter.backgroundColor = [UIColor orangeColor];
    self.tableView.tableFooterView = viewTableViewFooter;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arc4random_uniform(6) + 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [UITableViewCell new];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld-%ld", indexPath.section, indexPath.row];
    return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"我是Header的Title";
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return @"我是Footer的Title";
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
