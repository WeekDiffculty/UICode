//
//  RegisterViewController.h
//  学生信息管理
//
//  Created by qingyun on 16/6/16.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController

@property (nonatomic, copy) void (^callBack)(NSDictionary *);

@end
