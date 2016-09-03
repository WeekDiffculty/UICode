//
//  User.h
//  Buying
//
//  Created by qingyun on 16/6/27.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Smoke.h"

@class UserViewController;
@protocol UserDelegate <NSObject>

- (void)user:(UserViewController *)user didCompleteBuyingSmoke:(Smoke *)smoke;

@end

@interface UserViewController : UIViewController

@property (nonatomic, copy) NSString *strBrand;
@property (nonatomic, weak) id<UserDelegate> delegate;

@end
