//
//  Teach.h
//  协议类型
//
//  Created by qingyun on 16/6/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TakeCare.h"

@protocol Teach <TakeCare> // 协议声明后面的 <> 表示协议的继承，协议的继承其实就对原有协议追加新的条例

@optional
- (void)teachSpeeking;
- (void)teachCoding;

@required
- (void)doPeople;

@end
