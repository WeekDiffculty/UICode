//
//  QYTableViewCell.m
//  Demo01_Instagram_Nib
//
//  Created by qingyun on 16/7/11.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYTableViewCell.h"

@implementation QYTableViewCell

+ (instancetype)cellForTableView:(UITableView *)tableView {
    static NSString *strId = @"QYTableViewCell";
    QYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strId];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"QYTableViewCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

@end
