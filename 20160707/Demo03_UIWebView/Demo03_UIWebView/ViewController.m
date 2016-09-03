//
//  ViewController.m
//  Demo03_UIWebView
//
//  Created by qingyun on 16/7/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController () <UIWebViewDelegate>

@property (nonatomic, weak) UIWebView *webView;

@end

@implementation ViewController

- (void)loadView {
    UIWebView *webView = [[UIWebView alloc] init];
    //webView.frame = self.view.bounds;
    self.view = webView;
    self.webView = webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadDefaultSetting];
}


- (void)loadDefaultSetting {
    
    //WKWebView *web;
//    UIWebView *webView = [[UIWebView alloc] init];
//    webView.frame = self.view.bounds;
//    [self.view addSubview:webView];
    // DNS
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com:80"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    
    self.webView.delegate = self;
}

#pragma mark - UIWebViewDelegate
/** 开始加载 */
- (void)webViewDidStartLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}
/** 已经完成加载 */
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}
/** 加载失败 */
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"%@", error);
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}
/** 询问是否应该加载这个网页 */
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    //NSLog(@"%@", request.URL.absoluteString);
    if ([request.URL.absoluteString containsString:@"music.baidu.com"]) {
        return NO;
    }
    return YES;
}

@end
