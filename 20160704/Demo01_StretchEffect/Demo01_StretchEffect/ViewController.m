//
//  ViewController.m
//  Demo01_StretchEffect
//
//  Created by qingyun on 16/7/4.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

/** 图片的原始尺寸 */
@property (nonatomic, assign) CGSize sizeImage;

@property (nonatomic, weak) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadDefaultSetting];
}

- (void)loadDefaultSetting {
    UITableView *tableView = [UITableView new];
    tableView.frame = self.view.bounds;
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    
    // 加载图片
    UIImage *image = [UIImage imageNamed:@"image"];
    // 取出图片的尺寸
    self.sizeImage = image.size;
    
    CGFloat screenWidth = self.view.bounds.size.width;
    
    UIView *viewHeader = [UIView new];
    
    CGFloat headerImageHeight = self.sizeImage.height * screenWidth / self.sizeImage.width;
    
    viewHeader.frame = CGRectMake(0, 0, 0, headerImageHeight);
    
    tableView.tableHeaderView = viewHeader;
    
    UIImageView *imageView = [UIImageView new];
    
    imageView.image = image;
    
    imageView.frame = CGRectMake(0, 0, screenWidth, headerImageHeight);
    
    [viewHeader addSubview:imageView];
    
    self.imageView = imageView;
    
    [tableView sendSubviewToBack:viewHeader];
}

#pragma mark - UITableViewDataSource
/** 在当前Section中有多少个cell */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10000;
}
/** 创建/从队列中获取一个在IndexPath位置显示的UItableViewCell, 并返回 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *strId = @"Id";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:strId];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strId];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Row:%ld", indexPath.row];
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //NSLog(@"%@", scrollView);
    CGFloat offsetY = scrollView.contentOffset.y;
    // 如果偏移值大于0 ,就不需要缩放
    if (offsetY > 0) return;
    
    // 偏移值小于等于0
    NSLog(@"%f", offsetY);
    CGFloat imageWidth = self.sizeImage.width - offsetY;
    CGFloat imageHeight = imageWidth * (self.sizeImage.height/self.sizeImage.width);
    CGFloat imageX = offsetY/2;
    CGFloat imageY = (self.sizeImage.height - imageHeight) / 2;
    self.imageView.frame = CGRectMake(imageX, imageY, imageWidth, imageHeight);
    
    //self.imageView.transform = CGAffineTransformMakeScale(1.3, 1.3);
    
    //self.imageView.transform = CGAffineTransformScale(self.imageView.transform, 1.3, 1.3);
    //self.imageView.transform = CGAffineTransformIdentity;
}

@end
