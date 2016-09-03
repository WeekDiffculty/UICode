//
//  QYLoginView.m
//  Demo06.UIView&xib
//
//  Created by qingyun on 16/6/18.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYLoginView.h"

@implementation QYLoginView

+ (instancetype)loginView {
    QYLoginView *view = [[[NSBundle mainBundle] loadNibNamed:@"QYLoginView" owner:nil options:nil] firstObject];
    return view;
}

@end
