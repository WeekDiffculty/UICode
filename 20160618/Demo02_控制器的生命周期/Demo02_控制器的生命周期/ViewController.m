//
 

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *arrObjects;

@end

@implementation ViewController

- (NSArray *)arrObjects  {
    if (_arrObjects == nil) {
        [self loadView];
        [self viewDidLoad];
        NSLog(@"我被调用了》》》》》》》");
    }
    return _arrObjects;
}

// 懒加载 控制器的view的加载的时候自动调用的
// 如果自定义了这个方法，那么就没有必要在里面调用[super loadView]
- (void)loadView {
    //[super loadView];
    // 自定义控制器视图的时候，不需要设置该视图的frame
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    self.view = view;
    
    NSLog(@"%s", __FUNCTION__);
}

// 当控制器的view加载完成之后就会自动调用
- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加自定义的子视图
    NSLog(@"%s", __FUNCTION__);
}

// view即将显示
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    
    NSLog(@"%s", __FUNCTION__);
}

// view已经显示
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear: animated];
    
    NSLog(@"%s", __FUNCTION__);
}

// view即将消失
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear: animated];
    
    NSLog(@"%s", __FUNCTION__);
}

// view已经消失 的时候调用
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear: animated];
    
    NSLog(@"%s", __FUNCTION__);
}

// 当前对象从内存中销毁的时候就会调用这个方法
- (void)dealloc {
    // 释放一些内存空间
    NSLog(@"%s", __FUNCTION__);
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"%@", self.arrObjects);
//}

@end
