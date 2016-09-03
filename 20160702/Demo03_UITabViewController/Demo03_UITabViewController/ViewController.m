//
//  ViewController.m
//  Demo03_UITabViewController
//
//  Created by qingyun on 16/7/2.
//  Copyright © 2016年 qingyun. All rights reserved.
//

/*!
 * UITableViewController帮我们做几件事情:
 自动帮我设置了代理, 数据源, 我么可以自己直接在这个继承自UITableViewController中实现相应的数据源和代理方法
 */

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 不用设置数据源, 也不用设置代理, 直接实现相应的方法
    
    self.tableView;
}

#pragma mark - 🔌 Delegate Methods
#pragma mark UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *strId = @"cellStyle1";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strId];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Text_Row:%zi", indexPath.row];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSLog(@"%s~%@", __FUNCTION__, indexPath);
    
}

@end
