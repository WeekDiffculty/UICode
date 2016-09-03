//
//  Parent.h
//  协议类型
//
//  Created by qingyun on 16/6/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TakeCare.h"
#import "Teach.h"
@interface Parent : NSObject <TakeCare,Teach>

@end
