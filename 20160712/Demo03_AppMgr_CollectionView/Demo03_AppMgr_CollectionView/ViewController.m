//
//  ViewController.m
//  Demo03_AppMgr_CollectionView
//
//  Created by qingyun on 16/7/12.
//  Copyright © 2016年 qingyun. All rights reserved.
//

// 如果使用StoryBoard的话还会使用自定义的Layout? 答案NO

/** Color Related */
#define QLColorWithRGB(redValue, greenValue, blueValue) ([UIColor colorWithRed:((redValue)/255.0) green:((greenValue)/255.0) blue:((blueValue)/255.0) alpha:1])
#define QLColorRandom QLColorWithRGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
#define QLColorFromHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#import "ViewController.h"
#import "QYAppModel.h"
#import "QYAppCell.h"

static NSString * const strId = @"Style";

@interface ViewController ()

// 存放App信息的数组
@property (nonatomic, copy) NSArray *arrResources;

@end

@implementation ViewController

#pragma mark - 💤 LazyLoad Methods
- (NSArray *)arrResources {
    if (!_arrResources) {
        // 通过NSURL加载本地文件路径
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"apps" withExtension:@"plist"];
        // 通过路径加载数组
        NSArray *arrResources = [NSArray arrayWithContentsOfURL:url];
        // 获取加载得到的数组的内容个数
        NSUInteger count = arrResources.count;
        // 新建一个有特定容量的可变数组
        NSMutableArray *arrMResources = [NSMutableArray arrayWithCapacity:count];
        // 字典转模型, 最后添加到可变数组中
        for (NSUInteger index = 0; index < count; index ++) {
            // 从资源中加载特定下标的字典
            NSDictionary *dicData = arrResources[index];
            // 根据获取到的字典创建一个QYAppModel对象
            QYAppModel *app = [QYAppModel appModelWithDictionary:dicData];
            // 把创建的对象添加到可变数组中
            [arrMResources addObject:app];
        }
        _arrResources = arrMResources;
    }
    return _arrResources;
}

//- (instancetype)init {
//    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
//    flowLayout.itemSize = CGSizeMake(70, 125);
//    
//    return [self initWithCollectionViewLayout:flowLayout];
//}
//
//- (instancetype)initWithCoder:(NSCoder *)aDecoder {
//    UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
//    flowLayout.itemSize = CGSizeMake(70, 125);
//    
//    return [self initWithCollectionViewLayout:flowLayout];
//}

#pragma mark - ♻️ LifeCycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDefaultSetting];
}

/** Load the default UI elements And prepare some datas needed. */
- (void)loadDefaultSetting {
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    // 注册cell
    //[self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:strId];
    
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
    layout.minimumLineSpacing = 30;
    layout.itemSize = CGSizeMake(70, 125);
    layout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
}
/** collectionView中第section组有多少个cell */
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.arrResources.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    QYAppCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:strId forIndexPath:indexPath];
    
    cell.appModel = self.arrResources[indexPath.item];
    
    //cell.contentView.backgroundColor = QLColorRandom;
    
    return cell;
}

@end
