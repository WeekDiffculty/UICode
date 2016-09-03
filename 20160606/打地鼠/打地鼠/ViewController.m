//
//  ViewController.m
//  打地鼠
//
//  Created by qingyun on 16/6/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "GameView.h"
@interface ViewController ()
@property (nonatomic, strong)GameView *gameView;
@property (nonatomic, strong)NSTimer *timer;
@property (nonatomic) NSInteger score;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//  将父视图View的frame与控制器的方向设置一致
    self.view.frame = CGRectMake(0, 0, self.view.frame.size.height, self.view.frame.size.width);
    
//  初始化游戏视图
    _gameView = [[GameView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:_gameView];
    
//   设置计时器
    [self setTimerInterval:3];
    
//   给老鼠视图添加点击事件
    [_gameView.mouseBtn addTarget:self action:@selector(beatMouseAction:) forControlEvents:UIControlEventTouchUpInside];
    
}
//3.给定一个时间间隔，初始化计时器
#pragma mark -- setTimerInterval
- (void)setTimerInterval:(NSInteger)interval{
    _timer = [NSTimer timerWithTimeInterval:interval target:self selector:@selector(setMouseLocation) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
    [_timer fire];
}
//4.点击老鼠后的处理
- (void)beatMouseAction:(UIButton *)btn{
//  当成绩到达80分时，重新设置计时器的时间间隔
    if (_score == 80) {
        [_timer invalidate];
        _timer = nil;
        [self setTimerInterval:1];
    }
    _score += 20;
//  点击老鼠后，让老鼠消失
    btn.alpha = 0;
//  刷新分数
    _gameView.scoreLabel.text = [NSString stringWithFormat:@"得分：%ld",_score];
}
//  给定一个point设置老鼠下一次出现的坐标
#pragma mark -- setMouse
- (void)setMouseBtnWithPoint:(CGPoint)mousePoint{
    _gameView.mouseBtn.frame = CGRectMake(mousePoint.x, mousePoint.y, 60, 72);
}
//2.得到随机数，设置老鼠出现的位置frame
- (void)setMouseLocation{
    NSInteger index = arc4random()%9;
    _gameView.mouseBtn.alpha = 1;
    switch (index) {
        case 0:
            
            [self setMouseBtnWithPoint:CGPointMake(133, 79)];
            break;
        case 1:
            [self setMouseBtnWithPoint:CGPointMake(289, 79)];
            break;
        case 2:
            [self setMouseBtnWithPoint:CGPointMake(455, 79)];
            break;
        case 3:
            [self setMouseBtnWithPoint:CGPointMake(112, 152)];
            break;
        case 4:
            [self setMouseBtnWithPoint:CGPointMake(289, 152)];
            break;
        case 5:
            [self setMouseBtnWithPoint:CGPointMake(455, 152)];
            break;
        case 6:
            [self setMouseBtnWithPoint:CGPointMake(105, 226)];
            break;
        case 7:
            [self setMouseBtnWithPoint:CGPointMake(289, 232)];
            break;
        case 8:
            [self setMouseBtnWithPoint:CGPointMake(473, 232)];
            break;
            
        default:
            break;
    }
    
}
//是否支持旋转
- (BOOL)shouldAutorotate{
    return YES;
}
//旋转的方式
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscapeRight;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
