//
//  QYTestModel.m
//  Demo02_TestMVC
//
//  Created by qingyun on 16/6/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYTestModel.h"

@implementation QYTestModel

+ (instancetype)testModelWithDictionary:(NSDictionary *)dicData {
    QYTestModel *testModel = [QYTestModel new];
    // 建议: 这个方法性能不好, 不建议使用
    // 这个东西必须满足一个条件: 字典里面的key必须和属性名一致, 否则赋值失败
    [testModel setValuesForKeysWithDictionary:dicData];
    return testModel;
}

@end
