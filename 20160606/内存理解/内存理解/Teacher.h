//
//  Teacher.h
//  内存理解
//
//  Created by qingyun on 16/6/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Teacher : NSObject

{
    @protected // 只能父类和子类来访问
    @private // 只能有自己来访问
    @package // 包，框架
    
    @public
    int _salary;
    int _EX;
}

- (void)setEX:(int)EX;
- (int)EX;


@end
