//
//  ViewController.m
//  Demo05_Masonry
//
//  Created by qingyun on 16/7/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

// 必须放在导入Masonry.h头文件之前
#define MAS_SHORTHAND

// 导入头文件
#import "Masonry.h"


@interface ViewController ()
{
    __weak UIView *_viewCyan;
    __weak UIView *_viewRed;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.presentingViewController;
    
    // 当equalTo后面是基本数据类型的时候使用mas_equalTo
    //
    
    // 要求:让红色的view距离父控件上面100, 父控件左边50
    // 宽度: 100, 高度: 80;
    
    UIView *viewRed = [UIView new];
    viewRed.backgroundColor = [UIColor redColor];
    [self.view addSubview:viewRed];
    _viewRed = viewRed;
    
    viewRed.layer.borderColor = [UIColor purpleColor].CGColor;
    viewRed.layer.borderWidth = 2.0;
    viewRed.layer.cornerRadius = 50;
    // 一般情况下, 内部有多个图层的时候需要剪切
    viewRed.layer.masksToBounds = YES;
    //viewRed.clipsToBounds = YES;
    
    // 在添加约束之前, 这个view已经添加到父视图上了
    // 把参数中传递进来的make当前要设置约束的视图
    //[viewRed mas_makeConstraints:^(MASConstraintMaker *make) {
    //    make.leading.equalTo(self.view).offset(50); // 左边
    //    make.top.equalTo(self.view).offset(100); // 上边
    //    make.width.equalTo(@(100));
    //    make.height.mas_equalTo(100);
    //}];
    //[viewRed mas_makeConstraints:^(MASConstraintMaker *make) {
    //    make.leading.equalTo(self.view).offset(50); // 左边
    //    make.top.equalTo(self.view).offset(100); // 上边
    //    make.size.mas_equalTo(CGSizeMake(100, 100));
    //}];
    //[viewRed mas_makeConstraints:^(MASConstraintMaker *make) {
    //    make.leading.and.top.equalTo(self.view).offset(100);
    //    make.trailing.and.bottom.equalTo(self.view).offset(-100);
    //}];
    [viewRed mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.view).offset(50); // 左边
        make.top.mas_equalTo(self.view).offset(100); // 上边
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    // 添加绿色视图
    UIView *viewGreen = [UIView new];
    viewGreen.backgroundColor = [UIColor greenColor];
    [self.view addSubview:viewGreen];
    [viewGreen makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(viewRed.mas_trailing).offset(50);
        make.top.and.bottom.mas_equalTo(viewRed);
        make.width.mas_equalTo(viewRed);
    }];
    
    UIView *viewYellow = [UIView new];
    viewYellow.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:viewYellow];
    [viewYellow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(viewRed);
        make.top.equalTo(viewRed.mas_bottom).offset(100);
        make.height.equalTo(viewRed);
        make.trailing.equalTo(viewGreen);
    }];
    
    UIView *viewCyan = [UIView new];
    viewCyan.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:viewCyan];
    [viewCyan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(viewYellow);
        make.top.equalTo(viewYellow.mas_bottom).offset(50);
        make.height.equalTo(viewYellow);
        make.width.equalTo(viewYellow).dividedBy(2);
    }];
    _viewCyan = viewCyan;
}

- (void)usingStyle {
    //// 使用Masonry的方式
    //// 1, 创建一个视图的所有约束, 并添加到视图上
    //[viewRed mas_makeConstraints:^(MASConstraintMaker *make) {
    //    
    //}];
    //
    //// 2, 重新创建这个视图的所有约束, 并在添加新的约束之前, 把之前的约束全部删除
    //[viewRed mas_remakeConstraints:^(MASConstraintMaker *make) {
    //    
    //}];
    //
    //// 3, 更新约束(对当前视图的一个或者多个约束重新设置)
    //[viewRed mas_updateConstraints:^(MASConstraintMaker *make) {
    //    
    //}];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_viewCyan remakeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.view).offset(-30);
        make.top.equalTo(self.view).offset(30);
        make.width.height.equalTo(@(50));
    }];
    
    [_viewRed mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(20));
    }];
    
    [UIView animateWithDuration:2 animations:^{
        [self.view layoutIfNeeded];
        _viewCyan.transform = CGAffineTransformMakeRotation(M_PI);
    }];
}

@end
