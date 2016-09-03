//
//  ViewController.m
//  Register
//
//  Created by qingyun on 16/6/4.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *errorInfo;
@property (strong, nonatomic) NSArray *numbers;
@property (weak, nonatomic) IBOutlet UITextField *code;
@property (strong, nonatomic) NSTimer *timer;
@property (nonatomic) NSInteger count;
@property (weak, nonatomic) IBOutlet UIButton *codeBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _numbers = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0"];
}

- (IBAction)authCode:(UIButton *)sender {
    
    sender.enabled = NO;
    _count = 60;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(time:) userInfo:nil repeats:YES];
    
    // 制造一个随机数字
    NSInteger num = arc4random();
    NSLog(@"num >>>>> %ld", num%10);
    //NSString *codeStr = [NSString stringWithFormat:@"%d%d%d%d%d%d", ]
    NSMutableString *codeStr = [NSMutableString string];
    for (int i=0; i<6; i++) {
        [codeStr appendFormat:@"%d", arc4random()%10];
    }
    _code.text = codeStr;
}

- (void)time:(NSTimer *)timer
{
    _count--;
    // 当时间到0时需要重新启用按钮，并且把时间重新设置成60，计时器失效，这样下次计时才不会出错
    if (_count <= 0) {
        _codeBtn.enabled = YES;
        _count = 60;
        [_timer invalidate];
    } else {
        NSString *timerStr = [@(_count) stringValue];
        [_codeBtn setTitle:timerStr forState:UIControlStateDisabled];
    }
}

- (IBAction)editValid:(UITextField *)sender {
    
    NSLog(@"text >>>> %@", sender.text);

    // 验证是否包含敏感词
    if ([sender.text containsString:@"qy"] || [sender.text containsString:@"qingyun"] || [sender.text containsString:@"青云"]) {
        _errorInfo.text = @"您输入的内容包含敏感词汇";
#if 0
        NSRange range = [sender.text rangeOfString:@"qy"];
        NSString *str = [sender.text stringByReplacingCharactersInRange:range withString:@""];
        sender.text = str;
#endif
        sender.text = [sender.text stringByReplacingCharactersInRange:[sender.text rangeOfString:@"qy"] withString:@""];
    }

    // 用户
    if (sender.tag == USERNAME) {
        // 判断长度是否超标
        if (sender.text.length > 20) {
            _errorInfo.text = @"您输入的内容过长";
            sender.text = [sender.text substringToIndex:20];
        }
        
        // 判断是否以数字开始
        NSString *firstChar = [sender.text substringToIndex:1];
        if ([_numbers containsObject:firstChar]) {
            _errorInfo.text = @"用户不能以数字开始";
            sender.text = @"";
        }

    }
    
    // 手机号码
    if (sender.tag == PHONE) {
        if (sender.text.length > 11) {
            _errorInfo.text = @"您输入的内容过长";
            sender.text = [sender.text substringToIndex:11];
        }
    }
}



//- (IBAction)editValid:(UITextField *)sender {

// NSLog(@"text >>> %@",sender.text);
//验证是否包含敏感词
//    if (sender.text.length!=0) {
//        if ([sender.text containsString:@"qy"] || [sender.text containsString:@"青云"] || [sender.text containsString:@"qingyun"])
//        {
//            _showLabel.text = @"您输入的内容包含敏感词";
//            sender.text = [sender.text stringByReplacingCharactersInRange:NSMakeRange(sender.text.length-1, 1)  withString:@""];
//
//        }

//            if (sender.tag == USERNAME) {
//
//            NSString *userNameExpession = @"[^0-9]+[0-9a-zA-Z_\\-]{0,19}";
//            NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",userNameExpession];
//            if ([pred1 evaluateWithObject:sender.text]) {
//                _showLabel.text = @"您输入的正确";
//            }
//
//
//
//
//    }
//
//





//}


@end