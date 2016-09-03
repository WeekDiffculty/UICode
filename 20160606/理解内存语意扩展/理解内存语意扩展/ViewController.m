//
//  ViewController.m
//  理解内存语意扩展
//
//  Created by qingyun on 16/6/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *someBtn;
@property (weak, nonatomic) UILabel *label;
@property (strong, nonatomic) UITextField *text;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 44)];
    _label = label;
    
    _text = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 200, 44)];
    _text.delegate = self;
    
    [self.view addSubview:_text];
    [self.view addSubview:_label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
