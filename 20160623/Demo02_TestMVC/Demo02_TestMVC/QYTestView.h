//
//  QYTestView.h
//  Demo02_TestMVC
//
//  Created by qingyun on 16/6/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QYTestModel.h"

@interface QYTestView : UIView

// 如果使用weak
@property (nonatomic, strong) QYTestModel *testModel;

+ (instancetype)testView;

@end
