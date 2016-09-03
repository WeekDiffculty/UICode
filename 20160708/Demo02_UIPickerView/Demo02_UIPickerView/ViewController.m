//
//  ViewController.m
//  Demo02_UIPickerView
//
//  Created by qingyun on 16/7/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

/** Color Related */
#define QLColorWithRGB(redValue, greenValue, blueValue) ([UIColor colorWithRed:((redValue)/255.0) green:((greenValue)/255.0) blue:((blueValue)/255.0) alpha:1])
#define QLColorRandom QLColorWithRGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
#define QLColorFromHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#import "ViewController.h"

@interface ViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.pickerView.showsSelectionIndicator = YES;
    
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    
}

#pragma mark - 🔌 Delegate Methods
#pragma mark UIPickerViewDataSource
/** 选择器中有多少列/组件 */
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

/** 每个组件中有多少行 */
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 20;
}

#pragma mark UIPickerViewDelegate
/** 第component列组件的宽度 */
//- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
//    return 100;
//}
/** 第component列组件中每行的高度 */
//- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
//    return 60;
//}

/** 第component列组件中第row行的标题 */
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [NSString stringWithFormat:@"%ld- %ld", component, row];
}
/** 第component列组件中第row行的富文本标题 */
//- (nullable NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
//    
//}
/** 第component列组件中第row行的显示的View */
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view {
//    UIView *viewRow = [UIView new];
//    
//    viewRow.backgroundColor = QLColorRandom;
//    return viewRow;
    
    return [UIButton buttonWithType:UIButtonTypeInfoLight];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSLog(@"select-%@", [NSString stringWithFormat:@"%ld- %ld", component, row]);
}

@end
