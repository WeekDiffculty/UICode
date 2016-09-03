//
//  ViewController.h
//  注册界面 1.0
//
//  Created by qingyun on 16/6/3.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong,nonatomic) UITextField *text1;
@property (strong,nonatomic) UITextField *text2;
@property (strong,nonatomic) UITextField *text3;
@property (strong,nonatomic) UITextField *text4;
@property (strong,nonatomic) UITextField *text5;
@property (strong,nonatomic) UITextField *text6;
@property (strong,nonatomic) UILabel *la1;
@property (strong,nonatomic) UILabel *la2;
@property (strong,nonatomic) UILabel *la3;
@property (strong,nonatomic) UIButton *btn1;
@property (weak,nonatomic) UIButton *btn2;
@property (weak,nonatomic) UIButton *btn3;

- (IBAction)backGroung:(id)sender;
@end

