//
//  ViewController.m
//  Demo02_UITableView_Index
//
//  Created by qingyun on 16/7/4.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource>

/** 联系人字典 */
@property (nonatomic, copy) NSDictionary *dicContacts;

/** 联系人分组标题数组 */
@property (nonatomic, copy) NSArray *arrKeys;

@end

@implementation ViewController

- (NSArray *)arrKeys {
    if (_arrKeys == nil) {
        NSArray *arrTempKeys = [self.dicContacts allKeys];
        _arrKeys = [arrTempKeys sortedArrayUsingSelector:@selector(compare:)];
    }  //获取字典中所有的键名
    return _arrKeys;
}

- (NSDictionary *)dicContacts {
    if (!_dicContacts) {
        NSString *strPath = [[NSBundle mainBundle] pathForResource:@"contacts" ofType:@"plist"];
        _dicContacts = [NSDictionary dictionaryWithContentsOfFile:strPath];
    }
    return _dicContacts;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadDefaultSetting];
}


- (void)loadDefaultSetting {
    UITableView *tableView = [UITableView new];
    tableView.frame = self.view.bounds;
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    
    // 索引的相关属性
    tableView.sectionIndexColor = [UIColor orangeColor];
    tableView.sectionIndexBackgroundColor = [UIColor redColor];
    tableView.sectionIndexTrackingBackgroundColor = [UIColor blueColor];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.arrKeys.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *strKey = self.arrKeys[section];
    NSArray *arrTemp = self.dicContacts[strKey];
    return arrTemp.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *strId = @"cellStyle1";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strId];
    }
    NSString *strKey = self.arrKeys[indexPath.section];
    NSArray *arrTemp = self.dicContacts[strKey];
    cell.textLabel.text = arrTemp[indexPath.row];
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.arrKeys[section];
}




- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return self.arrKeys;
}
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return index + 1;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
