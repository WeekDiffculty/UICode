//
//  ViewController.m
//  Demo01_Instagram_Nib
//
//  Created by qingyun on 16/7/11.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "QYTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //self.tableView.rowHeight = 447;
    self.tableView.estimatedRowHeight = 500;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

#pragma mark - 🔌 Delegate Methods
#pragma mark UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QYTableViewCell *cell = [QYTableViewCell cellForTableView:tableView];
    return cell;
}

@end
