//
//  Person.h
//  理解类别
//
//  Created by qingyun on 16/6/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic) int age;


//// work
//- (void)coding;
//- (void)meetting;

@end

// 把study相关的功能通过类别来分类
@interface Person (Study)

// study
- (void)studyPorgramming;
- (void)studyEnglish;
// ....

@end

@interface Person (Play)

// play
- (void)playGame;
- (void)shopping;

@end

