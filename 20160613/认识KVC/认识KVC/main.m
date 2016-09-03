//
//  main.m
//  认识KVC
//
//  Created by qingyun on 16/6/13.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // KVC & Dictionary
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [dict setObject:@"刘欢" forKey:@"name"];
        NSLog(@"name >>>>> %@", [dict objectForKey:@"name"]);
        [dict setValue:@"男" forKey:@"sex"]; //KVC
        NSLog(@"name >>>>> %@", [dict valueForKey:@"name"]); //KVC
        
        Person *xiaojian = [[Person alloc] init];
        // KVC 是一种间接访问属性值（成员变量值）的方式，最终还是通过成员变量来获取到对应的值
        // 相对属性和成员变量而言，这种方式的效率要低很多，所以不能滥用KVC
        [xiaojian setValue:@"晓建" forKey:@"name"]; //KVC
        NSLog(@"name >>>> %@", [xiaojian valueForKey:@"name"]); //KVC
        
//        NSKeyValueCoding
        
        Person *liuhuan = [[Person alloc] init];
//        liuhuan.name = dict[@"name"];
//        liuhuan.sex = dict[@"sex"];
        // KVC的特殊技能1：
        // 通过KVC可以做到 字典转模型，如果字典的键名跟对象的属性名字是一致，就可以直接通过KVC批量搞定
        for (NSString *key in dict) {
            [liuhuan setValue:dict[key] forKey:key];
        }
        //[liuhuan setValuesForKeysWithDictionary:dict];
        NSLog(@"name >>>> %@", [liuhuan valueForKey:@"name"]); //KVC
        
        // KVC的特殊技能2：
        // 可以穿透只读和私有权限
        //liuhuan.ID = @"410xxxxxxxxx";
        [liuhuan setValue:@"410xxxxxxxx" forKey:@"ID"];
        NSLog(@"ID >>>> %@", [liuhuan valueForKey:@"ID"]); //KVC
        // KVC可以自动拆线 value对象
        [liuhuan setValue:@10000 forKey:@"money"];
        NSLog(@"money >>>> %@", [liuhuan valueForKey:@"money"]); //KVC
        
        // KVC的特殊技能3:
        // 键路径
        liuhuan.friend = xiaojian;
        //liuhuan.friend.name = @"赵晓建";
        [liuhuan setValue:@"赵晓健" forKeyPath:@"friend.name"];
        NSLog(@"friend'name >>>> %@", [liuhuan valueForKeyPath:@"friend.name"]); //KVC
        // 在使用键路径的时候，要保证路径中间的键对象都得存在
        [xiaojian setValue:@"刘欢" forKeyPath:@"friend.name"];
        NSLog(@"friend'name >>>> %@", [xiaojian valueForKeyPath:@"friend.name"]); //KVC
        
        // KVC的特殊技能4:
        // 批量处理
        Person *hongli = [[Person alloc] init];
        [hongli setValuesForKeysWithDictionary:@{@"name":@"陈宏利", @"age":@20, @"money":@100}];
        NSLog(@"name >>>> %@", [hongli valueForKey:@"name"]);
        
        NSDictionary *hlDict = [hongli dictionaryWithValuesForKeys:@[@"age",@"money"]];
        NSLog(@"hlDict >>>> %@", hlDict);
        
        // KVC的特殊技能5:
        // 整体操作：如果键是一个数组，那个在set的时候键路径中下一级的键名是数组中的所有元素进行操作
        hongli.friends = [NSMutableArray array];
        [hongli.friends addObjectsFromArray:@[liuhuan, xiaojian]];
        
        [hongli setValue:@1111 forKeyPath:@"friends.money"];
        NSLog(@"liuhuan'money >>>> %@", [liuhuan valueForKey:@"money"]);
        
        // KVC的特殊技能6:
        // 快速运算:系统提供了一些默认的键路径用来进行计算
        //NSArray *students = @[xiaojian,liuhuan,hongli];
        NSDictionary *info = @{@"students":@[xiaojian,liuhuan,hongli]};
            // @sum
        NSLog(@"all moeny >>>>> %@", [info valueForKeyPath:@"students.@sum.money"]);
        // @avg @max @min @count
        // @distinctUnionsOfObject
        
        
        // KVC使用注意事项：
        // 1.效率的问题
        // 2.使用键路径时要保证路径中的中间对象得存在
        // 3.键名字失效或者错误的情况
        // 当KEY错误的时候会触犯 setValue:forUndefinedKey:
        [liuhuan setValue:@"欢欢" forKey:@"userName"];
        NSLog(@"liuhuan'name >>>> %@", [liuhuan valueForKey:@"name"]);
        
        // 4.如果需要设置的键的值是数值而不是对象的话， 传入 0 代表传入了 nil 对象，并不是 数字 0
        [liuhuan setValue:0 forKey:@"money"];
        
        
        
        
        
        
    }
    return 0;
}
