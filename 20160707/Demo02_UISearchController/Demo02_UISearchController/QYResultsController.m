//
//  QYResultsController.m
//  Demo02_UISearchController
//
//  Created by qingyun on 16/7/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYResultsController.h"

@interface QYResultsController ()

@end

@implementation QYResultsController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)setArrResults:(NSArray *)arrResults {
    _arrResults = [arrResults copy];
    [self.tableView reloadData];
    
//    UIEdgeInsets inset = self.tableView.contentInset;
//    inset.top = 64;
//    self.tableView.contentInset = inset;
}

#pragma mark - 🔌 Delegate Methods
#pragma mark UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrResults.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *strId = @"cellStyle1";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strId];
    }
    cell.textLabel.text = self.arrResults[indexPath.row];
    
    return cell;
}

@end
