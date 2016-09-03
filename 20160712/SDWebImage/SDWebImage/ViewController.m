//
//  ViewController.m
//  SDWebImage
//
//  Created by qingyun on 16/7/12.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@end

@implementation ViewController

#pragma mark - ♻️ LifeCycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDefaultSetting];
}

/** Load the default UI elements And prepare some datas needed. */
- (void)loadDefaultSetting {
//    NSURL *url = [NSURL URLWithString:@"http://cimg.taohuaan.net/upload/201110/27/080533a3P7v.jpg"];
//    NSData *dataImage = [NSData dataWithContentsOfURL:url];
//    UIImage *image = [UIImage imageWithData:dataImage];
//    self.imageView.image = image;
    
    
    // NSURL *url = [[NSBundle mainBundle] URLForResource:@"03.png" withExtension:nil];
    NSURL *url = [NSURL URLWithString:@"http://attach.bbs.miui.com/forum/201502/22/140543kr7zjz1em8oogujx.jpeg"];
    UIImage *imagePlaceHolder = [UIImage imageNamed:@"173890255948"];
    // 直接设置一个URL
    //[self.imageView sd_setImageWithURL:url];
    // completed: 下载图片完成后就会调用这个Block
    //[self.imageView sd_setImageWithURL:url completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) { }];
    // placeholderImage: 占位图片, 在图片还没下载下来的时候显示
    //[self.imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"173890255948"]];
    //[self.imageView sd_setImageWithURL:url placeholderImage:imagePlaceHolder options:SDWebImageRetryFailed | SDWebImageProgressiveDownload];
    /*!
     * SDWebImageOptions
     SDWebImageRetryFailed : 下载失败之后重新请求图片数据
     SDWebImageLowPriority : 这个是在ScrollView上效果明显, 当ScrollView滚动的时候暂停下载
     SDWebImageCacheMemoryOnly : 只缓存在内存
     SDWebImageProgressiveDownload : 下拉式展示图片: 下载多少展示多少
     */
    
    //[self.imageView sd_setImageWithURL:<#(NSURL *)#> placeholderImage:<#(UIImage *)#> completed:<#^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL)completedBlock#>];
    
    //[self.imageView sd_setImageWithURL:<#(NSURL *)#> placeholderImage:<#(UIImage *)#> options:<#(SDWebImageOptions)#> completed:<#^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL)completedBlock#>];
    
    [self.imageView sd_setImageWithURL:url placeholderImage:imagePlaceHolder options:SDWebImageRetryFailed | SDWebImageProgressiveDownload progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            self.progressView.progress = (CGFloat)receivedSize / expectedSize;
            NSLog(@"%f", (CGFloat)receivedSize / expectedSize);
    } completed:nil];
    
}

@end
