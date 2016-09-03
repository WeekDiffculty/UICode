//
//  ViewController.m
//  Demo01_对象间的通讯_property
//
//  Created by qingyun on 16/6/20.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "QYUpdateController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lblText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)modify {
    // 模态形式展示更新控制器的View
    QYUpdateController *vcUpdate = [QYUpdateController new];
    // 属性传值（正向传值）
    vcUpdate.text = self.lblText.text;
    // 设置回传的处理
    [vcUpdate setBlkUpdate:^(NSString *text) {
        self.lblText.text = text;
    }];
    [self presentViewController:vcUpdate animated:YES completion:nil];
}


@end
