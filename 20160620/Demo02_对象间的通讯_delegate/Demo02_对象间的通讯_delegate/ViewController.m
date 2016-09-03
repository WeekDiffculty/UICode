//
//  ViewController.m
//  Demo01_对象间的通讯_property
//
//  Created by qingyun on 16/6/20.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "QYUpdateController.h"

@interface ViewController () <QYUpdateControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lblText;
@property (nonatomic, strong) QYUpdateController *vcUpdate1;

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
    //[vcUpdate setBlkUpdate:^(NSString *text) {
    //    self.lblText.text = text;
    //}];
    vcUpdate.actionDelegate = self;
    [self presentViewController:vcUpdate animated:YES completion:nil];
    self.vcUpdate1 = vcUpdate;
}

#pragma mark QYUpdateControllerDelegate
- (void)updateController:(QYUpdateController *)updateController didCompleteWithText:(NSString *)text {
    self.lblText.text = text;
}


@end
