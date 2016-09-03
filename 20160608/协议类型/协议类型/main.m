//
//  main.m
//  协议类型
//
//  Created by qingyun on 16/6/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Baby.h"
#import "Parent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Baby *bb = [[Baby alloc] init];
        
        Parent *papa = [[Parent alloc] init];
        
        bb.delegate = papa;
        [bb.delegate feed];
        
        bb.proDelegate = papa;
        [bb.proDelegate doPeople];
        
        
        
    }
    return 0;
}
