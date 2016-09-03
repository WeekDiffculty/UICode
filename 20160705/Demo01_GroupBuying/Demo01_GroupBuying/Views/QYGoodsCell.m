//
//  QYGoodsCell.m
//  Demo01_GroupBuying
//
//  Created by qingyun on 16/7/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYGoodsCell.h"

@interface QYGoodsCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imvFoods;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblPrice;
@property (weak, nonatomic) IBOutlet UILabel *lblBuyCount;

@end

@implementation QYGoodsCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    // 创建一个cell
    static NSString *strId = @"QYGoodsCell";
    QYGoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:strId];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"QYGoodsCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

- (void)setGoodsModel:(QYGoodsModel *)goodsModel {
    _goodsModel = goodsModel;
    
    self.imvFoods.image = [UIImage imageNamed:_goodsModel.strIcon];
    self.lblTitle.text = _goodsModel.strTitle;
    self.lblPrice.text = _goodsModel.strPrice;
    self.lblBuyCount.text = _goodsModel.strBuyCount;
}

@end
