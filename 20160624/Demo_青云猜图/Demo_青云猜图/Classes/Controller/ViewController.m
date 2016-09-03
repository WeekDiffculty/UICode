//
//  ViewController.m
//  Demo_青云猜图
//
//  Created by qingyun on 16/6/24.
//  Copyright © 2016年 qingyun. All rights reserved.
//

/*!
 * 未完成总结:
 *  1, 金币
 *  //2, 提示
 *  //3, 大图
 *  //4, OptionView
 */

#import "ViewController.h"
#import "QYAnswerView.h"
#import "QYOptionView.h"
#import "QYQuestionModel.h"

static CGFloat const QYGuessCoinDelta = 1000;

@interface ViewController () <QYAnswerViewDelegate>
{
    /** 金币 */
    __weak IBOutlet UIButton *_btnCoin;
    /** currentNum / 总数 */
    __weak IBOutlet UILabel *_lblNumInTotal;
    /** 提示文字 */
    __weak IBOutlet UILabel *_lblDescription;
    /** 图片 */
    __weak IBOutlet UIImageView *_imageView;
    /** answerView的容器 */
    __weak IBOutlet UIView *_viewAnswerContainer;
    
    /** 答案视图 */
    __weak QYAnswerView *_answerView;
    
    /** 选项视图 */
    __weak QYOptionView *_optionView;
    
    /** 当前的索引 */
    NSInteger _indexCurrent;
}

/** 问题模型的数组 */
@property (nonatomic, copy) NSArray *arrQuestionModels;

@end

@implementation ViewController

- (NSArray *)arrQuestionModels {
    if (!_arrQuestionModels) {
        NSString *strPath = [[NSBundle mainBundle]pathForResource:@"questions" ofType:@"plist"];
        NSArray *arrQuestions = [NSArray arrayWithContentsOfFile:strPath];
        NSUInteger count = arrQuestions.count;
        NSMutableArray *arrMTemp = [NSMutableArray arrayWithCapacity:count];
        for (NSUInteger index = 0; index < count; index ++) {
            NSDictionary *dicData = arrQuestions[index];
            QYQuestionModel *model = [QYQuestionModel questionModelWithDictionary:dicData];
            [arrMTemp addObject:model];
        }
        _arrQuestionModels = [arrMTemp copy];
    }
    return _arrQuestionModels;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDefaultSetting];
    // 加载默认的数据
    [self updateUIWithQuestion:self.arrQuestionModels[_indexCurrent]];
}

/** 加载默认UI */
- (void)loadDefaultSetting {
    // 添加 QYOptionView
    QYOptionView *optionView = [QYOptionView optionView];
    CGRect optionViewBounds = optionView.bounds;
    CGFloat optionViewCenterY = CGRectGetMaxY(_viewAnswerContainer.frame) + 20 + optionViewBounds.size.height * 0.5;
    optionView.center = CGPointMake(self.view.center.x, optionViewCenterY);
    [self.view addSubview:optionView];
    _optionView = optionView;
    [_optionView setBlkDidChooseButton:^(NSString *strTitle, BOOL isTip, NSInteger indexTip) {
        [_answerView pushWord:strTitle isTip:isTip index:indexTip];
    }];
}

// 更新UI数据
- (void)updateUIWithQuestion:(QYQuestionModel *)question {
    // 1, num/Total
    //NSInteger index = [self.arrQuestionModels indexOfObject:question];
    _lblNumInTotal.text = [NSString stringWithFormat:@"%ld/%ld", _indexCurrent + 1, self.arrQuestionModels.count];
    
    // 2, description
    _lblDescription.text = question.strDecription;
    
    // 3, 加载图片
    _imageView.image = [UIImage imageNamed:question.strIcon];
    
    // 4, 动态加载AnswerView
    // 加载QYAnswerView(动态加载数据的时候加载的)
    // 移除上一次的answerView
    // 1, 把_viewAnswerContainer子视图全部移除
    //[_viewAnswerContainer.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    // 2, 每一次都把answerView保存为一个属性
    [_answerView removeFromSuperview];
    QYAnswerView *answerView = [QYAnswerView answerViewWithWordCount:question.strAnswer.length];
    CGSize sizeAnswerView = _viewAnswerContainer.bounds.size;
    answerView.center = CGPointMake(sizeAnswerView.width/2, sizeAnswerView.height/2);
    answerView.strAnswer = question.strAnswer;
    answerView.delegate = self;
    [answerView setBlkDidCompleteCollectting:^(BOOL isRight) {
        if (isRight) {
            // 延迟执行下一题操作
            [self performSelector:@selector(nextAction) withObject:nil afterDelay:1.0];
            // 加分
            NSString *strCoin = [_btnCoin titleForState:UIControlStateNormal];
            NSInteger coin = strCoin.integerValue + QYGuessCoinDelta;
            NSString *strCoinFinal = [NSString stringWithFormat:@"%ld", coin];
            [_btnCoin setTitle:strCoinFinal forState:UIControlStateNormal];
            //_optionView.userInteractionEnabled = NO;
            //[self performSelector:@selector(activeOptionView) withObject:nil afterDelay:1.0];
            [self activeOptionView];
        }
    }];
    [_viewAnswerContainer addSubview:answerView];
    _answerView = answerView;
    
    // 5, 设置optionView的数据
    _optionView.arrButtonTitles = question.arrOptions;
    _optionView.strAnswer = question.strAnswer;
}

#pragma mark - 🎬 Action Methods
/** 提示 */
- (IBAction)tipAction {
    BOOL isScuessful = [_optionView tipOnetime];
    if (isScuessful) {
        NSString *strCoin = [_btnCoin titleForState:UIControlStateNormal];
        NSInteger coin = strCoin.integerValue - QYGuessCoinDelta;
        NSString *strCoinFinal = [NSString stringWithFormat:@"%ld", coin];
        [_btnCoin setTitle:strCoinFinal forState:UIControlStateNormal];
    }
}
/** 大图 */
- (IBAction)plusImageAction {
    
    // 添加清楚按钮
    UIButton *btnClear = [UIButton buttonWithType:UIButtonTypeCustom];
    btnClear.frame = self.view.bounds;
    [btnClear addTarget:self action:@selector(clearAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnClear];
    
    [self.view bringSubviewToFront:_imageView];
    [UIView animateWithDuration:0.5 animations:^{
        _imageView.transform = CGAffineTransformMakeScale(1.3, 1.3);
    }];
    
}
/** 帮助 */
- (IBAction)helpAction {
}
/** 下一题 */
- (IBAction)nextAction {
    NSInteger index = ++ _indexCurrent;
    if (index == 10) {
        _indexCurrent = 0;
    }
    [self updateUIWithQuestion:self.arrQuestionModels[_indexCurrent]];
}

- (void)clearAction:(UIButton *)button {
    [UIView animateWithDuration:0.5 animations:^{
        // CGAffineTransformIdentity: 清除所有的transform
        _imageView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [button removeFromSuperview];
    }];
}

- (void)activeOptionView {
    //_optionView.userInteractionEnabled = YES;
    NSArray *arrSubViews = _optionView.subviews;
    for (UIButton *button in arrSubViews) {
        button.enabled = NO;
    }
}

#pragma mark - QYAnswerViewDelegate
- (void)answerView:(QYAnswerView *)answerView didTapedButtonWithTitle:(NSString *)strTitle {
    [_optionView lightButtonWithTitle:strTitle];
}

@end
