//
//  ListPrinter.h
//  printDA
//
//  Created by Selena on 16/6/2.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ListPrinter : NSObject

//类方法：

+(void) printArray:(NSArray *)array;
+(void)printDictionary:(NSDictionary *)dict;


//实例方法：
-(void) printArray:(NSArray *)array;
-(void)printDictionary:(NSDictionary *)dict;



@end
