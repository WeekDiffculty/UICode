//
//  QYDifinationCell.m
//  Demo05_UITableViewCell自定义
//
//  Created by qingyun on 16/7/2.
//  Copyright © 2016年 qingyun. All rights reserved.
//


#import "QYDefinationCell.h"

@implementation QYDefinationCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *strID = @"cellID";
    QYDefinationCell *cell = [tableView dequeueReusableCellWithIdentifier:strID];
    
    if (!cell) {
        cell = [[QYDefinationCell alloc] initWithStyle:0 reuseIdentifier:strID];
    }
    
    return cell;
}

@end
