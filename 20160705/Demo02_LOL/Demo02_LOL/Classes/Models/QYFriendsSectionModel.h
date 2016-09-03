//
//  QYHeroSectionModel.h
//  Demo02_LOL
//
//  Created by qingyun on 16/7/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QYFriendModel.h"

@interface QYFriendsSectionModel : NSObject

/** 朋友模型数组 */
@property (nonatomic, copy) NSArray *arrFriendModels;

/** 分组名称 */
@property (nonatomic, copy) NSString *strName;

/** 在线人数 */
@property (nonatomic, assign) NSUInteger onlineCount;

/** 当前分组是否展开, 默认NO */
@property (nonatomic, assign) BOOL isOpen;

/** 初始化方法 */
+ (instancetype)modelWithDictionary:(NSDictionary *)dicData;

@end
