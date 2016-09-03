//
//  QYWangCai.h
//  Demo02_传值
//
//  Created by qingyun on 16/7/1.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@class B;

@protocol QYWangCaiDelegate <NSObject>

- (void)wangcai:(B *)wangcai didFinishWithCount:(NSUInteger)count;

@end

@interface B : NSObject

// 代理属性的格式: @property (nonatomic, weak) id<id对象要遵守的协议> delegate;
@property (nonatomic, weak) id<QYWangCaiDelegate> delegate;





// Block属性的格式:@property (nonatomic, copy) 返回值 (^属性的名字)(参数列表);
@property (nonatomic, copy) void (^blkDidWang)(NSUInteger count);

- (void)wang;

@end
