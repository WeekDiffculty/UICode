//
//  QYHeroModel.m
//  Demo02_LOL
//
//  Created by qingyun on 16/7/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYFriendModel.h"

@implementation QYFriendModel

+ (instancetype)modelWithDictionary:(NSDictionary *)dicData {
    QYFriendModel *model = [QYFriendModel new];
    model.strIcon = dicData[@"icon"];
    model.strName = dicData[@"name"];
    model.strIntro = dicData[@"intro"];
    model.VIP = [dicData[@"vip"] boolValue];
    return model;
}

@end
