//
//  ViewController.m
//  Demo04_UITableViewCell
//
//  Created by qingyun on 16/7/2.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "QYCell.h"

static NSString *strIdentifier = @"cellStyle1";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDefaultSetting];
}

- (void)loadDefaultSetting {
//    UITableView *tableView = [UITableView new];
//    tableView.frame = self.view.bounds;
//    [self.view addSubview:tableView];
//    tableView.dataSource = self;
    
    // 设置可以多选
//    self.tableView.allowsMultipleSelection = YES;
//
    self.tableView.rowHeight = 44;
    
    // 创建cell的第二种方式: 注册一个类, 就是说当cellForRowAtIndexPath方法中调用-[UITableView dequeueReusableCellWithIdentifier:forIndexPath:]的时候, 如果从队列中取不到cell, 那么就自动创建一个注册好的cell的类型的变量
    // [tableView registerClass:[QYCell class] forCellReuseIdentifier:@"cellStyle1"];
    
    // 创建UITableViewCell的第三种方式:
    // 通过Storyboard拖一个UITableViewController, 选中其中的cell, 在属性面板中填写和代码中一样的identifier
}

NSInteger count = 0;

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 99;
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    /** 从队列中取出可重复利用的cell */
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier forIndexPath:indexPath];
//    // 当从队列中取cell失败的时候
//    
//    // 覆盖(填充)cell上的数据
////    cell.textLabel.text = [NSString stringWithFormat:@"section:%ld; row:%ld", indexPath.section, indexPath.row];
//    
//    NSLog(@"cell:%p", cell);
//    
//    // 返回一个UITableViewCell
//    return cell;
//}

//extern NSString *name; // 外部可以访问到这个变量
//static NSString *strId = @"cellStyle1";// 这个变量只能在本类中访问

// cell重用方式1
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *strId = @"Id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:strId];
    }
    cell.textLabel.text = @"hahahahh";
    cell.imageView.image = [UIImage imageNamed:@""];
    
    // 返回一个UITableViewCell
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s", __func__);
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
