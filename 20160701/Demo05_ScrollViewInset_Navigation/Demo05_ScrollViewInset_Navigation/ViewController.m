//
//  ViewController.m
//  Demo05_ScrollViewInset_Navigation
//
//  Created by qingyun on 16/7/1.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"mv"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [self.scrollView addSubview:imageView];
    
    [self.scrollView setContentSize:image.size];
    
    [self.scrollView setBackgroundColor:[UIColor orangeColor]];
    
    //NSLog(@"%@", NSStringFromUIEdgeInsets(self.scrollView.contentInset));
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

@end
