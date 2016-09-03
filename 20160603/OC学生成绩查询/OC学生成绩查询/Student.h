//
//  Student.h
//  OC学生成绩查询
//
//  Created by 王宇腾 on 16/5/9.
//  Copyright © 2016年 王宇腾. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject <NSCoding>

@property (nonatomic,assign) NSInteger stuID;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) NSInteger age;
@property (nonatomic,assign) NSInteger score;

-(id)init;

-(void)inputStudent;

-(void)printStudent;

@end
