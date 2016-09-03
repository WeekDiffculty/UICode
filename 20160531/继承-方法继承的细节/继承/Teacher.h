//
//  Teacher.h
//  继承
//
//  Created by qingyun on 16/5/31.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Person.h"

@interface Teacher : Person

@property (nonatomic, strong) NSString *skill;

- (void)teach;

@end
