//
//  QYStatusModel.m
//  青云微博
//
//  Created by qingyun on 16/7/14.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYStatusModel.h"
#import "QYUserModel.h"
#import "NSString+QYString.h"

@implementation QYStatusModel

+ (instancetype)statusModelWithDictionary:(NSDictionary *)dicData {
    //NSAssert(dicData != nil, @"阿萨德GV是vasev8是v");
    if (dicData == nil || [dicData isKindOfClass:[NSNull class]]) return nil;
    QYStatusModel *status = [self new];
    
    /** created_at	string	微博创建时间 */
    status.strCreatedAt = dicData[@"created_at"];
    
    /** idstr	string	字符串型的微博ID */
    status.strIdstr = dicData[@"idstr"];
    
    /** text	string	微博信息内容 */
    status.strText = dicData[@"text"];
    
    /** source	string	微博来源 */
    status.strSource = dicData[@"source"];
    
    /** favorited	boolean	是否已收藏，true：是，false：否 */
    status.favorited = dicData[@"favorited"];
    
    /** original_pic	string	原始图片地址，没有时不返回此字段 */
    status.strOriginalPic = dicData[@"original_pic"];
    
    /** user	object	微博作者的用户信息字段 详细 */
    status.user = [QYUserModel userModelWithDictionary:dicData[@"user"]];
    
    /** retweeted_status	object	被转发的原微博信息字段，当该微博为转发微博时返回 详细 */
    status.retweetedStatus = [QYStatusModel statusModelWithDictionary:dicData[@"retweeted_status"]];
    
    /** reposts_count	int	转发数 */
    status.repostsCount = [dicData[@"reposts_count"] integerValue];
    
    /** comments_count	int	评论数 */
    status.commentsCount = [dicData[@"comments_count"] integerValue];
    
    /** attitudes_count	int	表态数 */
    status.attitudesCount = [dicData[@"attitudes_count"] integerValue];
    
    /** pic_urls array 微博图片 */
    NSArray *arrPicUrls = dicData[@"pic_urls"];
    if (arrPicUrls.count) {
        status.arrPicUrls = dicData[@"pic_urls"];
    } else {
        status.arrPicUrls = nil;
    }
    
    return status;
}

- (void)setStrCreatedAt:(NSString *)strCreatedAt {
    _strCreatedAt = [strCreatedAt copy];
    _strTimeDes = [NSString descriptionWithString:_strCreatedAt];
}

- (void)setStrSource:(NSString *)strSource {
    _strSource = strSource;
    if ([strSource isEqualToString:@""]) {
        _strSourceDes = @"";
        return;
    }
    NSRange rangeLeft = [_strSource rangeOfString:@">"];
    NSRange rangeRight = [_strSource rangeOfString:@"</"];
    NSRange rangeResult = NSMakeRange(rangeLeft.location + 1, rangeRight.location - rangeLeft.location - 1);
    _strSourceDes = [_strSource substringWithRange:rangeResult];
}

@end
