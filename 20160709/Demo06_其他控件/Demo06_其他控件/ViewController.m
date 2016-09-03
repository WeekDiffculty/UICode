//
//  ViewController.m
//  Demo06_其他控件
//
//  Created by qingyun on 16/7/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lcImageWidth;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imv;
    
    UIPanGestureRecognizer *grPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageAction:)];
    
    [imv addGestureRecognizer:grPan];
    
    [self.slider addTarget:self action:@selector(changedValueAction:) forControlEvents:UIControlEventValueChanged];
}

- (void)changedValueAction:(UISlider *)slider {
    self.lcImageWidth.constant = slider.value * 300;
}

- (IBAction)changedValueForSwitch:(UISwitch *)sender {
    NSLog(@"%s", __FUNCTION__);
    if (sender.isOn) {
        [self.indicator startAnimating];
    } else {
        [self.indicator stopAnimating];
    }
}

- (IBAction)tapImageAction:(UITapGestureRecognizer *)sender {
    NSLog(@"%@", sender);
}


@end
