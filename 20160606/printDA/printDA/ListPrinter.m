//
//  ListPrinter.m
//  printDA
//
//  Created by Selena on 16/6/2.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "ListPrinter.h"

@implementation ListPrinter




+(void) printArray:(NSArray *)array{

    
        ListPrinter *print = [[ListPrinter alloc]init];
        [print printArray:array];
    


}
+(void)printDictionary:(NSDictionary *)dict{
    
        ListPrinter *print = [[ListPrinter alloc]init];
        [print printDictionary:dict];
    




}


-(void) printArray:(NSArray *)array{
    NSMutableString *mStr = [NSMutableString stringWithFormat: @"\n数组\n"];
    [mStr appendString:@">>>> [\n"];
    
    
    for (NSObject *list  in array) {
      
        if ([list isKindOfClass:[NSArray class]]) {
            NSArray *listt = (NSArray *)list;
            [mStr appendString:@"\t [\n"];

            for (NSObject *str in listt) {
                NSString *str1 = (NSString *)str;
                [mStr appendFormat:@"\t\t \"%@\"\n",str1 ];

            }
            [mStr appendString:@"\t]\n"];

        }else if ([list isKindOfClass:[NSString class] ] ){
        
            [mStr appendFormat:@"\t \"%@\"\n",list ];
        
        }
        
        
    }
    [mStr appendString:@" ]"];
    
    NSLog(@"%@",mStr);
    

}

-(void)printDictionary:(NSDictionary *)dict{

    NSMutableString *mStr = [NSMutableString stringWithFormat: @"\n字典\n"];

    
    
    [mStr appendString:@">>>> {\n"];
    
    for (NSString *key  in dict) {
        
        [mStr appendFormat:@"\t>>>> \"%@\":\"%@\"\n",key,dict[key] ];
        
        
    }
    [mStr appendString:@">>>> }"];
    
       NSLog(@"%@",mStr);
    



}
@end
