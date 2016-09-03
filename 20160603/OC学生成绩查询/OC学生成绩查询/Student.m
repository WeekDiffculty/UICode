//
//  Student.m
//  OC学生成绩查询
//
//  Created by 王宇腾 on 16/5/9.
//  Copyright © 2016年 王宇腾. All rights reserved.
//

#import "Student.h"

static int staticID = 1;

@implementation Student


-(id)init{
    
    if (self = [super init]) {
        
        _stuID = staticID;
        
        staticID ++;
        
        _name = nil;
        
        _age = 0;
        
        _score = 0;
        
    }
    return self;
}

-(void)inputStudent{
    
    NSLog(@"请输入%ld号学生信息",_stuID);
    
    char charName[20];
    
    int intAge,intScore;
    
    scanf("%s %d %d",charName,&intAge,&intScore);
    
    [self setName:[[NSString alloc] initWithUTF8String:charName]];
    
    [self setAge:intAge];
    
    [self setScore:intScore];
}

-(void)printStudent{
    
    NSLog(@"学号为%ld,姓名为%@,年龄%ld,成绩%ld",self.stuID,self.name,self.age,self.score);

}


- (void)encodeWithCoder:(NSCoder *)coder
{
   
    [coder encodeObject:self.name forKey:@"Name"];
    [coder encodeInteger:self.stuID forKey:@"StuID"];
}


- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super init];
    
    if (self) {
        
        self.name = [aDecoder decodeObjectForKey:@"Name"];
        
        self.stuID = [aDecoder decodeIntegerForKey:@"StuID"];
    }
    return self;
    
}

@end
