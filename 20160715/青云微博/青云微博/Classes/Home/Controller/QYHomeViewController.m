//
//  QYHomeViewController.m
//  青云微博
//
//  Created by qingyun on 16/7/11.
//  Copyright © 2016年 qingyun. All rights reserved.
//

// 1, 先搭建UI

#import "QYHomeViewController.h"
#import "QYStatusModel.h"
#import "QYStatusCell.h"
#import "QYFooterView.h"
#import "QYDetailViewController.h"

@interface QYHomeViewController () <NSObject>

/** 很多条微博的模型 */
@property (nonatomic, copy) NSArray *arrStatusModels;

@end

@implementation QYHomeViewController

- (NSArray *)arrStatusModels {
    if (!_arrStatusModels) {
        NSString *strFilePath=[[NSBundle mainBundle] pathForResource:@"status" ofType:@"plist"];
        NSDictionary *dicStatuses=[NSDictionary dictionaryWithContentsOfFile:strFilePath];
        NSArray *arrStatuses=dicStatuses[@"statuses"];
        NSMutableArray *arrMStatusModels=[NSMutableArray arrayWithCapacity:arrStatuses.count];
        for (NSDictionary *dicData in arrStatuses) {
            QYStatusModel *status = [QYStatusModel statusModelWithDictionary:dicData];
            [arrMStatusModels addObject:status];
        }
        _arrStatusModels = [arrMStatusModels copy];
    }
    return _arrStatusModels;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDefaultSetting];
}

/** 加载默认设置和UI */
- (void)loadDefaultSetting {
    [self.view setBackgroundColor:QLColorWithRGB(239, 239, 244)];
    // 自动设置当前控制器中的ScrollView的内边距(UIEdgeInsets)
    //[self setAutomaticallyAdjustsScrollViewInsets:NO];
    
    self.tableView.estimatedRowHeight = 40;
    self.tableView.sectionFooterHeight = 30;
}

#pragma mark - 🔌 Delegate Methods
/** TableView中有多少个Section(分组) */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.arrStatusModels.count;
}
/** 在当前的Section中有多少cell(row) */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

// 只要dequeue的方法中有IndexPath, 就说明, 这个cell不是通过注册, 就是通过Storyboard中ProtoType类型创建的
/** 在IndexPath位置显示的cell */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QYStatusCell *cell = [QYStatusCell cellWithTableView:tableView];
    
    QYStatusModel *status = self.arrStatusModels[indexPath.section];
    cell.status = status;
    //// textLabel是懒加载的
    //cell.textLabel.text = status.strText;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 取消IndexPath位置cell的选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    QYDetailViewController *vcDetail = [QYDetailViewController new];
    vcDetail.status = self.arrStatusModels[indexPath.section];
    [self.navigationController pushViewController:vcDetail animated:YES];
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    QYFooterView *footer = [QYFooterView footerViewWithTableView:tableView];
    footer.contentView.backgroundColor = [UIColor whiteColor];
    footer.status = self.arrStatusModels[section];
    return footer;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.01;
    } else {
        return 20;
    }
}

@end
