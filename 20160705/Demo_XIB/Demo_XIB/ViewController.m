//
//  ViewController.m
//  Demo_XIB
//
//  Created by qingyun on 16/7/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface ViewController () <UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [UITableView new];
    [self.view addSubview:tableView];
    tableView.frame = self.view.bounds;
    tableView.dataSource = self;
}

#pragma mark - 🔌 Delegate Methods
#pragma mark UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 23;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *cell = [TableViewCell cellWithTableView:tableView type:arc4random_uniform(2)];
    TestModel *model = [TestModel new];
    model.strTitle = [NSString stringWithFormat:@"%ld", indexPath.row];
    cell.model = model;
    
    return cell;
}

@end
