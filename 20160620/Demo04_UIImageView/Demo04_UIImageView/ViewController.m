//
//  ViewController.m
//  Demo04_UIImageView
//
//  Created by qingyun on 16/6/20.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// 展示图片的控件
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

// 存放所有图片的数组
@property (nonatomic, copy) NSArray *arrImages;

// 定时器
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

/** 懒加载图片数组 */
- (NSArray *)arrImages {
    if (!_arrImages) {
        NSMutableArray *arrMImages = [NSMutableArray array];
        for (NSInteger index = 0; index < 17; index ++) {
            NSString *strImageName = [NSString stringWithFormat:@"campFire%02ld.png", index + 1];
            UIImage *image = [UIImage imageNamed:strImageName];
            [arrMImages addObject:image];
        }
        
        _arrImages = [arrMImages copy];
    }
    return _arrImages;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self animateFire];
    
    [self flyingSnow];
}

- (void)animateFire {
    // 设置帧动画的图片数组
    self.imageView.animationImages = self.arrImages;
    // 设置总的播放时长
    self.imageView.animationDuration = self.arrImages.count * 0.05;
    // 设置播放的重复次数
    self.imageView.animationRepeatCount = INFINITY;
    // 开始动画
    [self.imageView startAnimating];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 停止动画
    //[self.imageView stopAnimating];
}


- (void)flyingSnow {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(xueHua) userInfo:nil repeats:YES];
}

- (void)xueHua {
    NSLog(@"%s", __func__);
    UIImage *image = [UIImage imageNamed:@"snow.png"];
    UIImageView *imvSnow = [[UIImageView alloc] initWithImage:image];
    [self.view addSubview:imvSnow];
    
    CGFloat viewWidth = self.view.frame.size.width + 1;
    CGFloat viewHeight = self.view.frame.size.height;
    
    // arc4random_uniform: 随机数函数
    CGFloat startWH = 20 + arc4random_uniform(30);
    CGPoint startPoint = CGPointMake(arc4random_uniform(viewWidth), -startWH);
    CGSize startSize = CGSizeMake(startWH, startWH);
    imvSnow.frame = (CGRect){startPoint, startSize};
    
    CGFloat stopWH = 20 + arc4random_uniform(30);
    CGPoint stopPoint = CGPointMake(arc4random_uniform(viewWidth), viewHeight-stopWH);
    CGSize stopSize = CGSizeMake(stopWH, stopWH);
    [UIView animateWithDuration:2 animations:^{
        imvSnow.frame = (CGRect){stopPoint, stopSize};
    } completion:^(BOOL finished) {
        [imvSnow removeFromSuperview];
    }];
}

@end
