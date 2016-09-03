//
//  TableViewCell.m
//  CellHeight_Code
//
//  Created by qingyun on 16/7/15.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell
{
    __weak UIImageView *_imvHead;
    __weak UILabel *_lblName;
    __weak UILabel *_lblText;
}

/** 返回循环利用的cell */
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *strId = @"TableViewCell";
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strId];
    if (!cell) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strId];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self loadDefaultSetting];
    }
    return self;
}

/** 加载默认设置和UI */
- (void)loadDefaultSetting {
    UIImageView *imvHead = [UIImageView new];
    [self.contentView addSubview:imvHead];
    _imvHead = imvHead;
    
    UILabel *lblName = [UILabel new];
    [self.contentView addSubview:lblName];
    _lblName = lblName;
    
    UILabel *lblText = [UILabel new];
    lblText.numberOfLines = 0;
    [self.contentView addSubview:lblText];
    _lblText = lblText;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat space = 8;
    
    _imvHead.frame = CGRectMake(space, space, 50, 50);
    
    _lblName.frame = CGRectMake(CGRectGetMaxX(_imvHead.frame) + space, CGRectGetMinY(_imvHead.frame), <#CGFloat width#>, <#CGFloat height#>);
}

@end
