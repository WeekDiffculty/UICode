//
//  StudentInfo.m
//  学生信息管理
//
//  Created by qingyun on 16/6/16.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "StudentInfo.h"

@implementation StudentInfo

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _username = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 150, 40)];
        _password = [[UILabel alloc] initWithFrame:CGRectMake(140, 0, 100, 40)];
        [self addSubview:_username];
        [self addSubview:_password];
    }
    return self;
}

@end
