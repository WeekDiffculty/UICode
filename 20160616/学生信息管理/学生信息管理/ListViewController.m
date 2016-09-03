//
//  ListViewController.m
//  学生信息管理
//
//  Created by qingyun on 16/6/16.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ListViewController.h"

#import "StudentInfo.h"

@interface ListViewController ()
@property (weak, nonatomic) IBOutlet UITextField *searchText;
@property (strong, nonatomic) NSMutableArray *students;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *file = @"/Users/qingyun/Desktop/students.plist";
    _students = [NSMutableArray arrayWithContentsOfFile:file];

    [self loadData:_students];
    
}
- (IBAction)search:(UIButton *)sender {
    
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"username contains %@", _searchText.text];
    
    NSArray *subStudents = [_students filteredArrayUsingPredicate:pred];
    
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[StudentInfo class]]) {
            [view removeFromSuperview];
        }
    }
    
    [self loadData:subStudents];
    
}

- (void)loadData:(NSArray *)array
{
    for (int i=0; i<array.count; i++) {
        StudentInfo *stView = [[StudentInfo alloc] initWithFrame:CGRectMake(0, 100+i*40+i*5, self.view.frame.size.width, 40)];
        stView.backgroundColor = [UIColor grayColor];
        stView.username.text = array[i][@"username"];
        stView.password.text = array[i][@"password"];
        
        [self.view addSubview:stView];
    }
}

@end
