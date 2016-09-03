//
//  QYQuestionModel.m
//  Demo_青云猜图
//
//  Created by qingyun on 16/6/24.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYQuestionModel.h"

@implementation QYQuestionModel

+ (instancetype)questionModelWithDictionary:(NSDictionary *)dicData {
    if (dicData == nil || [dicData isKindOfClass:[NSNull class]]) return nil;
    QYQuestionModel *question = [self new];
    question.strAnswer = dicData[@"answer"];
    question.strIcon = dicData[@"icon"];
    question.strDecription = dicData[@"title"];
    question.arrOptions = dicData[@"options"];
    
    return question;
}

@end
