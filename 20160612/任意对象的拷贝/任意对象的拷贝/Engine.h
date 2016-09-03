//
//  Engine.h
//  任意对象的拷贝
//
//  Created by qingyun on 16/6/12.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Oil;

@interface Engine : NSObject <NSCopying>

@property (nonatomic) NSInteger power;
@property (nonatomic, strong) Oil *oil;

@end
