//
//  ViewController.m
//  网易新闻Demo
//
//  Created by qingyun on 16/7/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "QYCommon.h"
@interface ViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) PageScrollView *pageScrollView;
@property (nonatomic, strong) TopOptionScrollView *topView;
@property (nonatomic, copy) NSArray *names;
@end

@implementation ViewController

- (NSArray *)names
{
    if (!_names) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"OptionTitles" ofType:@"plist"];
        _names = [NSArray arrayWithContentsOfFile:filePath];
    }
    return _names;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTopScrollView];
}
- (void)setupTopScrollView{
    CGRect frame = CGRectMake(0, 20, kSCREEN_WIDTH, 40);
    _topView = [TopOptionScrollView viewWithFrame:frame andNames:self.names];
    [self.view addSubview:_topView];
    
    __weak ViewController *weakSelf = self;
    _topView.optionBtnClicked = ^(NSInteger currentIndex){
//        NSLog(@"currentIndex:%ld",currentIndex);
        weakSelf.pageScrollView.contentOffset = CGPointMake(kSCREEN_WIDTH * (currentIndex-100), 0);
    };
    
    _pageScrollView = [PageScrollView viewWithFrame:CGRectMake(0, 60, kSCREEN_WIDTH, kSCREEN_HEIGHT - 60) andNames:self.names];
    _pageScrollView.delegate = self;
    [self.view addSubview:_pageScrollView];
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGPoint point = scrollView.contentOffset;
    CGFloat offSetX = point.x;
    NSInteger index = offSetX/kSCREEN_WIDTH;
    _topView.currentIndex = index + 100;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
