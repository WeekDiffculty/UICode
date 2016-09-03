//
//  QYNavigationController.m
//  Demo03_微博
//
//  Created by qingyun on 16/6/28.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "QYNavigationController.h"

@interface QYNavigationController ()

@end

@implementation QYNavigationController

//// app加载进内存的时候就会调用这个方法
//+ (void)load {
//    
//}

// 第一次用这个类的时候调用这个方法
+ (void)initialize {
    // 调用UINavigationBar对象的appearance类方法返回了一个UINavigationBar对象,这个对象可以控制整个项目中这个对象对应的默认样式
    UINavigationBar *navBar = [UINavigationBar appearance];
    // 只有方法或者属性之后有标识:UI_APPEARANCE_SELECTOR的属性或者方法才可以在这里设置
    [navBar setBarTintColor:[UIColor orangeColor]];
    
    // 在当前的类中搜索appearance, 凡是看到方法最后有UI_APPEARANCE_SELECTOR的就可以设置, 以控制全局的样式
    // 这种方式只是控制一个默认的样式, 你可以在自己的控制器中设置, 以覆盖当前的设置
    //[UIToolbar appearance];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count != 0) {
        UIButton *btnBack = [UIButton buttonWithType:UIButtonTypeSystem];
        [btnBack setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
        [btnBack sizeToFit];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btnBack];
    }
    
    [super pushViewController:viewController animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
