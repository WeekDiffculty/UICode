//
//  QYAppModel.h
//  Demo03_AppMgr_MVC
//
//  Created by qingyun on 16/6/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYAppModel : NSObject

/** 应用的名称 */
@property (nonatomic, copy) NSString *name;

/** 应用的图标名称 */
@property (nonatomic, copy) NSString *icon;

/** 模型初始化方法 */
+ (instancetype)appModelWithDictionary:(NSDictionary *)dicData;

@end
