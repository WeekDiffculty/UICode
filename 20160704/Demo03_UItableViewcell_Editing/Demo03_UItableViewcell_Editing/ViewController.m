//
//  ViewController.m
//  Demo03_UItableViewcell_Editing
//
//  Created by qingyun on 16/7/4.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *arrMData;

@end

@implementation ViewController

- (NSMutableArray *)arrMData {
    if (_arrMData == nil) {
        NSUInteger count = 100;
        _arrMData = [NSMutableArray arrayWithCapacity:count];
        for (NSUInteger index = 0; index < count; index ++) {
            NSString *string = [NSString stringWithFormat:@"row:%ld", index];
            [_arrMData addObject:string];
        }
    }
    return _arrMData;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadUI];
}

- (void)loadUI {
    UITableView *tableView = [UITableView new];
    tableView.frame = self.view.bounds;
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    self.tableView = tableView;
    
    // 添加一个编辑按钮
    UIButton *btnEdit = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnEdit setTitle:@"编辑" forState:UIControlStateNormal];
    [btnEdit setTitle:@"完成" forState:UIControlStateSelected];
    [btnEdit setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnEdit setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    [btnEdit addTarget:self action:@selector(editAction:) forControlEvents:UIControlEventTouchUpInside];
    //[btnEdit setBounds:CGRectMake(0, 0, 135, 35)];
    [btnEdit sizeToFit];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnEdit];
}

- (void)editAction:(UIButton *)button {
    //NSLog(@"%@", button);
    //NSString *strTitle = [button titleForState:UIControlStateNormal];
    //if ([strTitle isEqualToString:@"编辑"]) {
    //    [button setTitle:@"完成" forState:UIControlStateNormal];
    //} else {
    //    [button setTitle:@"编辑" forState:UIControlStateNormal];
    //}
    button.selected = !button.isSelected;
    if (button.isSelected == YES) {
        [self.tableView setEditing:YES animated:YES];
    } else {
        [self.tableView setEditing:NO animated:YES];
    }
    NSLog(@"%@", self.arrMData);
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrMData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *strId = @"cellStyle1";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strId];
    }
    
    cell.textLabel.text = self.arrMData[indexPath.row];
    return cell;
}

/** 是否允许当前的TableView进入编辑状态, YES代表允许, 否则不允许 */
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
/** 代理的方法, 设置编辑的模式, 是删除还是插入, 有默认值:UITableViewCellEditingStyleDelete */
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return indexPath.row % 2 == 0 ? UITableViewCellEditingStyleInsert : UITableViewCellEditingStyleDelete;
}

/** 在编辑状态为YES的情况下, 当用户点击了加号或者点击减号后弹出的Delete文字后调用 */
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    // 删除和插入一定要①跟新数据源中的indexPath对应的数据②更新界面上indePath对应的cell
    if (editingStyle == UITableViewCellEditingStyleDelete) { // 删除cell的情况
        NSLog(@"%s", __FUNCTION__);
        
        // 1,删除数组中indexPath.row对应的数据(数据源)
        [self.arrMData removeObjectAtIndex:indexPath.row];
        [self.arrMData removeObjectAtIndex:indexPath.row + 1];
        
        // 2,删除indexPaths对应位置的cell(界面上)
        NSIndexPath *idxPath = [NSIndexPath indexPathForRow:indexPath.row + 1 inSection:0];
        
        
        [tableView deleteRowsAtIndexPaths:@[indexPath, idxPath] withRowAnimation:UITableViewRowAnimationMiddle];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        NSLog(@"%s", __FUNCTION__);
        // 1, 在IndexPath对应的位置添加数据
        [self.arrMData insertObject:@"我来了,呼啦呼啦..." atIndex:indexPath.row];
        
        // 2, 在IndexPath对应的位置添加一个cell
        [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    //NSLog(@"%s", __func__);
    // 更新数据源
    NSString *strSource = self.arrMData[sourceIndexPath.row];
    [self.arrMData insertObject:strSource atIndex:destinationIndexPath.row + 1];
    [self.arrMData removeObjectAtIndex:sourceIndexPath.row];
}

@end
