//
//  Student.h
//  在UI中使用KVC
//
//  Created by qingyun on 16/6/13.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic) NSInteger age;
@property (nonatomic) BOOL sex;
@property (nonatomic, readonly, strong) NSString *ID;

@end
