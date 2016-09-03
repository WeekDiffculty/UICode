//
//  QYAppModel.m
//  Demo03_AppMgr_MVC
//
//  Created by qingyun on 16/6/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYAppModel.h"

@implementation QYAppModel

+ (instancetype)appModelWithDictionary:(NSDictionary *)dicData {
    QYAppModel *app = [QYAppModel new];
    app.name = dicData[@"name"];
    app.icon = dicData[@"icon"];
    return app;
}

@end
