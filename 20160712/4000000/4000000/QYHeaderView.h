//
//  QYHeaderView.h
//  4000000
//
//  Created by qingyun on 16/7/12.
//  Copyright © 2016年 qingyun. All rights reserved.
//  TableView的headerView

#import <UIKit/UIKit.h>

@class QYHeaderView;

@protocol QYHeaderViewDelegate <NSObject>

@optional
- (void)headerView:(QYHeaderView *)headerView didSelectButtonWithData:(NSDictionary *)dicData;

- (void)headerView:(QYHeaderView *)headerView didTapImageViewAtIndex:(NSUInteger)index;

@end

@interface QYHeaderView : UIView

@property (nonatomic, weak) id<QYHeaderViewDelegate> delegate;

@end
