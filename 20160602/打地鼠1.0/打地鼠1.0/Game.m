//
//  Game.m
//  打地鼠1.0
//
//  Created by qingyun on 16/6/2.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Game.h"

@implementation Game

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        // 自定义Game 的效果
#if 0
        self.back = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back"]];
        self.back.frame = self.bounds;
        
        self.mouse = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mouse"]];
        self.mouse.frame = CGRectMake(60, 180, 59, 72);
        [self.back addSubview:self.mouse];
        
        [self addSubview:self.back];
#endif
        _back = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back"]];
        _back.frame = CGRectMake(0, 0, self.frame.size.height, self.frame.size.width);
        
        _mouse = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mouse"]];
        _mouse.frame = CGRectMake(60, 180, 59, 72);
        [_back addSubview:_mouse];
        
        [self addSubview:_back];
        
    }
    return self;
}

@end
