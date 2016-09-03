//
//  ViewController.m
//  Demo01_UICollectionView
//
//  Created by qingyun on 16/7/12.
//  Copyright © 2016年 qingyun. All rights reserved.
//

/** Color Related */
#define QLColorWithRGB(redValue, greenValue, blueValue) ([UIColor colorWithRed:((redValue)/255.0) green:((greenValue)/255.0) blue:((blueValue)/255.0) alpha:1])
#define QLColorRandom QLColorWithRGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
#define QLColorFromHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

/*!
 * UICollectionView使用注意事项:
    1,UICollectionView必须通过一个非空的继承自UICollectionViewLayout的对象进行初始化, 否则就会挂掉: "UICollectionView must be initialized with a non-nil layout parameter". 但是, 使用UICollectionController的时候, 控制器会自动给我们创建一个UICollectionViewFlowLayout对象, 然后取出来设置相应的属性即可;
    2,UIColllectionViewCell的创建方式不能再在沿用UITableView中的第一种方式(自己alloc), 选择的余地就是①register一个Nib或者一个类 ②StoryBoard中的ProtoType
    could not dequeue a view of kind: UICollectionElementKindCell with identifier Style - must register a nib or a class for the identifier or connect a prototype cell in a storyboard
 */

#import "ViewController.h"

static NSString * const strId = @"Style";
static NSString * const strIdHeader = @"strIdHeader";
static NSString * const strIdFooter = @"strIdFooter";

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, weak) UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadDefaultSetting];
}

/** 加载默认设置和UI */
- (void)loadDefaultSetting {
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
    flowLayout.headerReferenceSize = CGSizeMake(80, 44);
    flowLayout.footerReferenceSize = CGSizeMake(44, 80);
    
    // 滚动的方向
    //flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    // 固定header/Footer
    flowLayout.sectionHeadersPinToVisibleBounds = YES;
    flowLayout.sectionFootersPinToVisibleBounds = YES;
    
    // 创建一个UICollectionView对象
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    // UICollectionView默认的背景色是黑色
    collectionView.backgroundColor = [UIColor orangeColor];
    
    // 设置数据源
    collectionView.dataSource = self;
    // 设置代理
    collectionView.delegate = self;
    
    // 为UICollectionView注册一个cell
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:strId];
    
    // 注册一个Header
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:strIdHeader];
    // 注册一个footer
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:strIdFooter];
}
- (IBAction)animateAction:(UIBarButtonItem *)sender {
    // 创建一个初始化UICollectionView的layout对象
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    // 设置最小的行距
    flowLayout.minimumLineSpacing = 100;
    // 设置最小的列间距
    flowLayout.minimumInteritemSpacing = 20;
    // 设置每个cell的尺寸
    flowLayout.itemSize = CGSizeMake(350, 80);
    // 设置section的边距
    flowLayout.sectionInset = UIEdgeInsetsMake(30, 30, 30, 30);
    // 设置header 的高度, 和我们的TableView的header一样(CollectionView有一个滚动方向, 当垂直滚动的时候, 高度起作用, 当水平滚动的时候, 宽度起作用)
    flowLayout.headerReferenceSize = CGSizeMake(80, 44);
    flowLayout.footerReferenceSize = CGSizeMake(44, 80);
    
    // 滚动的方向
    //flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    // 固定header/Footer
    flowLayout.sectionHeadersPinToVisibleBounds = YES;
    flowLayout.sectionFootersPinToVisibleBounds = YES;
    
    [self.collectionView setCollectionViewLayout:flowLayout animated:YES];
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
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:strId forIndexPath:indexPath];
    
    cell.contentView.backgroundColor = QLColorRandom;
    // 绝对不要在CollectionViewCell创建的时候使用下面的方法, 否则翻脸挂掉
    //if (cell == nil) {
    //    cell = [[UICollectionViewCell alloc] init];
    //}
    return cell;
}
//@optional
//// The view that is returned must be retrieved from a call to -dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *headerFooterView = nil;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) { // header
        headerFooterView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:strIdHeader forIndexPath:indexPath];
        headerFooterView.backgroundColor = [UIColor greenColor];
    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) { // footer
        headerFooterView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:strIdFooter forIndexPath:indexPath];
        headerFooterView.backgroundColor = [UIColor redColor];
    }
    return headerFooterView;
}

#pragma mark - UICollectionViewDelegate
/** 选中了CollectionView中第indexPath位置的cell */
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld-%ld", indexPath.section, indexPath.item);
}

@end
