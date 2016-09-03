//
//  NSObject+WakeUp.h
//  非正式协议
//
//  Created by qingyun on 16/6/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

// 对NSObject扩展的类别称为 非正式协议
@interface NSObject (WakeUp)

- (void)wakeUp:(NSTimer *)timer;

@end
