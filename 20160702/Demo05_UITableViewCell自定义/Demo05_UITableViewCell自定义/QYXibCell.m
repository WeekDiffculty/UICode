//
//  QYXibCell.m
//  Demo05_UITableViewCell自定义
//
//  Created by qingyun on 16/7/2.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYXibCell.h"

@interface QYXibCell ()
{
    
}

@property (nonatomic, weak) UILabel *label;

@end

@implementation QYXibCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *strID = @"QYXibCell";
    QYXibCell *cell = [tableView dequeueReusableCellWithIdentifier:strID];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"QYXibCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self loadDefaultSetting];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)decoder {
    if (self = [super initWithCoder:decoder]) {
        [self loadDefaultSetting];
    }
    return self;
}

/** Load the default UI elements And prepare some datas needed. */
- (void)loadDefaultSetting {
    // 添加字控件的时候必须添加到cell的contentview上
    UILabel *label = [UILabel new];
    [self.contentView addSubview:label];
    self.label = label;
}

/** 需要布局子控件的时候, 系统会自动给调用, 所以可以在这个方法中重新布局自定义添加的视图的frame */
- (void)layoutSubviews {
    // 必须调用父类的该方法
    [super layoutSubviews];
    
    // 在这里布局所有的子视图
    self.label.frame = CGRectMake(8, 8, 100, 30);
}

@end
