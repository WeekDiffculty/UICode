//
//  main.m
//  NSDate
//
//  Created by qingyun on 16/6/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
            NSDate *now = [NSDate date];
        NSLog(@"now >>>> %@", now);

       /* // NSDate 对象
        NSDate *now = [NSDate date];
        NSLog(@"now >>>> %@", now);
        
        // 通过时间差来创建其他日期对象
        NSTimeInterval interval = 86400;
        NSDate *yesterday = [now dateByAddingTimeInterval:-(interval)];
        NSLog(@"yesterday >>>> %@", yesterday);
        
        NSDate *tomorrow = [NSDate dateWithTimeIntervalSinceNow:interval];
        
        // 比较
        if ([now isEqualToDate:tomorrow]) {
            NSLog(@"same");
        }
        
        NSDate *eaylierDate = [now earlierDate:tomorrow];
        
        NSTimeInterval interval1 = [now timeIntervalSinceDate:yesterday];
        
        // 时间的格式
//        NSArray *allZone = [NSTimeZone knownTimeZoneNames];
//        for (NSString *zoneName in allZone) {
//            if ([zoneName hasPrefix:@"Asia"]) {
//                NSLog(@"name >>>> %@", zoneName);
//            }
//        }
        
        // 格式化时间的工具类*/
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
        formatter.dateStyle = NSDateFormatterShortStyle;
        formatter.timeStyle = NSDateFormatterLongStyle;
        NSString *formatString = @"MM月dd日yy年 HH:mm:ss";
        formatter.dateFormat = formatString;
        
        NSString *timestr = [formatter stringFromDate:now];
        
        NSLog(@"now >>>> %@", timestr);
        
        
    }
    return 0;
}
