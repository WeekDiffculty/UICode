//
//  Student.h
//  非正式协议
//
//  Created by qingyun on 16/6/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property (nonatomic, strong) NSString *name;

@property (nonatomic, weak) id delegate;

#if 0
- (void)sleep;

- (void)tellSleeping:(id)obj;
#endif

- (void)sleep;


@end
