//
//  main.m
//  NSPredicate
//
//  Created by qingyun on 16/6/13.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSArray *students = [NSArray arrayWithContentsOfFile:@"/Volumes/qingyun/Desktop/Code1604/Code/UI/20160613/NSPredicate/NSPredicate/student.plist"];
        
        // 1.创建谓词对象
        // 条件运算 > < >= <= == !=
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"self.age <= 20"];
        
        // 2.使用谓词过滤数组
        NSArray *subSts = [students filteredArrayUsingPredicate:pred];
        NSLog(@"sbuSts >>> %@", subSts);
        
        // 逻辑运算 &&(AND) ||(OR)
        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SEL                                      F.age <= 20 AND SELF.money >= 500"];
        NSLog(@"sbuSts >>> %@", [students filteredArrayUsingPredicate:pred1]);
        
        // 3.使用谓词来判断某个集合是否满足某一条件
        // 向谓词对象发消息时用来验证集合对象是否满足某个条件，这是要指定 关键词 ALL 或者 ANY 来判断是否所有元素或者个别元素需要 满足此条件
        NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"ANY SELF.age <= 20 AND ALL  SELF.money >= 1000"];
        if ([pred2 evaluateWithObject:students]) {
            NSLog(@"YES");
        }
    
        // 4.字符串结合谓词
        // LIKE CONTAINS BEGINSWITH ENDSWITH
        NSString *ID = @"410324198510282811";
        NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF BEGINSWITH '41'"];
        if ([pred3 evaluateWithObject:ID]) {
            NSLog(@"YES");
        }
        // 通配符 * 表示任意多个字符 ？表示任意 1个字符
        NSPredicate *pred4 = [NSPredicate predicateWithFormat:@"SELF LIKE '?????1985????????'"];
        if ([pred4 evaluateWithObject:ID]) {
            NSLog(@"YES");
        }
        // [cd] c表示不区分大小写 d表示不区分重音符号
        NSPredicate *pred5 = [NSPredicate predicateWithFormat:@"SELF.name BEGINSWITH [c] 'zh'"];
        NSLog(@"subSts >>> %@", [students filteredArrayUsingPredicate:pred5]);
        //
        NSPredicate *pred6 = [NSPredicate predicateWithFormat:@"SELF.name BEGINSWITH [cd] 'A'"];
        NSLog(@"subSts >>> %@", [students filteredArrayUsingPredicate:pred6]);
        
        // IN (在指定的几个条件中筛选) BETWEEN （在指定的起始范围内筛选）
        NSLog(@"subSts >>>> %@",  [students filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF.money IN {500, 800, 2000}"]]);
        
        NSLog(@"subSts >>>> %@",  [students filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF.money BETWEEN {500, 2000}"]]);
        
        // 5.谓词模板
        NSPredicate *pred7 = [NSPredicate predicateWithFormat:@"ANY SELF.age <= %@ AND ANY  SELF.money >= %d",@20, 200];
        if ([pred7 evaluateWithObject:students]) {
            NSLog(@"YES");
        }
        // 如果键名需要被格式化，就要使用%K
        NSPredicate *pred8 = [NSPredicate predicateWithFormat:@"ANY %K <= %@ AND ANY  SELF.money >= %d", @"age", @20, 200];
        if ([pred8 evaluateWithObject:students]) {
            NSLog(@"YES");
        }
        // 先创建模板，然后使用模板根据条件创建对应的谓词
        // 当谓词中的条件都不确定而且以参数传入的话，往往会选择以字典的形式传参，这时可以选择谓词模板来快速创建谓词对象
        NSPredicate *predTheme = [NSPredicate predicateWithFormat:@"age >= $age AND money <= $money AND name CONTAINS [c] $name"];
        NSDictionary *dict = @{@"age":@15, @"money":@2000, @"name":@"zh"};
        NSPredicate *pred9 = [predTheme predicateWithSubstitutionVariables:dict];
        NSLog(@"subSts >>>> %@",  [students filteredArrayUsingPredicate:pred9]);
        
        // 6.谓词与正则表达式
        NSString *regularExpression = @"1[3578][0-9]{9}";
        NSString *phoneNO = @"23526871003";
        
        NSPredicate *pred10 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regularExpression];
        
        if ([pred10 evaluateWithObject:phoneNO]) {
            NSLog(@"这是一个电话号码");
        }
        
        NSString *emailExpession = @"[a-zA-Z0-9_\\%]+@[a-zA-Z0-9]+\\.[a-z]{2,4}";
        NSString *email = @"zhq_inp%ei@163.com";
        
        NSPredicate *pred11 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailExpession];
        if ([pred11 evaluateWithObject:email]) {
            NSLog(@"这是一个邮箱");
        }
        // 使用正则表达是来校验或者匹配或者比较 NSString
        NSString *text = @"fwaefawefwafewaef,zhqinpei@163.com,安慰奇偶发文件佛挖掘佛安慰 wafje,260208611@qq.com";
        
        NSRange range = [text rangeOfString:emailExpession options:NSRegularExpressionSearch];
        NSLog(@"range >>>> %@", NSStringFromRange(range));
        
//        NSRegularExpression
    }
    return 0;
}
