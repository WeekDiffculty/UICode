//
//  PageScrollView.m
//  网易新闻Demo
//
//  Created by qingyun on 16/7/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "PageScrollView.h"
#import "QYCommon.h"
@implementation PageScrollView

- (instancetype)initWithFrame:(CGRect)frame andNames:(NSArray *)names
{
    if (self = [super initWithFrame:frame]) {
        self.contentSize = CGSizeMake(names.count*kSCREEN_WIDTH, frame.size.height);
        self.pagingEnabled = YES;
        for (NSUInteger index = 0; index < names.count; index ++) {
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(kSCREEN_WIDTH * index, 0, kSCREEN_WIDTH, frame.size.height)];
            imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.jpg",names[index]]];
            [self addSubview:imageView];
            
            UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake((kSCREEN_WIDTH-100)/2, 50, 100, 30)];
            titleLabel.textAlignment = NSTextAlignmentCenter;
            titleLabel.text = names[index];
            [imageView addSubview:titleLabel];
        }
    }
    return self;
}
+ (instancetype)viewWithFrame:(CGRect)frame andNames:(NSArray *)names
{
    return [[self alloc] initWithFrame:frame andNames:names];
}
@end
