//
//  QYFunctionsView.h
//  4000000
//
//  Created by qingyun on 16/7/12.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYFunctionsView : UIView

@property (nonatomic, copy) void (^blkDidTapModal)(NSDictionary *dicData);

@end
