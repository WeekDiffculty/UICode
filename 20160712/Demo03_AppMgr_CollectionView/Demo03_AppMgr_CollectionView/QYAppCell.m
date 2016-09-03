//
//  QYAppCell.m
//  Demo03_AppMgr_CollectionView
//
//  Created by qingyun on 16/7/12.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYAppCell.h"

@interface QYAppCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

@end

@implementation QYAppCell

- (void)setAppModel:(QYAppModel *)appModel {
    _appModel = appModel;
    _imageView.image = [UIImage imageNamed:appModel.icon];
    _lblTitle.text = appModel.name;
}

- (IBAction)tapAction {
    
}

@end
