//
//  StudentSystem.m
//  OC学生成绩查询
//
//  Created by 王宇腾 on 16/5/18.
//  Copyright © 2016年 王宇腾. All rights reserved.
//

#import "StudentSystem.h"

#define kpath @"/Users/wangyuteng/Desktop/1.plist"
@implementation StudentSystem


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _studentArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(void)countStudent{
    
    NSLog(@"一共有%ld位学生",self.studentArray.count);
}

-(void)printStudentArray{
    
    for (Student *stu in _studentArray) {
        
        [stu printStudent];
    }
    
    NSLog(@"array 打印完毕");
}

-(void)addStudentArray:(Student *)stu{
    
    [_studentArray addObject:stu];
}


-(void)findStudentByStuID{
    
    NSLog(@"请输入你要查找的同学学号:");
    
    int studentID;
    
    scanf("%d",&studentID);
    
    for (Student *stu in _studentArray) {
        
        if (stu.stuID == studentID) {
            
            [stu printStudent];
            
            return;
        }
    }
    
    NSLog(@"未找到学号%d的学生",studentID);
}


-(void)removeStudentArrayByStuID{
    
    NSLog(@"请输入你要删除的同学的学号:");
    
    int studentID;
    
    scanf("%d",&studentID);
    
    for (Student *stu in _studentArray) {
        
        if (stu.stuID == studentID) {
            
            [_studentArray removeObject:stu];
            
            NSLog(@"删除完成");
            
            return;
        }
    }
    
    NSLog(@"找不到学号为%d的学生",studentID);
}


-(void)writeToFile{
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:_studentArray];
    
    [data writeToFile:kpath atomically:YES];
    
}

-(void)readFromFile{
    
    NSMutableData *data = [NSMutableData dataWithContentsOfFile:kpath];
    
    self.studentArray = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
}


-(void)motifyStudent{
    
    NSLog(@"请输入你要修改的同学学号:");
    
    int StudentID;
    
    scanf("%d",&StudentID);
    
    for (Student *stu in _studentArray) {
        
        if (stu.stuID == StudentID) {
            
            NSLog(@"找到学号为%d的学生",StudentID);
            
            char CharName[20];
            
            int intAge,intScore;
            
            scanf("%s %d %d",CharName,&intAge,&intScore);
            
            [stu setName:[NSString stringWithUTF8String:CharName]];
            
            [stu setAge:intAge];
            
            [stu setScore:intScore];
            
            return;
        }
    }
    
    NSLog(@"未找到学号为%d的学生",StudentID);
}

@end
