//
//  QYAdsCell.h
//  Demo01_GroupBuying
//
//  Created by qingyun on 16/7/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QYGoodsModel.h"

@interface QYAdsCell : UITableViewCell

/** 当前cell显示的数据 */
@property (nonatomic, strong) QYGoodsModel *goodsModel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
