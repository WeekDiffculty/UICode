//
//  QYHeaderView.h
//  Demo02_LOL
//
//  Created by qingyun on 16/7/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QYFriendsSectionModel.h"

@interface QYHeaderView : UITableViewHeaderFooterView

@property (nonatomic, copy) void (^blkHeaderViewDidTap)();

@property (nonatomic, strong) QYFriendsSectionModel *sectionModel;

+ (instancetype)headerViewWithTableView:(UITableView *)tableView;

@end
