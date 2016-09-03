//
//  QYAdsCell.m
//  Demo01_GroupBuying
//
//  Created by qingyun on 16/7/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYAdsCell.h"

@interface QYAdsCell () <NSObject>

/** 标题标签 */
@property (nonatomic, weak) UILabel *lblTitle;
/** 商品图标 */
@property (nonatomic, weak) UIImageView *imvFoods;

@end

@implementation QYAdsCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *strId = @"QYAdsCell";
    QYAdsCell *cell = [tableView dequeueReusableCellWithIdentifier:strId];
    if (cell == nil) {
        cell = [[QYAdsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strId];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self loadDefaultSetting];
    }
    return self;
}

- (void)loadDefaultSetting {
    // 不要在初始化的时候设置frame, 在初始化的时候不一定能拿到当前父视图的frame
    // 但是在layoutSubviews里面这个父视图的frame是一定能拿到的
    // 添加标题标签
    UILabel *lblTitle = [UILabel new];
    // 设置标签显示的最大行数
    [lblTitle setNumberOfLines:3];
    [self.contentView addSubview:lblTitle];
    self.lblTitle = lblTitle;
    
    UIImageView *imvFoods = [UIImageView new];
    imvFoods.contentMode = UIViewContentModeScaleAspectFill;
    imvFoods.clipsToBounds = YES;
    [self.contentView addSubview:imvFoods];
    self.imvFoods = imvFoods;
}

- (void)setGoodsModel:(QYGoodsModel *)goodsModel {
    _goodsModel = goodsModel;
    
    self.lblTitle.text = _goodsModel.strTitle;
    self.imvFoods.image = [UIImage imageNamed:_goodsModel.strIcon];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat delta = 8;
    
    CGFloat widthSelf = self.bounds.size.width;
    CGFloat heightSelf = self.bounds.size.height;
    
    // 因为图片大小有要求, 所以先布局图片
    CGFloat widthImvFoods = 90;
    CGFloat XImvFoods = widthSelf - delta - widthImvFoods;
    CGFloat YImvFoods = (heightSelf - widthImvFoods) / 2;
    self.imvFoods.frame = CGRectMake(XImvFoods, YImvFoods, widthImvFoods, widthImvFoods);
    
    // 布局标题
    CGFloat widthLblTitle = CGRectGetMinX(self.imvFoods.frame) - 2 * delta;
    self.lblTitle.frame = CGRectMake(delta, 0, widthLblTitle, heightSelf);
}

@end
