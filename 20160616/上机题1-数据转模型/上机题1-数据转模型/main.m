//
//  main.m
//  上机题1-数据转模型
//
//  Created by qingyun on 16/6/16.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *studentsArr = @[@{@"name":@"xiaowang",
                                   @"sex":@"男",
                                   @"age":@16,
                                   @"stuID":@"201601",
                                   },
                                 @{@"name":@"小明",
                                   @"sex":@"男",
                                   @"age":@22,
                                   @"stuID":@"201602",
                                   },
                                 @{@"name":@"小红",
                                   @"sex":@"女",
                                   @"age":@18,
                                   @"stuID":@"201603",
                                   },
                                 @{@"name":@"小敏",
                                   @"sex":@"女",
                                   @"age":@19,
                                   @"stuID":@"201604",
                                   }];
        NSMutableArray *muarr = [NSMutableArray array];
        for (NSDictionary *dict in studentsArr) {
            Student *student = [Student studentWithDictionary:dict];
//            NSLog(@"%@",student.description);
//            if ([student.stuID isEqualToString:@"201603"]) {
//                NSLog(@"%@",student.description);
//            }
            [muarr addObject:student];
        }
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self.stuID == %@",@"201602"];
        NSArray *filterArr = [muarr filteredArrayUsingPredicate:predicate];
        NSLog(@"%@",[filterArr[0] description]);
        
        
        
    }
    return 0;
}
