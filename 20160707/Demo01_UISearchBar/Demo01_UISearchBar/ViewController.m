//
//  ViewController.m
//  Demo01_UISearchBar
//
//  Created by qingyun on 16/7/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UISearchBarDelegate>

@property (nonatomic, weak) UISearchBar *searchBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadDefaultSetting];
    
}

- (void)loadDefaultSetting {
    // 创建一个搜索视图
    UISearchBar *searchBar = [UISearchBar new];
    searchBar.frame = CGRectMake(0, 20, self.view.frame.size.width, 44);
    [self.view addSubview:searchBar];
    self.searchBar = searchBar;
    
    searchBar.tintColor = [UIColor orangeColor];
    
    // 提示文字
    searchBar.placeholder = @"输入搜索关键字";
    // 设置默认的内容
    searchBar.text = @"我叫流弊";
    // 设置搜索框的样式(主要是颜色的选择)
    //searchBar.barStyle = UIBarStyleBlack;
    // 设置设置是否有边框
    searchBar.searchBarStyle = UISearchBarStyleMinimal;
    
    // 显示取消按钮
    //[searchBar setShowsCancelButton:YES animated:YES];
    // 显示书签, 搜索结果按钮(注意: 书签和搜索结果按钮只能显示一个, 结果的优先级比较高, 用来告诉用户, 搜索已经成功)
    [self.searchBar setShowsSearchResultsButton:NO];
    [self.searchBar setShowsBookmarkButton:YES];
    
    self.searchBar.delegate = self;
    
    // 不建议修改这个回车键的类型, 因为当前就是一个搜索视图
    //self.searchBar.returnKeyType = UIReturnKeyNext;
}

#pragma mark - UISearchBarDelegate
/** 是否开始编辑 */
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    NSLog(@"%s", __func__);
    return YES;
}
/** 已经开始编辑 */
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    NSLog(@"%s", __func__);
}
/** 询问是否应该结束编辑 */
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {
    NSLog(@"%s", __func__);
    return YES;
}
/** 已经结束编辑 */
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    NSLog(@"%s", __func__);
}
/** 点击了回车键 */
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"%s", __func__);
}
/** 点击了书签按钮 */
- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"%s", __func__);
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"%s", __func__);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //[self.view endEditing:YES];
    [self.searchBar setShowsCancelButton:YES animated:YES];
}

@end
