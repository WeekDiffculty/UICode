//
//  ViewController.m
//  Demo06_NSAttributedString
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
    
    //UILabel *lblTest = [UILabel new];
    //lblTest.numberOfLines = 0;
    //lblTest.frame = CGRectMake(50, 100, 300, 500);
    //lblTest.backgroundColor = [UIColor lightGrayColor];
    //[self.view addSubview:lblTest];
    //
    UITextView *txvTest = [UITextView new];
    txvTest.frame = CGRectMake(50, 100, 300, 500);
    txvTest.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:txvTest];
    //
    //NSAttributedString;
    //NSMutableAttributedString;
    
    NSTextAttachment *attach = [[NSTextAttachment alloc] init];
    attach.image = [UIImage imageNamed:@"008"];
    attach.bounds = CGRectMake(0, -3, 18, 18);
    NSAttributedString *strAttr = [NSAttributedString attributedStringWithAttachment:attach];
    
    // 这个东西用在图文混排
    NSString *strOrigin = @"流弊的人总司很利弊流弊的人总司很利弊流弊的人总司很利弊流弊的人总司很利弊流弊的人总司很利弊";
    NSMutableAttributedString *strMAttr = [[NSMutableAttributedString alloc] initWithString:strOrigin];
    [strMAttr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:30] range:NSMakeRange(0, 5)];
    [strMAttr addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(5, 5)];
    [strMAttr addAttribute:NSBackgroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(10, 5)];
    [strMAttr addAttribute:NSStrikethroughStyleAttributeName value:@(1) range:NSMakeRange(15, 5)];
    [strMAttr addAttribute:NSStrikethroughColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(15, 5)];
    
    [strMAttr insertAttributedString:strAttr atIndex:20];
    
    
    txvTest.attributedText = strMAttr;
}

@end
