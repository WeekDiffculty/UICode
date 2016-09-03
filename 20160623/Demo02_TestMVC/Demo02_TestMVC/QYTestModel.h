//
//  QYTestModel.h
//  Demo02_TestMVC
//
//  Created by qingyun on 16/6/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYTestModel : NSObject

/** 车名 */
@property (nonatomic, copy) NSString *name;

/** 车牌号 */
@property (nonatomic, copy) NSString *identifier;

/** 轮胎个数 */
@property (nonatomic, assign) NSNumber *wheelsCount;

// 初始化类方法
+ (instancetype)testModelWithDictionary:(NSDictionary *)dicData;

@end
