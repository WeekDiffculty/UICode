//
//  main.m
//  类方法
//
//  Created by qingyun on 16/5/30.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Student.h"

int main(int argc, const char * argv[]) {
    
    NSString *name = @"郭彩红";
    NSLog(@"name >>>> %@", name);
    
    Student *st = [Student studentWithSid:10002];
    st.name = @"黄永恒";
    
    NSLog(@"sid >>>> %ld", st.sid);
    NSLog(@"name >>>> %@", st.name);
    
    return 0;
}
