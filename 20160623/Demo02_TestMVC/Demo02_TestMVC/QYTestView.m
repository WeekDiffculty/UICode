//
//  QYTestView.m
//  Demo02_TestMVC
//
//  Created by qingyun on 16/6/23.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYTestView.h"

@implementation QYTestView
{
    __weak IBOutlet UILabel *_lblName;
    __weak IBOutlet UILabel *_lblIdentifier;
    __weak IBOutlet UILabel *_lblWheelsCount;
}

// xib加载的方式
+ (instancetype)testView {
    return [[[NSBundle mainBundle] loadNibNamed:@"QYTestView" owner:nil options:nil] lastObject];
}

// 不论纯代码还是xib都是一样的
- (void)setTestModel:(QYTestModel *)testModel {
    // 1, 给自动生成的成员变量赋值
    _testModel = testModel;
    
    // 2, 把传过来的值赋值给控件
    _lblName.text = testModel.name;
    _lblIdentifier.text = testModel.identifier;
    _lblWheelsCount.text = [NSString stringWithFormat:@"%@", testModel.wheelsCount];
}

// 如果使用纯代码的方式:

//// 不管这个类是以何种方式初始化, 最终都会调用这个initWithFrame方法
//- (instancetype)initWithFrame:(CGRect)frame {
//    if (self = [super initWithFrame:frame]) {
//        [self loadDefaultSetting];
//    }
//    return self;
//}
//
//- (void)loadDefaultSetting {
//
//}

@end
