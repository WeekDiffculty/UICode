//
//  QYPanView.h
//  4000000
//
//  Created by qingyun on 16/7/12.
//  Copyright © 2016年 qingyun. All rights reserved.
//  轮播图

#import <UIKit/UIKit.h>

#define QYPanViewHeight 200

@interface QYPanView : UIView

@property (nonatomic, copy) void (^blkDidTapImageViewAtIndex)(NSUInteger index);

@end
