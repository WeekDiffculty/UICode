//
//  ViewController.m
//  Textfield的代理
//
//  Created by qingyun on 16/6/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "TFBoy.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *passWord;
@property (strong, nonatomic) id <UITextFieldDelegate> delegate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
                                    
    //_passWord.delegate = self;
    
    TFBoy *boy = [[TFBoy alloc] init];
    self.delegate = boy;
    _passWord.delegate = self.delegate;
    
}

@end
