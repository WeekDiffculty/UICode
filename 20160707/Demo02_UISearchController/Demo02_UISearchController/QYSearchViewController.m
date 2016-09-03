//
//  ViewController.m
//  Demo02_UISearchController
//
//  Created by qingyun on 16/7/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYSearchViewController.h"
#import "QYResultsController.h"

@interface QYSearchViewController () <UITableViewDataSource, UISearchResultsUpdating>

@property (nonatomic, strong) UISearchController *searchController;

@property (nonatomic, copy) NSArray *arrDatas;

@end

@implementation QYSearchViewController

/** 懒加载数据 */
- (NSArray *)arrDatas {
    if (!_arrDatas) {
        NSUInteger count = 26;
        NSMutableArray *arrMDatas =[NSMutableArray arrayWithCapacity:count * 4];
        for (int index = 0; index < count; index ++) {
            for (NSUInteger num = 0; num < 4; num ++) {
                NSString *strData = [NSString stringWithFormat:@"%c - %ld", index + 'A', num];
                [arrMDatas addObject:strData];
            }
        }
        
        _arrDatas = [arrMDatas copy];
    }
    return _arrDatas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDefaultSetting];
}


- (void)loadDefaultSetting {
    self.title = @"搜索";
    
    UITableView *tableView = [UITableView new];
    tableView.frame = self.view.bounds;
    [self.view addSubview:tableView];
    // 设置数据源
    tableView.dataSource = self;
    
    // SearchController: 默认提供了一个UISearchBar, 尺寸已经设置好
    UISearchController *vcSearch = [[UISearchController alloc] initWithSearchResultsController:[QYResultsController new]];
    tableView.tableHeaderView = vcSearch.searchBar;
    vcSearch.searchResultsUpdater = self;
    // 当添加(使用)一个控制器为另一个控制器的时候, 这个控制器就是激活状态的, 再push/modal这个控制器就会报错 : Application tried to present modally an active controller
    //[self addChildViewController:vcSearch];
    self.searchController = vcSearch;
    
    // 让搜索视图变暗
    vcSearch.dimsBackgroundDuringPresentation = YES;
    // 搜索时让背景有一点模糊, 是dimsBackgroundDuringPresentation的总开关
    //vcSearch.obscuresBackgroundDuringPresentation = NO;
    
     vcSearch.hidesNavigationBarDuringPresentation = YES;
}

#pragma mark - 🔌 Delegate Methods
#pragma mark UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrDatas.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *strId = @"cellStyle1";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strId];
    }
    cell.textLabel.text = self.arrDatas[indexPath.row];
    
    return cell;
}

#pragma mark UISearchResultsUpdating
/** 激活搜索框的时候, 搜索框内容变化的时候就会调用 */
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    //NSLog(@"%s", __FUNCTION__);
    
    // 过滤数据
    NSString *strSearchText = searchController.searchBar.text;
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS %@", strSearchText];
    NSArray *arrResults = [self.arrDatas filteredArrayUsingPredicate:predicate];
    
    // searchController.searchResultsController: 初始化传进去的控制器
    QYResultsController *vcResult = (QYResultsController *)searchController.searchResultsController;
    vcResult.arrResults = arrResults;
   
}


@end
