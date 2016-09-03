//
//  StudentSystem.h
//  OC学生成绩查询
//
//  Created by 王宇腾 on 16/5/18.
//  Copyright © 2016年 王宇腾. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"


@interface StudentSystem : NSObject

@property (nonatomic,copy) NSMutableArray *studentArray;

-(void)printStudentArray;

-(void)addStudentArray:(Student *)stu;

-(void)findStudentByStuID;

-(void)removeStudentArrayByStuID;

-(void)writeToFile;

-(void)readFromFile;

-(void)countStudent;

-(void)motifyStudent;

@end
