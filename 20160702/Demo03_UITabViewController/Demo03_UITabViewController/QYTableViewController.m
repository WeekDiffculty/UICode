//
//  QYTableViewController.m
//  Demo03_UITabViewController
//
//  Created by qingyun on 16/7/2.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYTableViewController.h"

@interface QYTableViewController ()

@end

@implementation QYTableViewController

- (void)loadView {
    UITableView *tableView = [UITableView new];
    self.view = tableView;
    self.tableView = tableView;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

@end
