//
//  QYZoomingView.h
//  Demo06_AlbumZoomingEffect
//
//  Created by qingyun on 16/7/1.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QYZoomingView;
@protocol QYZoomingViewDelegate <NSObject>

- (void)zoomingViewDidTaped:(QYZoomingView *)zoomingView;

@end

@interface QYZoomingView : UIScrollView

@property (nonatomic, weak) id<QYZoomingViewDelegate> delegateZooming;

@property (nonatomic, copy) void (^blkDidTapedImageView)();
@property (nonatomic, copy) NSString *strImageName;

@end
