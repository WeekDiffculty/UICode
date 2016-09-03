//
//  NSObject+BubbleSort.m
//  NSArryBubbleSort
//
//  Created by qingyun on 16/6/16.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "NSObject+BubbleSort.h"

@implementation NSObject (BubbleSort)

- (NSArray *)bubbleSort:(NSComparisonResult (^)(id, id))block
{
    NSMutableArray *mutableSelf = [self mutableCopy];
    
    for (int i=0; i<mutableSelf.count; i++) {
        for (int j=0; j<mutableSelf.count; j++) {
            if (block(mutableSelf[i], mutableSelf[j]) < 0) {
                [mutableSelf exchangeObjectAtIndex:i withObjectAtIndex:j];
            }
        }
    }
    
    return (NSArray *)mutableSelf;
}

@end
