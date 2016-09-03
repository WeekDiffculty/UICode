//
//  ViewController.m
//  学生信息管理
//
//  Created by qingyun on 16/6/16.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (![segue.identifier isEqualToString:@"login"]) {
        //KVC
        UIViewController *secondVC = segue.destinationViewController;
        
        [secondVC setValue:^(NSDictionary *dict) {
            //[self setValuesForKeysWithDictionary:dict];
    #if 0
            for (NSString *key in dict) {
                NSString *path = [NSString stringWithFormat:@"%@.text", key];
                [self setValue:dict[key] forKeyPath:path];
            }
    #endif
            _username.text = dict[@"username"];
            _password.text = dict[@"password"];
        } forKey:@"callBack"];
    }
}

// 在segue展开之前判断用户名密码是否正确
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([identifier isEqualToString:@" "]) {
        NSString *file = @"/Users/qingyun/Desktop/students.plist";
        NSMutableArray *students = [NSMutableArray arrayWithContentsOfFile:file];
        
        BOOL isValid = NO;
        for (NSDictionary *dict in students) {
            if ([_username.text isEqualToString:dict[@"username"]] && [_password.text isEqualToString:dict[@"password"]]) {
                isValid = YES;
                break;
            }
        }
        return isValid;
    } else {
        return YES;
    }
}

@end
