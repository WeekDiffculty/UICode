//
//  ViewController.m
//  Demo04_Nib
//
//  Created by qingyun on 16/7/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lcImageWidth;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //_textView.scrollEnabled
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.label.text = [NSString stringWithFormat:@"流弊的主流弊的主流弊的主流弊的主流弊的主流弊的主%@", self.label.text];
    
    self.lcImageWidth.constant += 10;
    [UIView animateWithDuration:1 animations:^{
        [self.view layoutIfNeeded];
    }];
}

@end
