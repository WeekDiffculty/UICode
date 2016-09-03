//
//  QYCollectionViewController.m
//  Demo02_UICollectionViewController
//
//  Created by qingyun on 16/7/12.
//  Copyright © 2016年 qingyun. All rights reserved.
//

/** Color Related */
#define QLColorWithRGB(redValue, greenValue, blueValue) ([UIColor colorWithRed:((redValue)/255.0) green:((greenValue)/255.0) blue:((blueValue)/255.0) alpha:1])
#define QLColorRandom QLColorWithRGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#import "QYCollectionViewController.h"

@interface QYCollectionViewController ()

@end

@implementation QYCollectionViewController

- (instancetype)init {
    // 创建一个初始化UICollectionView的layout对象
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    // 设置最小的行距
    flowLayout.minimumLineSpacing = 20;
    // 设置最小的列间距
    flowLayout.minimumInteritemSpacing = 20;
    // 设置每个cell的尺寸
    flowLayout.itemSize = CGSizeMake(80, 80);
    // 设置section的边距
    flowLayout.sectionInset = UIEdgeInsetsMake(30, 30, 30, 30);
    // 设置header 的高度, 和我们的TableView的header一样(CollectionView有一个滚动方向, 当垂直滚动的时候, 高度起作用, 当水平滚动的时候, 宽度起作用)
    flowLayout.headerReferenceSize = CGSizeMake(20, 20);
    flowLayout.footerReferenceSize = CGSizeMake(20, 20);
    
    // 滚动的方向
    //flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    // 固定header/Footer
    flowLayout.sectionHeadersPinToVisibleBounds = YES;
    flowLayout.sectionFootersPinToVisibleBounds = YES;
    
    return [super initWithCollectionViewLayout:flowLayout];
}

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDefaultSetting];
}

/** 加载默认设置和UI */
- (void)loadDefaultSetting {
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    
}

#pragma mark - UICollectionViewDataSource
/** collectionView中有多少个分组 */
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 5;
}
/** collectionView中第section组有多少个cell */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20 + arc4random_uniform(30);
}
// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.contentView.backgroundColor = QLColorRandom;
    // 绝对不要在CollectionViewCell创建的时候使用下面的方法, 否则翻脸挂掉
    //if (cell == nil) {
    //    cell = [[UICollectionViewCell alloc] init];
    //}
    return cell;
}

@end
