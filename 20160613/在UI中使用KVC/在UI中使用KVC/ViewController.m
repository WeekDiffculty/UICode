//
//  ViewController.m
//  在UI中使用KVC
//
//  Created by qingyun on 16/6/13.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

#import "Student.h"

@interface ViewController ()

@property (nonatomic, strong) Student * stObj; // model 数据模型

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // NSBundle
    NSBundle *bundle = [NSBundle mainBundle];
    // 获取文件路径
    NSString *filePath = [bundle pathForResource:@"student" ofType:@"plist"];
    // 读出数组
    NSArray *students = [NSArray arrayWithContentsOfFile:filePath];
    // 读出第一个学生信息变成对象（字典转模型）
    _stObj = [[Student alloc] init];
    [_stObj setValuesForKeysWithDictionary:students[0]]; //KVC
    
}

//
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    return YES;
}

// UI中讲解 Segue UIStoryboard
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"????");
    NSLog(@"%@", segue.sourceViewController);
    NSLog(@"%@", segue.destinationViewController);
    
#if 0
    SecondViewController *secondVC = segue.destinationViewController;
    secondVC.stObj = self.stObj;
#endif
    
    // KVC
    UIViewController *secondVC = segue.destinationViewController;
    [secondVC setValue:self.stObj forKey:@"stObj"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
