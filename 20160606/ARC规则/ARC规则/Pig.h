//
//  Pig.h
//  ARC规则
//
//  Created by qingyun on 16/6/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pig : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, weak) Pig *friend;

- (void)laugh;

+ (instancetype)defaultPig;

@end
