//
//  QYAppView.h
//  Demo03_AppMgr_xib
//
//  Created by qingyun on 16/6/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYAppView : UIView

// 资源字典
@property (nonatomic, copy) NSDictionary *dicResource;

// 定义一个向外传递事件的Block
@property (nonatomic, copy) void (^blkDidTapDownloadButton)(NSDictionary *dicResource);

// instancetype表示什么?
// 表示:当前类或者子类的类型
+ (instancetype)appView;

@end
