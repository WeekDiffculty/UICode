//
//  Man.h
//  理解引用计数
//
//  Created by qingyun on 16/6/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Woman;

@interface Man : NSObject

{
    Woman *_girl;
}

@property (nonatomic, strong) NSString *name;

- (void)setGirl:(Woman *)girl;

- (void)live;

@end
