//
//  GameView.m
//  打地鼠
//
//  Created by qingyun on 16/6/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "GameView.h"

@implementation GameView
//1.初始化游戏视图
- (instancetype)initWithFrame:(CGRect)frame{
    if  (self = [super initWithFrame:frame]) {
        _backView = [[UIImageView alloc] initWithFrame:frame];
        [self addSubview:_backView];
        _backView.image = [UIImage imageNamed:@"back"];
        
        _mouseBtn = [[UIButton alloc] initWithFrame:CGRectMake(133, 79, 60, 72)];
        [self addSubview:_mouseBtn];
        [_mouseBtn setImage:[UIImage imageNamed:@"mouse"] forState:UIControlStateNormal];
        
        _scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width/2 - 100, 30, 200, 44)];
        _scoreLabel.font = [UIFont systemFontOfSize:25];
        _scoreLabel.text = @"得分：0";
        _scoreLabel.textColor = [UIColor orangeColor];
        [_backView addSubview:_scoreLabel];
        
    }
    return self;
}
@end
