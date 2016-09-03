//
//  RegisterViewController.m
//  注册登录
//
//  Created by qingyun on 16/6/14.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (copy, nonatomic) void (^callBack)(NSString *, NSString *);

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _callBack = ^(NSString *un, NSString *pw){
//        _username.text = un;
//        _password.text = pw;
    };

    // Do any additional setup after loading the view.
}

- (IBAction)register:(UIButton *)sender {
    _callBack(_username.text, _password.text);
        
}

- (void)dealloc
{
    NSLog(@"dealloc");
}


@end
