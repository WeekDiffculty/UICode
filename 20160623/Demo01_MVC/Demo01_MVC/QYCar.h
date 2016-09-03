//
//  QYCar.h
//  Demo01_MVC
//
//  Created by qingyun on 16/6/23.
//  Copyright © 2016年 Shreker. All rights reserved.
//

// Model: 存放数据的, 所以里面的核心内容就是各种属性
// 至于其他的一些方法都是数据的初始化方法, 这些方法都是辅助性的

#import <Foundation/Foundation.h>

@interface QYCar : NSObject

/** 车名 */
@property (nonatomic, copy) NSString *name;

/** 车牌号 */
@property (nonatomic, copy) NSString *identifier;

/** 轮胎个数 */
@property (nonatomic, assign) NSUInteger wheelsCount;


- (instancetype)initWithDictionary:(NSDictionary *)dicData;
+ (instancetype)carWithDictionary:(NSDictionary *)dicData;

@end
