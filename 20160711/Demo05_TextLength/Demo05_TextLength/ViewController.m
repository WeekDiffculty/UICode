//
//  ViewController.m
//  Demo05_TextLength
//
//  Created by qingyun on 16/7/11.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *strText = @"你们很流弊很流弊, 真的很流弊...你们很流弊很流弊, 真的很流弊...你们很流弊很流弊, 真的很流弊...你们很流弊很流弊, 真的很流弊...你们很流弊很流弊, 真的很流弊...你们很流弊很流弊, 真的很流弊...";
    // 算出来是同一行的宽度, 高度就是一行文本的高度
    //[strText sizeWithFont:[UIFont systemFontOfSize:15]];
    // 让我们指定一个字符串的宽度, 然后根据宽度来计算文本的高度
    //CGSize sizeText = [strText sizeWithFont:[UIFont systemFontOfSize:15] constrainedToSize:CGSizeMake(300, 50)];
    //[strText sizeWithFont:<#(UIFont *)#> forWidth:<#(CGFloat)#> lineBreakMode:<#(NSLineBreakMode)#>];
    //[strText sizeWithFont:<#(UIFont *)#> minFontSize:<#(CGFloat)#> actualFontSize:<#(CGFloat *)#> forWidth:<#(CGFloat)#> lineBreakMode:<#(NSLineBreakMode)#>];
    
    // 单行的
    //[strText sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15]}];
    CGRect rectTest = [strText boundingRectWithSize:CGSizeMake(300, INFINITY) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:15]} context:nil];
    NSLog(@"%@", NSStringFromCGRect(rectTest));
}

@end
