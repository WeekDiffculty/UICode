//
//  ViewController.m
//  Demo01_UIDatePicker
//
//  Created by qingyun on 16/7/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <NSObject>

@property (nonatomic, strong) UIDatePicker *datePicker;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDefaultSetting];
}

- (void)loadDefaultSetting {
    // UIDatePicker有自己默认的尺寸, 位置如果不设就是CGPointZero.
    UIDatePicker *datePicker = [UIDatePicker new];
    [self.view addSubview:datePicker];
    self.datePicker = datePicker;
    
    // 日期选择的模式: 时间, 日期, 日期和时间, 倒计时
    datePicker.datePickerMode = UIDatePickerModeDate;
    
    //@"zh_cn" @"us_en"
    NSLocale *locale = [NSLocale localeWithLocaleIdentifier:@"zh_cn"];
    [datePicker setLocale:locale];
    
    // 设置最大显示的日期
    //datePicker.maximumDate = [NSDate dateWithTimeIntervalSinceNow:345644656];
    // 设置最小显示的日期
    //datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:-456788];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%@", self.datePicker.date);
    [self.datePicker setDate:[NSDate dateWithTimeIntervalSinceNow:-456788456] animated:YES];
}

@end
