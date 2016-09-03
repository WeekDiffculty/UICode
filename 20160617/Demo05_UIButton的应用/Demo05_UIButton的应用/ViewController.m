//
//  ViewController.m
//  Demo05_UIButton的应用
//
//  Created by qingyun on 16/6/17.
//  Copyright © 2016年 qingyun. All rights reserved.
//

// Transform 的平移，缩放， 旋转最好一次用一个， 不要复合起来使用

#define Name

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btnXiaoHuang;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

// 平移
- (IBAction)moveAction:(UIButton *)button {
    NSLog(@"%ld", button.tag);
    
    // 取出原有的frame
    CGRect rectXiaoHuang = self.btnXiaoHuang.frame;
    
    // 根据移动改变相应的x或者y
    switch (button.tag) {
        case 100: // 上
            rectXiaoHuang.origin.y -= 10;
            break;
        case 101: // 左
            rectXiaoHuang.origin.x -= 10;
            break;
        case 102: // 下
            rectXiaoHuang.origin.y += 10;
            break;
        case 103: // 右
            rectXiaoHuang.origin.x += 10;
            break;
            
        default:
            break;
    }
    
    //self.btnXiaoHuang.transform = CGAffineTransformTranslate(self.btnXiaoHuang.transform, 10, 0);
    
    //[UIView beginAnimations:nil context:nil];
    
    //// 0.25是iOS中动画的默认时长
    //[UIView setAnimationDuration:0.25];
    //// 赋值
    //self.btnXiaoHuang.frame = rectXiaoHuang;
    //
    //[UIView commitAnimations];
    
    //[UIView animateWithDuration:0.25 animations:^{
    //    self.btnXiaoHuang.frame = rectXiaoHuang;
    //}];
    //[UIView animateWithDuration:0.25 delay:2 options:0 animations:^{
    //    self.btnXiaoHuang.frame = rectXiaoHuang;
    //} completion:^(BOOL finished) {
    //    NSLog(@"我很流弊");
    //}];
    
    [UIView animateWithDuration:2
                          delay:0
         usingSpringWithDamping:0.2
          initialSpringVelocity:10
                        options:0
                     animations:^{
                         self.btnXiaoHuang.frame = rectXiaoHuang;
                     }
                     completion:nil];
    
}
- (IBAction)scale:(UIButton *)button {
    NSLog(@"%@", button);
    // 缩放方式1： fame
    //[self scaleFrameWithButton:button];
    // 缩放方式2：Tranform
    [self scaleTranformWithButton:button];
}

- (void)scaleTranformWithButton:(UIButton *)button {
    
    // CGAffineTransformMakeScale: 只能变一次，以第一次形变的开始作为基点
    //self.btnXiaoHuang.transform = CGAffineTransformMakeScale(1.2, 0.8);
    if (button.tag == 104) {
        self.btnXiaoHuang.transform = CGAffineTransformScale(self.btnXiaoHuang.transform, 1.1, 1.1);
    } else if (button.tag == 105) {
        self.btnXiaoHuang.transform = CGAffineTransformScale(self.btnXiaoHuang.transform, 0.9, 0.9);
    }
}   

- (void)scaleFrameWithButton:(UIButton *)button {
    // 取出原有的frame
    CGRect rectXiaoHuang = self.btnXiaoHuang.frame;
    
    // 根据点击修改宽高
    if (button.tag == 104) {
        rectXiaoHuang.origin.x -= 10 / 2;
        rectXiaoHuang.origin.y -= 10 / 2;
        rectXiaoHuang.size.width += 10;
        rectXiaoHuang.size.height += 10;
    } else if (button.tag == 105) {
        rectXiaoHuang.origin.x += 10 / 2;
        rectXiaoHuang.origin.y += 10 / 2;
        rectXiaoHuang.size.width -= 10;
        rectXiaoHuang.size.height -= 10;
    }
    
    // 赋值
    self.btnXiaoHuang.frame = rectXiaoHuang;
}

- (IBAction)rotateAction:(UIButton *)button {
    NSLog(@"%@", button);
    
    // 当弧度的值是证书的时候--》顺时针旋转
    if (button.tag == 106) { // 左旋转
        self.btnXiaoHuang.transform = CGAffineTransformRotate(self.btnXiaoHuang.transform, -M_PI_4);
    } else if (button.tag == 107) { // 右旋转
        self.btnXiaoHuang.transform = CGAffineTransformRotate(self.btnXiaoHuang.transform, M_PI_4);
    }
}


@end
