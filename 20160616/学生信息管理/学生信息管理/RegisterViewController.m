//
//  RegisterViewController.m
//  学生信息管理
//
//  Created by qingyun on 16/6/16.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)commit:(UIButton *)sender {
    
    NSDictionary *dict = @{@"username":_username.text, @"password":_password.text};
    
    _callBack(dict);
    
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"提交成功");
        
        // NSLog(@"home >>>>> %@", NSHomeDirectory());
        
        // 提交成功以后，把数据写到plist文件
        NSString *file = @"/Users/qingyun/Desktop/students.plist";
        NSMutableArray *students = [NSMutableArray arrayWithContentsOfFile:file];
        
        if (students == nil) {
            students = [NSMutableArray array];
        }
        [students addObject:dict];
        [students writeToFile:file atomically:YES];
    }];
    
}
@end
