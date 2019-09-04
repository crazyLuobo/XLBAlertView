//
//  XLBAlertView.m
//  Xcodetry
//
//  Created by iOS002 on 2019/9/3.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import "XLBAlertView.h"

@interface XLBAlertView()
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIVisualEffectView *effectView;
@property (nonatomic, strong) UIView *showAlertView;
@property (nonatomic, assign) XLBAlertAnimationOptions animationOption;
@property(nonatomic, assign)BOOL visual;
@end

@implementation XLBAlertView



+ (void)showAlertContentView:(UIView *)alterView withAnimationOption:(XLBAlertAnimationOptions)animationOption
{
    XLBAlertView *alter = [[XLBAlertView alloc] init];
    alter.showAlertView = alterView;
    alter.animationOption = animationOption;
    alter.visual = NO;
    [alter show];
}

+ (void)showAlertContentView:(UIView *)alterView withAnimationOption:(XLBAlertAnimationOptions)animationOption withShowAlertBlock:(ShowAlterViewBlock)showBlock
{
    XLBAlertView *alter = [[XLBAlertView alloc] init];
    alter.showAlertView = alterView;
    alter.animationOption = animationOption;
    alter.visual = NO;
    if (showBlock) {
        showBlock(alter);
    }
    [alter show];
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        [self layoutXLBAlertView];
    }
    return self;
}

#pragma mark - 试图展示

- (void)show{
    // 用于隐藏已显示的键盘
    [[[UIInputViewController alloc] init] dismissKeyboard];
    
    // 防止多层叠加
    for (UIView *showAlterView in [UIApplication sharedApplication].delegate.window.subviews) {
        if ([showAlterView isKindOfClass:[XLBAlertView class]]) {
            XLBAlertView *alterView = (XLBAlertView *)showAlterView;
            [alterView remove];
        }
    }
    
    [[UIApplication sharedApplication].delegate.window addSubview:self];
    
    switch (self.animationOption) {
            case XLBAlertAnimationOptionNone:{
               self.showAlertView.alpha = 0.0;
                [UIView animateWithDuration:0.34 animations:^{
                    if (self.visual) {
                        self.effectView.effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
                    }
                    self.showAlertView.alpha = 1;
                }];
            }break;
            case XLBAlertAnimationOptionZoom:{
                [self.showAlertView.layer setValue:@(0) forKeyPath:@"transform.scale"];
                [UIView animateWithDuration:0.75 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:1.0
                                    options:UIViewAnimationOptionCurveEaseIn
                                 animations:^{
                                     if (self.visual) {
                                         self.effectView.effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
                                     }
                                     [self.showAlertView.layer setValue:@(1.0) forKeyPath:@"transform.scale"];
                                 } completion:nil];
            }break;
            case XLBAlertAnimationOptionTopToCenter:{
                CGPoint startPoint = CGPointMake(self.center.x, - CGRectGetHeight(self.contentView.frame));
                self.showAlertView.layer.position = startPoint;
                [UIView animateWithDuration:0.75 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:1.0
                                    options:UIViewAnimationOptionCurveEaseIn
                                 animations:^{
                                     if (self.visual) {
                                         self.effectView.effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
                                     }
                                     self.showAlertView.layer.position = self.center;
                                 } completion:nil];
            }break;
        default:
            break;
    }
}

- (void)remove{
    switch (self.animationOption) {
            case XLBAlertAnimationOptionNone:{
                [UIView animateWithDuration:0.3 animations:^{
                    if (self.visual) {
                        self.effectView.effect = nil;
                    }
                    self.showAlertView.alpha = 0.0;
                } completion:^(BOOL finished) {
                    [self removeFromSuperview];
                }];
            }break;
            case XLBAlertAnimationOptionZoom:{
                [UIView animateWithDuration:0.3 animations:^{
                    self.showAlertView.alpha = 0.0;
                    if (self.visual) {
                        self.effectView.effect = nil;
                    }
                } completion:^(BOOL finished) {
                    [self removeFromSuperview];
                }];
            }break;
            case XLBAlertAnimationOptionTopToCenter:{
                CGPoint endPoint = CGPointMake(self.center.x, CGRectGetHeight(self.frame) + CGRectGetHeight(self.contentView.frame));
                [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    if (self.visual) {
                        self.effectView.effect = nil;
                    }
                    self.showAlertView.layer.position = endPoint;
                } completion:^(BOOL finished) {
                    [self removeFromSuperview];
                }];
            }break;
        default:
            break;
    }
}


#pragma mark - 布局

- (void)layoutXLBAlertView
{
    self.frame = [UIScreen mainScreen].bounds;
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.backgroundColor = [UIColor clearColor];
    self.visual = NO;
    [self addSubview:self.effectView];
    
}

#pragma mark - setter

- (void)setShowAlertView:(UIView *)showAlertView
{
    _showAlertView = showAlertView;
    [self addSubview:_showAlertView];
    _showAlertView.center = self.center;
}

- (void)setVisual:(BOOL)visual{
    _visual = visual;
    if (visual) {
        self.effectView.backgroundColor = [UIColor clearColor];
    }else {
        self.effectView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:50.0/255];
    }
}

#pragma mark - getter
- (UIVisualEffectView *)effectView
{
    if (!_effectView) {
        _effectView = [[UIVisualEffectView alloc]init];
        _effectView.effect = nil;
        _effectView.frame = self.frame;
        _effectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _effectView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:102.0/255];
    }
    return _effectView;
}

@end
