//
//  QYHeroSectionModel.m
//  Demo02_LOL
//
//  Created by qingyun on 16/7/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYFriendsSectionModel.h"

@implementation QYFriendsSectionModel

+ (instancetype)modelWithDictionary:(NSDictionary *)dicData {
    QYFriendsSectionModel *model = [QYFriendsSectionModel new];
    model.strName = dicData[@"name"];
    model.onlineCount = [dicData[@"online"] unsignedIntegerValue];
    
    NSArray *arrFriends = dicData[@"friends"];
    NSMutableArray *arrMFriendModels = [NSMutableArray arrayWithCapacity:arrFriends.count];
    for (NSDictionary *dicTemp in arrFriends) {
        QYFriendModel *friend = [QYFriendModel modelWithDictionary:dicTemp];
        [arrMFriendModels addObject:friend];
    }
    model.arrFriendModels = arrMFriendModels;
    
    return model;
}

@end
