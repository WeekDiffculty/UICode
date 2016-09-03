//
//  QYAppView.h
//  Demo03_AppMgr_xib
//
//  Created by qingyun on 16/6/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QYAppModel.h"

@interface QYAppView : UIView

// 资源字典
@property (nonatomic, strong) QYAppModel *appModel;

// 定义一个向外传递事件的Block
// 返回值 (^Block的名字)(参数列表);
@property (nonatomic, copy) void (^blkDidTapDownloadButton)(QYAppModel *appModel);

// instancetype表示什么?
// 表示:当前类或者子类的类型
+ (instancetype)appView;

@end
