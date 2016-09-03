//
//  ViewController.m
//  Demo02_UITableView的使用
//
//  Created by qingyun on 16/7/2.
//  Copyright © 2016年 qingyun. All rights reserved.
//

/*!
 * UITableView使用
 1, 创建UITableView, 添加到父视图上
 2, 数据数据源, 代理
 3, 遵守协议, 实现协议方法
 */

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建一个UITableView
    // style: 默认情况下是 plain 的, 也就是说不用设置的话, 就是plain样式, 可以根据自己的喜好或者项目的需求更新
//    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    UITableView *tableView = [UITableView new];// 默认plain样式
    tableView.frame = self.view.bounds;
    [self.view addSubview:tableView];
    
    // 设置tableView的DataSource
    // DataSource 就是给显示数据的view提供数据的对象
    tableView.dataSource = self;
    // 设置代理
    tableView.delegate = self;
    
    // 只可以在初始化的时候设置, 后面只能读取
    // tableView.style = UITableViewStyleGrouped;
    
    // 背景图片的优先级高于背景色的优先级
    UIImageView *imvBg = [UIImageView new];
    imvBg.image = [UIImage imageNamed:@"bg.jpg"];
    imvBg.frame = self.view.bounds;
    tableView.backgroundView = imvBg;
    
    //tableView.backgroundColor = [UIColor orangeColor];
    
    // TableView的header和fooer的宽度是系统自定的, 我们不用设置, 只需要设置高度即可
    // 设置TableView的headerView
    UIView *viewTableViewHeader = [UIView new];
    viewTableViewHeader.bounds = CGRectMake(0, 0, 0, 40);
    viewTableViewHeader.backgroundColor = [UIColor cyanColor];
    tableView.tableHeaderView = viewTableViewHeader;
    
    // 设置TableView的headerView
    UIView *viewTableViewFooter = [UIView new];
    viewTableViewFooter.bounds = CGRectMake(0, 0, 0, 40);
    viewTableViewFooter.backgroundColor = [UIColor cyanColor];
    tableView.tableFooterView = viewTableViewFooter;
    
    // 设置section的头尾的高度
    tableView.sectionHeaderHeight = 30;
    tableView.sectionFooterHeight = 30;
    
    // 关于优先级的问题, 代理方法的优先级始终高于TableView属性设置的优先级
    
    // 行高(cell的高度),
    tableView.rowHeight = 44;
    
    // 分割线的设置
    // 设置分割线的颜色
    tableView.separatorColor = [UIColor orangeColor];
    // 设置分割线的左右间距
    tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20);
    // 隐藏分割线
    //tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - 🔌 Delegate Methods
/** tableView中有几个Section */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
/** 某个section中有几个cell */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arc4random_uniform(7) + 3;
}
/** 每个row显示的内容 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [UITableViewCell new];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld我来了%ld", indexPath.section, indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    [cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
    return cell;
}
/** 某个指定的Section的header的标题 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"啦啦啦";
}
/** 某个指定的Section的footer的标题 */
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return @"呼啦呼啦";
}
/** 设置指定Section header上显示的view, 有了view之后, title就不起作用, 就是一个优先级的问题 */
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UISwitch new];
}
/** 设置指定Section footer上显示的view */
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.frame = CGRectMake(0, 0, 0, 100);
    [view addSubview:[UIButton buttonWithType:UIButtonTypeInfoLight]];
    view.backgroundColor = [UIColor orangeColor];
    return view;
}
/** 设置行高 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}
/** Section中header的高度 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}
/** Section中footer的高度 */
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 30;
}

#pragma mark UITableViewDelegate
/** 选中了某个cell(cell是显示的内容, 继承自UIView, row: 行号) */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@", indexPath);
}
/** 取消选中上一个选中的cell */
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"deselect-%@", indexPath);
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

@end
