//
//  main.m
//  NSString
//
//  Created by qingyun on 16/6/2.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

//enum Weekday
//{
//    Mon,
//    Tues,
//    Thurs
//} day, day1;

// C
typedef enum {
    Mon,
    Tues,
    Thurs
} Day; // Day 是一个枚举类型

// OC中的枚举可以明确指定枚举值的具体类型
typedef NS_ENUM(int, enumtest1) {
    a,
    b,
    c
};

typedef NS_ENUM(NSInteger, enumtest2) {
    e,
    f,
    g
};

typedef NS_ENUM(NSUInteger, enumtest3) {
    h,
    i,
    j
};


enumtest1 num = a;

int main(int argc, const char * argv[]) {
    
    // 创建字符串对象
    NSString *str = @"下午好";
    NSString *str1 = [NSString stringWithFormat:@"下午好，%@, %@", @"青云的同学们", @"黄永恒"];
    NSString *str2 = [NSString stringWithCString:"，郭彩红" encoding:NSUTF8StringEncoding];
    NSLog(@"str1 >>>>>> %@ %@", str1, str2);
    
    NSLog(@"range >>>>> %@", NSStringFromRange(NSMakeRange(100, 100)));
    
    // 字符串的长度
    NSLog(@"str1'length >>>>>> %ld", str1.length);
    
    // 包含与查找
    NSString *ID = @"430324198510282811";
    if ([ID hasPrefix:@"41"]) { // 前缀
        NSLog(@"河南老乡");
    }
//    ID hasSuffix:<#(nonnull NSString *)#> 后缀
    if ([str1 containsString:@"黄永恒"]) { // 包含
        NSLog(@"你的内容包含敏感词汇");
    }
    NSRange range = [str1 rangeOfString:@"青云"];
    NSLog(@"range >>>> %@", NSStringFromRange(range));
    
    NSString *str4 = @"XYZabcEfg";
    NSLog(@"range >>>> %@", NSStringFromRange([str4 rangeOfString:@"Abc" options:NSCaseInsensitiveSearch]));
    
    // 比较
    NSString *str5 = @"1000";
    NSString *str6 = @"00001000";
    if ([str5 isEqualToString:str6]) {
        NSLog(@"same");
    }
    
    NSComparisonResult result = [str5 compare:str6 options:NSNumericSearch];
    NSLog(@"result >>>> %ld", result);
    
    // 截取
    NSString *birthDay = [ID substringWithRange:NSMakeRange(6, 8)];
    NSLog(@"birth >>>>> %@",birthDay);
//    [ID substringFromIndex:<#(NSUInteger)#>]
//    [ID substringToIndex:<#(NSUInteger)#>]
    
    // 连接
    NSString *str7 = [str1 stringByAppendingString:str2];
    NSLog(@"str7 >>>>>> %@", str7);
    NSString *str8 = [str7 stringByAppendingFormat:@"，%@", @"鲁成龙"];
    NSLog(@"str8 >>>>>> %@", str8);
    
    NSString *a = @"yanpengju";
    NSLog(@"%lu",(unsigned long)a.length);
    
    // NSMutableString
    NSMutableString *mtStr = [NSMutableString stringWithString:@"刘莎"];
    
    // 追加
    [mtStr appendString:@" 呵呵"];
    
    // 删除
    [mtStr deleteCharactersInRange:NSMakeRange(3, 2)];
    
    [mtStr appendFormat:@"%@", @"马助强"];
    
    // 替换
    [mtStr replaceCharactersInRange:NSMakeRange(0, 2) withString:@"赵文豪"];
    
    // 插入
    [mtStr insertString:@"张宏政 " atIndex:4];
    
    // 设置
    [mtStr setString:@"呵呵"];
    mtStr.string = @"哈哈";
    
    NSLog(@"mtstr >>>>> %@", mtStr);
    
    
    return 0;
}