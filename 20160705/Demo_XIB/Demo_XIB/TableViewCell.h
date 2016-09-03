//
//  TableViewCell.h
//  Demo_XIB
//
//  Created by qingyun on 16/7/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestModel.h"

@interface TableViewCell : UITableViewCell

@property (nonatomic, strong) TestModel *model;

/** 返回循环利用的cell */
+ (instancetype)cellWithTableView:(UITableView *)tableView type:(NSUInteger)type;

@end
