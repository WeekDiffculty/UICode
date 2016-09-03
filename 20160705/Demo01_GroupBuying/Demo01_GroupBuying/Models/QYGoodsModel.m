//
//  QYGoodsModel.m
//  Demo01_GroupBuying
//
//  Created by qingyun on 16/7/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYGoodsModel.h"

@implementation QYGoodsModel

+ (instancetype)modelWithDictionary:(NSDictionary *)dicData {
    QYGoodsModel *model = [QYGoodsModel new];
    model.strIcon = dicData[@"icon"];
    model.strPrice = dicData[@"price"];
    model.strTitle = dicData[@"title"];
    model.strBuyCount = dicData[@"buycount"];
    model.goodsType = [dicData[@"type"] integerValue];
    return model;
}

@end
