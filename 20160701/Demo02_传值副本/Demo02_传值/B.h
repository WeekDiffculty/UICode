//
//  QYWangCai.h
//  Demo02_传值
//
//  Created by qingyun on 16/7/1.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "A.h"

@protocol BDelegate <NSObject>

- (void)笑了;

@end

@interface B : NSObject

@property (nonatomic, strong) id<BDelegate> delegate;

- (void)wang;

@end
