//
//  ViewController.m
//  Demo01_GroupBuying
//
//  Created by qingyun on 16/7/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYGroupBuyingController.h"
#import "QYGoodsModel.h"
#import "QYGoodsCell.h"
#import "QYAdsCell.h"

@interface QYGroupBuyingController () <UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
/** 所有商品的模型数组 */
@property (nonatomic, copy) NSArray *arrGoodsModels;

@end

@implementation QYGroupBuyingController

/** 懒加载数组模型数据 */
- (NSArray *)arrGoodsModels {
    if (_arrGoodsModels == nil) {
        // 获取资源路径
        NSString *strPath = [[NSBundle mainBundle] pathForResource:@"GroupBuying" ofType:@"plist"];
        // 从资源路径加载数组
        NSArray *arrGoods = [NSArray arrayWithContentsOfFile:strPath];
        // 创建一个临时的可变数组
        NSMutableArray *arrMGoodsModels = [NSMutableArray arrayWithCapacity:arrGoods.count];
        // 循环遍历创建模型, 并添加到可变数组中
        for (NSDictionary *dicData in arrGoods) {
            QYGoodsModel *model = [QYGoodsModel modelWithDictionary:dicData];
            [arrMGoodsModels addObject:model];
        }
        // 最终赋值
        _arrGoodsModels = [arrMGoodsModels copy];
    }
    return _arrGoodsModels;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView setContentInset:UIEdgeInsetsMake(20, 0, 0, 0)];
    [self.tableView setRowHeight:130];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // 数组内容的个数就是cell的个数
    return self.arrGoodsModels.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 取出模型
    QYGoodsModel *model = self.arrGoodsModels[indexPath.row];
    if (model.goodsType == QYGoodsTypeAdvertisement) { // 广告
        QYAdsCell *cell = [QYAdsCell cellWithTableView:tableView];
        
        cell.goodsModel = model;
        
        return cell;
    } else { // 正常的cell
        // 搞一个cell
        QYGoodsCell *cell = [QYGoodsCell cellWithTableView:tableView];
        
        // 覆盖数据
        cell.goodsModel = model;
        
        return cell;
    }
}

@end
