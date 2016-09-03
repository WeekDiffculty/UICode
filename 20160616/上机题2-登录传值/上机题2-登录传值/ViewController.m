//
//  ViewController.m
//  上机题2-登录传值
//
//  Created by qingyun on 16/6/16.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation ViewController
- (IBAction)loginAction:(id)sender {
//    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    SecondViewController *secondVC = []
    
}
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([_userName.text isEqualToString:@""]||
        [_password.text isEqualToString:@""]) {
        UIAlertController *alertCtr = [UIAlertController alertControllerWithTitle:@"友情提示" message:@"用户名或密码不能为空" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
        [alertCtr addAction:action];
        [self presentViewController:alertCtr animated:YES completion:nil];
        return NO;
    }
    return YES;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *secondVC = segue.destinationViewController;
    [secondVC setValue:_userName.text forKey:@"userName"];
    void (^callBack)(NSString *) = ^(NSString *userNameStr){
        _userName.text = userNameStr;
    };
    [secondVC setValue:callBack forKey:@"callBack"];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
}


@end
