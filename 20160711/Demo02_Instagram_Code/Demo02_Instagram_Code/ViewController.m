//
//  ViewController.m
//  Demo02_Instagram_Code
//
//  Created by qingyun on 16/7/11.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "Masonry/Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDefaultSetting];
}

/** 加载默认设置和UI */
- (void)loadDefaultSetting {
    UIView *viewHead = [UIView new];
    viewHead.backgroundColor = [UIColor redColor];
    [self.view addSubview:viewHead];
    
    [viewHead mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@(10));
        make.top.mas_equalTo(20);
        make.width.and.height.equalTo(@(50));
    }];
    
    UILabel *lblTitle = [UILabel new];
    lblTitle.text = @"Dorayo";
    [self.view addSubview:lblTitle];
    [lblTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(viewHead.mas_trailing).offset(10);
        make.centerY.equalTo(viewHead);
    }];
    
    UILabel *lblTime = [UILabel new];
    lblTime.text = @"7小时";
    [self.view addSubview:lblTime];
    [lblTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.view).offset(-10);
        make.centerY.equalTo(lblTitle);
    }];
    
    UIView *viewIndicator = [UIView new];
    viewIndicator.backgroundColor = [UIColor greenColor];
    [self.view addSubview:viewIndicator];
    [viewIndicator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(lblTime.mas_leading).offset(-10);
        make.centerY.equalTo(lblTime);
        make.width.and.height.mas_equalTo(15);
    }];
    
    UIView *viewPurple = [UIView new];
    viewPurple.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:viewPurple];
    [viewPurple mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(viewHead.mas_bottom).offset(10);
        make.leading.and.trailing.equalTo(self.view);
        make.height.equalTo(viewPurple.mas_width);
    }];
    
    UIView *viewOrange = [UIView new];
    viewOrange.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:viewOrange];
    [viewOrange mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(viewHead);
        make.top.equalTo(viewPurple.mas_bottom).offset(10);
        make.width.and.height.mas_equalTo(15);
    }];
    
    UILabel *lblZan = [UILabel new];
    [lblZan setText:@"18次赞"];
    lblZan.textColor = [UIColor blueColor];
    [self.view addSubview:lblZan];
    [lblZan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(viewOrange.mas_trailing).offset(10);
        make.centerY.equalTo(viewOrange);
    }];
    
    UIView *viewGray = [UIView new];
    viewGray.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:viewGray];
    [viewGray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(viewOrange);
        make.top.equalTo(viewOrange.mas_bottom).offset(10);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(20);
    }];
    
    UIView *viewCyan = [UIView new];
    viewCyan.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:viewCyan];
    [viewCyan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(viewGray.mas_trailing).offset(10);
        make.top.and.bottom.equalTo(viewGray);
        make.width.equalTo(viewGray).multipliedBy(2);
    }];
    
    UIView *viewMagenta = [UIView new];
    viewMagenta.backgroundColor = [UIColor magentaColor];
    [self.view addSubview:viewMagenta];
    [viewMagenta mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.view).offset(-10);
        make.top.bottom.equalTo(viewCyan);
        make.width.equalTo(viewGray);
    }];
}

@end
