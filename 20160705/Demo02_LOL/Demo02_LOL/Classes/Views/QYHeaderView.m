//
//  QYHeaderView.m
//  Demo02_LOL
//
//  Created by qingyun on 16/7/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYHeaderView.h"

@interface QYHeaderView () <NSObject>

@property (nonatomic, weak) UIButton *btnBg;
@property (nonatomic, weak) UILabel *lblOnlineCount;

@end

@implementation QYHeaderView

+ (instancetype)headerViewWithTableView:(UITableView *)tableView {
    static NSString *strId = @"QYHeaderView";
    QYHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:strId];
    if (!header) {
        header = [[QYHeaderView alloc] initWithReuseIdentifier:strId];
    }
    return header;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        [self loadDefaultSetting];
    }
    return self;
}

- (void)loadDefaultSetting {
    // 添加占据header的按钮, 让整个header都可以接收点击事件
    UIButton *btnBg = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnBg setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
    [btnBg setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
    [btnBg setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
    [btnBg setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btnBg.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    btnBg.contentEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 0);
    btnBg.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [btnBg addTarget:self action:@selector(tapAction) forControlEvents:UIControlEventTouchUpInside];
    btnBg.imageView.contentMode = UIViewContentModeCenter;
    btnBg.imageView.clipsToBounds = NO;
    [self.contentView addSubview:btnBg];
    self.btnBg = btnBg;
    
    UILabel *lblOnlineCount = [UILabel new];
    lblOnlineCount.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:lblOnlineCount];
    self.lblOnlineCount = lblOnlineCount;
}

- (void)tapAction {
    self.sectionModel.isOpen = !self.sectionModel.isOpen;
    if (self.blkHeaderViewDidTap) {
        self.blkHeaderViewDidTap();
    }
}

- (void)setSectionModel:(QYFriendsSectionModel *)sectionModel {
    _sectionModel = sectionModel;
    
    [self.btnBg setTitle:sectionModel.strName forState:UIControlStateNormal];
    [self.lblOnlineCount setText:[NSString stringWithFormat:@"%ld/%ld", sectionModel.onlineCount, sectionModel.arrFriendModels.count]];
    
    if (sectionModel.isOpen) {
        self.btnBg.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
    } else {
        // 清空所有的tranform属性
        self.btnBg.imageView.transform = CGAffineTransformIdentity;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.btnBg.frame = self.bounds;
    
    CGFloat widthLblOnLineCount = 100;
    CGFloat xLblOnLineCount = self.bounds.size.width - widthLblOnLineCount - 8;
    self.lblOnlineCount.frame = CGRectMake(xLblOnLineCount, 0, widthLblOnLineCount, self.bounds.size.height);
}

@end
