//
//  QYDetailViewController.m
//  青云微博
//
//  Created by qingyun on 16/7/15.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYDetailViewController.h"
#import "QYCommentModel.h"
#import "QYStatusCell.h"
#import "QYStatusModel.h"
#import "QYUserModel.h"
#import "QYCommentCell.h"

@interface QYDetailViewController () <NSObject>

@property (nonatomic, strong) NSMutableArray *arrCommentModels;

@end

@implementation QYDetailViewController

#pragma mark - 💤 LazyLoad Methods

- (NSArray *)arrCommentModels {
    if (!_arrCommentModels) {
        NSString *strFilePath = [[NSBundle mainBundle] pathForResource:@"comments" ofType:@"plist"];
        NSDictionary *dicComments = [NSDictionary dictionaryWithContentsOfFile:strFilePath];
        NSArray *arrComments = dicComments[@"comments"];
        NSUInteger count = arrComments.count;
        _arrCommentModels = [NSMutableArray arrayWithCapacity:count];
        for (NSUInteger index = 0; index < count; index ++) {
            NSDictionary *dicData = arrComments[index];
            QYCommentModel *comment = [QYCommentModel commentModelWithDictionary:dicData];
            [_arrCommentModels addObject:comment];
        }
    }
    return _arrCommentModels;
}

#pragma mark - ♻️ LifeCycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDefaultSetting];
}

/** Load the default UI elements And prepare some datas needed. */
- (void)loadDefaultSetting {
    self.tableView.estimatedRowHeight = 40;
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIEdgeInsets inset = self.tableView.contentInset;
    inset.bottom += CommentHeaderSpace;
    self.tableView.contentInset = inset;
}

#pragma mark - 🔌 Delegate Methods
#pragma mark UITableViewDataSource, UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section == 0 ? 1 : self.arrCommentModels.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        QYStatusCell *cell = [QYStatusCell cellWithTableView:tableView];
        
        QYStatusModel *status = self.status;
        cell.status = status;
        
        return cell;
    } else {
        QYCommentCell *cell = [QYCommentCell cellWithTableView:tableView];
        
        cell.indexPath = indexPath;
        QYCommentModel *comment = self.arrCommentModels[indexPath.row];
        cell.comment = comment;
        
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    QLLog(@"%s~%@", __FUNCTION__, indexPath);
    
}

@end
