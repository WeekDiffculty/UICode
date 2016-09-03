//
//  QYQuestionModel.h
//  Demo_青云猜图
//
//  Created by qingyun on 16/6/24.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYQuestionModel : NSObject

/** 答案 */
@property (nonatomic, copy) NSString *strAnswer;

/** 图片 */
@property (nonatomic, copy) NSString *strIcon;

/** 描述文字 */
@property (nonatomic, copy) NSString *strDecription;

/** 选项文字 */
@property (nonatomic, copy) NSArray *arrOptions;

/** 初始化方法 */
+ (instancetype)questionModelWithDictionary:(NSDictionary *)dicData;

@end
