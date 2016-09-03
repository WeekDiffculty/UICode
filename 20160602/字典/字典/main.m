//
//  main.m
//  字典
//
//  Created by qingyun on 16/6/2.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    // 字典（无序列表，散列表），通过键（key）来访问对应的对象（obj/value）
    NSDictionary *dict = @{@"name":@"琚洋洋",@"age":@18,@"home":@"河南"};
    NSDictionary *dict1 = [NSDictionary dictionaryWithObjectsAndKeys:@"琚洋洋",@"name",@18,@"age", nil];
    
    // 访问，所有的 key 都是以字符串形式来操作的
    NSLog(@"dict[@\"name\"] >>>>> %@", dict[@"name"]);
    
    // forin
    for (NSString *key in dict) {
        NSLog(@"dict[%@] >>>>> %@", key, dict[key]);
    }
    
    // NSMutableDictionary
    // 可变操作自己实验
    NSMutableDictionary *mtDict = [NSMutableDictionary dictionaryWithDictionary:dict];
    
    mtDict[@"name"] = @"张永帅"; // arr[0] = obj;
    
//    mtDict addEntriesFromDictionary:<#(nonnull NSDictionary *)#>
    
    
    // KVC ===== key value coding
    
    return 0;
}
