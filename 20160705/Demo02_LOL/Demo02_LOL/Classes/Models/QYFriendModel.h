//
//  QYHeroModel.h
//  Demo02_LOL
//
//  Created by qingyun on 16/7/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYFriendModel : NSObject

/** 图标 */
@property (nonatomic, copy) NSString *strIcon;

/** 名字 */
@property (nonatomic, copy) NSString *strName;

/** 简介 */
@property (nonatomic, copy) NSString *strIntro;

/** 是否有是VIP */
@property (nonatomic, assign, getter=isVIP) BOOL VIP;

/** 创建一个初始化方法, 构造方法 */
+ (instancetype)modelWithDictionary:(NSDictionary *)dicData;

@end
