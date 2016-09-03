//
//  TableViewCell.m
//  Demo_XIB
//
//  Created by qingyun on 16/7/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle2;

@end

@implementation TableViewCell

/** 返回循环利用的cell */
+ (instancetype)cellWithTableView:(UITableView *)tableView type:(NSUInteger)type {
//    if (type == 0) {
        static NSString *strId = @"TableViewCell";
        TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strId];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:nil options:nil] firstObject];
        }
        return cell;
//    } else {
//        static NSString *strId = @"TableViewCell";
//        TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strId];
//        if (!cell) {
//            cell = [[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:nil options:nil][1];
//        }
//        return cell;
//    }
}

- (void)setModel:(TestModel *)model {
    _model = model;
    
    NSLog(@"");
}

@end
