//
//  TakeCare.h
//  协议类型
//
//  Created by qingyun on 16/6/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TakeCare <NSObject>

- (void)feed;

- (void)play;

@optional
- (void)sleep;

@end
