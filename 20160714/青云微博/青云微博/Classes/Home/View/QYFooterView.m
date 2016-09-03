//
//  QYFooterView.m
//  青云微博
//
//  Created by qingyun on 16/7/14.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYFooterView.h"

@implementation QYFooterView
{
    __weak IBOutlet UIView *_viewBg;
    
}

+ (instancetype)footerViewWithTableView:(UITableView *)tableView {
    static NSString *strId = @"QYFooterView";
    QYFooterView *footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:strId];
    if (footer == nil) {
        footer = [[[NSBundle mainBundle] loadNibNamed:@"QYFooterView" owner:nil options:nil] firstObject];
        [footer setValue:strId forKey:@"reuseIdentifier"];
    }
    
    return footer;
}


//- (void)didMo
@end
