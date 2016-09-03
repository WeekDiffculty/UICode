//
//  QYUpdateController.h
//  Demo01_对象间的通讯_property
//
//  Created by qingyun on 16/6/20.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QYUpdateController;

@protocol QYUpdateControllerDelegate <NSObject>

@optional
- (void)updateController:(QYUpdateController *)updateController didCompleteWithText:(NSString *)text;

@end

@interface QYUpdateController : UIViewController

// 凡是属性中遇到Mutable成对出现的类型的时候使用copy
//NSArray
//NSDictionary
//NSSet
//NSString
@property (nonatomic, copy) NSString *text;

// 用于回传信息的Block
//@property (nonatomic, copy) void (^blkUpdate)(NSString *text);

// 代理对象
@property (nonatomic, weak) id<QYUpdateControllerDelegate> actionDelegate;

@end
