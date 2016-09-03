//
//  TableViewCell.h
//  CellHeight_Code
//
//  Created by qingyun on 16/7/15.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

/** 返回循环利用的cell */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
