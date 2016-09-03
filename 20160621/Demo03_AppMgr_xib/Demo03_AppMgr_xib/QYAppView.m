//
//  QYAppView.m
//  Demo03_AppMgr_xib
//
//  Created by qingyun on 16/6/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYAppView.h"

@interface QYAppView ()
{
    // 显示图片的控件
    __weak IBOutlet UIImageView *_imageView;
    // App的名字
    __weak IBOutlet UILabel *_lblAppName;
}

@end

@implementation QYAppView

// xib中的控件只能向与其关联的类中拖outlet关联

+ (instancetype)appView {
    QYAppView *view = [[[NSBundle mainBundle] loadNibNamed:@"QYAppView" owner:nil options:nil] lastObject];
    
    return view;
}



// 加载xib文件完成的时候调用这个方法
- (void)awakeFromNib {
    [super awakeFromNib];
    
}

// 重写setter方法
- (void)setDicResource:(NSDictionary *)dicResource {
    _dicResource = [dicResource copy];
    
    [_imageView setImage:[UIImage imageNamed:dicResource[@"icon"]]];
    [_lblAppName setText:dicResource[@"name"]];
}
- (IBAction)tapAction {
    // 判断代码块是否有值
    if (self.blkDidTapDownloadButton) {
        // 调用代码块
        self.blkDidTapDownloadButton(self.dicResource);
    }
}

@end
