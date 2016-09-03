//
//  main.m
//  复杂格式的字典和数组
//
//  Created by qingyun on 16/6/2.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    NSDictionary *china = @{@"name":@"中国",
                            @"provinces":@[
                                    @{
                                        @"name":@"河南",
                                        @"cities":@[@{@"name":@"郑州"}]
                                    }
                            ]};

    
    NSMutableDictionary *mtDict = [NSMutableDictionary dictionaryWithDictionary:china];
    mtDict[@"name"] = @"中华人民共和国";
    
    NSLog(@"china >>>>> %@", mtDict);
    
    NSLog(@"province >>>>> %@", mtDict[@"provinces"][0][@"name"]);
    
    // 直接写出来的字典和数组都是不可变的，把一个不可变的数组或者字典转成一个可变的对象时，只有最外层的可变操作发生了改变
    // mtDict[@"provinces"][0][@"name"] = @"河北";
    
    mtDict[@"thing"] = [NSMutableArray arrayWithObjects:@"长江",@"黄河",@"黄山", nil];
    
    mtDict[@"thing"][2] = @"淮河";
    
    return 0;
}
