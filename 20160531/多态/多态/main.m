//
//  main.m
//  多态
//
//  Created by qingyun on 16/5/31.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Person.h"
#import "Student.h"
#import "Teacher.h"

void play(Person *);

int main(int argc, const char * argv[]) {
    
    Person *ps = [Person new];
    Student *st = [Student new];
    Teacher *tc = [Teacher new];
    
    [ps play];
    
    play(ps);
    play(st);
    play(tc);
    
    return 0;
}

void play(Person *p)
{
    [p play];
}
