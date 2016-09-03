//
//  main.m
//  OC学生成绩查询
//
//  Created by 王宇腾 on 16/5/9.
//  Copyright © 2016年 王宇腾. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
#import "StudentSystem.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
      
        NSLog(@"欢迎进入OC学生成绩管理系统");
        
        StudentSystem *class = [[StudentSystem alloc] init];
        
        while (YES) {
            
            NSLog(@"请进行功能选择:");
            
            NSLog(@"1:增加         2:打印");
            NSLog(@"3:删除         4:查找");
            NSLog(@"5:写入         6:读出");
            NSLog(@"7:统计         8:排序");
            NSLog(@"9:修改         0:退出");
            
            int c;
            
            scanf("%d",&c);
            
            switch (c) {
                case 1:
                {
                    Student *stuTemp = [[Student alloc] init];
                    [stuTemp inputStudent];
                    [class addStudentArray:stuTemp];
                    break;
                }
                    
                case 2:
                {
                    [class printStudentArray];
                    break;
                }
                    
                case 3:{
                    
                    [class removeStudentArrayByStuID];
                    
                    break;
                }
                case 4:{
                    
                    [class findStudentByStuID];
                    
                    break;
                }
                case 5:{
                    
                    [class writeToFile];
                    break;
                }
                case 6:{
                    
                    [class readFromFile];
                    break;
                }
                case 7:{
                    
                    [class countStudent];
                    break;
                }
                case 8:{
                    
                  //  [class sortStudentArray];
                    break;
                }
                case 9:{
                    
                    [class motifyStudent];
                    break;
                }
                    
                default:
                    break;
            }
        }
        
        
    }
    return 0;
}
