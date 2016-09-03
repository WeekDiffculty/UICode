//
//  ViewController.m
//  Demo01_TomCat
//
//  Created by qingyun on 16/6/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

typedef enum : NSUInteger {
    QYTapTypeSymbal = 100,
    QYTapTypeDrink,
    QYTapTypeEat,
    QYTapTypePie,
    QYTapTypeFart,
    QYTapTypeScratch,
    QYTapTypeKnockout,
    QYTapTypeStomach,
    QYTapTypeRightFoot,
    QYTapTypeLeftFoot,
    QYTapTypeAngry
} QYTapType;

@interface ViewController ()
{
    // 私有的成员变量, 默认情况下, 成员变量是__strong类型的
    NSTimer *_timer;
    
    //NSArray *_arrImages;
}

// tomcat显示图片
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

// 存放当前动画的所有图片
@property (nonatomic, copy) NSArray *arrImages;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)tapAction:(UIButton *)button {
    
    if (self.imageView.isAnimating) return;
    
    NSInteger tag = button.tag;
    NSLog(@"%ld", tag);
    QYTapType type = tag;
    switch (type) {
        case QYTapTypeSymbal:
            [self animateWithName:@"cymbal" count:13];
            break;
        case QYTapTypeDrink:
            [self animateWithName:@"drink" count:81];
            break;
        case QYTapTypeEat:
            [self animateWithName:@"eat" count:40];
            break;
        case QYTapTypePie:
            [self animateWithName:@"pie" count:24];
            break;
        case QYTapTypeFart:
            [self animateWithName:@"fart" count:28];
            break;
        case QYTapTypeScratch:
            [self animateWithName:@"scratch" count:56];
            break;
        case QYTapTypeKnockout:
            [self animateWithName:@"knockout" count:81];
            break;
        case QYTapTypeStomach:
            [self animateWithName:@"stomach" count:34];
            break;
        case QYTapTypeRightFoot:
            [self animateWithName:@"footRight" count:30];
            break;
        case QYTapTypeLeftFoot:
            [self animateWithName:@"footLeft" count:30];
            break;
        case QYTapTypeAngry:
            [self animateWithName:@"angry" count:26];
            break;
            
        default:
            break;
    }
}

- (void)animateWithName:(NSString *)strName count:(NSUInteger)count {
    NSMutableArray *arrMIMages = [NSMutableArray arrayWithCapacity:count];
    for (NSInteger index = 0; index < count; index ++) {
        // 01,获取资源路径
        NSString *strImageName = [NSString stringWithFormat:@"%@_%02ld.jpg", strName, index];
        // 加载图片
        // 注意:UIImage 使用imageNamed类方法加载的图片是不会释放的, 只要一次加载那么就会永远停留在内存中, 除非应用挂掉, 用户关掉
        // 一般情况下, 全屏的图片都需要适应UIImage的imageWithContentsOfFile方法来加载, 优点是当这个图片设置为nil的时候就会释放所占用的内存空间
        //UIImage *image = [UIImage imageNamed:strImageName];
        NSString *strPath = [[NSBundle mainBundle] pathForResource:strImageName ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:strPath];
        [arrMIMages addObject:image];
    }
    
    // 动画设置
    self.imageView.animationImages = arrMIMages;
    self.imageView.animationDuration = count * 0.07;
    self.imageView.animationRepeatCount = 1;
    
    // 开始动画
    [self.imageView startAnimating];
    
    // 延迟
    //[self performSelector:@selector(clearMemory) withObject:nil afterDelay:self.imageView.animationDuration];
    [self.imageView performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:self.imageView.animationDuration];
//    _timer = [NSTimer scheduledTimerWithTimeInterval:self.imageView.animationDuration target:self selector:@selector(clearMemory) userInfo:nil repeats:NO];
    // dispatch方式: 调度, 派发
    //dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.imageView.animationDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //    self.imageView.animationImages = nil;
    //});
}

// 清除缓存图片数据
//- (void)clearMemory {
//    self.imageView.animationImages = nil;
//    [_timer invalidate];
//    _timer = nil;
//}

@end
