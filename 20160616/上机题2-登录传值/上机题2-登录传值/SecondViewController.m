//
//  SecondViewController.m
//  上机题2-登录传值
//
//  Created by qingyun on 16/6/16.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (nonatomic, copy)NSString *userName;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *resetUserName;
@property (nonatomic, copy) void (^callBack)(NSString *);
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _userNameLabel.text = _userName;
    // Do any additional setup after loading the view.
}
- (IBAction)sureAction:(id)sender {
    _callBack(_resetUserName.text);
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
