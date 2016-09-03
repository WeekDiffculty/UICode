//
//  QYGoodsModel.h
//  Demo01_GroupBuying
//
//  Created by qingyun on 16/7/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSInteger {
    /** 广告 */
    QYGoodsTypeAdvertisement,
    /** 正常商品 */
    QYGoodsTypeNormal
} QYGoodsType;

@interface QYGoodsModel : NSObject

/** 已经购买的次数 */
@property (nonatomic, copy) NSString *strBuyCount;

/** 商品图标 */
@property (nonatomic, copy) NSString *strIcon;

/** 价格 */
@property (nonatomic, copy) NSString *strPrice;

/** 标题 */
@property (nonatomic, copy) NSString *strTitle;

/** 商品类型 */
@property (nonatomic, assign) QYGoodsType goodsType;

/** 便利的构造方法 */
+ (instancetype)modelWithDictionary:(NSDictionary *)dicData;

@end
