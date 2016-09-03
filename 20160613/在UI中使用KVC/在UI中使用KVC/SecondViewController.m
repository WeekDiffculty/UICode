//
//  SecondViewController.m
//  在UI中使用KVC
//
//  Created by qingyun on 16/6/13.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "SecondViewController.h"

#import "Student.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *ID;


@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.username.text = self.stObj.name;
//    self.ID.text = self.stObj.ID;
    
}

@end
