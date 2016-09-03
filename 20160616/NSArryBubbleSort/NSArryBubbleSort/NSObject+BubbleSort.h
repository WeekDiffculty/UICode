//
//  NSObject+BubbleSort.h
//  NSArryBubbleSort
//
//  Created by qingyun on 16/6/16.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (BubbleSort)

- (NSArray *)bubbleSort:(NSComparisonResult (^)(id, id))block;

@end
