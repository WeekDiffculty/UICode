//
//  ViewController.m
//  4000000
//
//  Created by qingyun on 16/7/12.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "QYHeaderView.h"

@interface ViewController () <UITableViewDataSource, QYHeaderViewDelegate>

@end

@implementation ViewController

#pragma mark - ♻️ LifeCycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDefaultSetting];
}

/** Load the default UI elements And prepare some datas needed. */
- (void)loadDefaultSetting {
    UITableView *tableView = [UITableView new];
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(20);
        make.leading.and.trailing.and.bottom.equalTo(self.view);
    }];
    
    QYHeaderView *viewHeader = [QYHeaderView new];
    viewHeader.frame = CGRectMake(0, 0, 0, 410);
    tableView.tableHeaderView = viewHeader;
    viewHeader.delegate = self;
}

#pragma mark - 🔌 Delegate Methods
#pragma mark UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *strId = @"cellStyle1";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strId];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Text_Row:%zi", indexPath.row];
    
    return cell;
}

#pragma mark QYHeaderViewDelegate
- (void)headerView:(QYHeaderView *)headerView didSelectButtonWithData:(NSDictionary *)dicData {
    NSLog(@"%@", dicData);
}
- (void)headerView:(QYHeaderView *)headerView didTapImageViewAtIndex:(NSUInteger)index {
    NSLog(@"%ld", index);
}

@end
