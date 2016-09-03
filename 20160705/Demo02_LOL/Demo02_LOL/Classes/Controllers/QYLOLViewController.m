//
//  ViewController.m
//  Demo02_LOL
//
//  Created by qingyun on 16/7/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYLOLViewController.h"
#import "QYFriendsSectionModel.h"
#import "QYHeaderView.h"

@interface QYLOLViewController ()

/** 所有的分组模型数组 */
@property (nonatomic, copy) NSArray *arrFriendSectionModels;

@end

@implementation QYLOLViewController

- (NSArray *)arrFriendSectionModels {
    if (_arrFriendSectionModels == nil) {
        NSString *strPath = [[NSBundle mainBundle] pathForResource:@"hero" ofType:@"plist"];
        NSArray *arrSections = [NSArray arrayWithContentsOfFile:strPath];
        NSMutableArray *arrMTemp = [NSMutableArray arrayWithCapacity:arrSections.count];
        for (NSDictionary *dicSection in arrSections) {
            QYFriendsSectionModel *section = [QYFriendsSectionModel modelWithDictionary:dicSection];
            [arrMTemp addObject:section];
        }
        _arrFriendSectionModels = [arrMTemp copy];
    }
    return _arrFriendSectionModels;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - UITableViewDataSource
/** 分组的个数 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.arrFriendSectionModels.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    QYFriendsSectionModel *sectionModel = self.arrFriendSectionModels[section];
    return sectionModel.isOpen ? sectionModel.arrFriendModels.count : 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *strId = @"Id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strId];
    }
    // 覆盖数据
    QYFriendsSectionModel *sectionModel = self.arrFriendSectionModels[indexPath.section];
    QYFriendModel *friend = sectionModel.arrFriendModels[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:friend.strIcon];
    cell.textLabel.text = friend.strName;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    QYHeaderView *header = [QYHeaderView headerViewWithTableView:tableView];
    QYFriendsSectionModel *sectionModel = self.arrFriendSectionModels[section];
    header.sectionModel = sectionModel;
    [header setBlkHeaderViewDidTap:^{
        [tableView reloadData];
    }];
    return header;
}

@end
