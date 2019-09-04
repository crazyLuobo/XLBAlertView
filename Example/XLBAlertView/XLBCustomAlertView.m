//
//  XLBCustomAlertView.m
//  Xcodetry
//
//  Created by iOS002 on 2019/9/4.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import "XLBCustomAlertView.h"
@interface XLBCustomAlertView()
@property (nonatomic, strong) UIButton *cancleBtn;
@property (nonatomic, strong) UIButton *sureBtn;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *messageLabel;
@end
@implementation XLBCustomAlertView

- (instancetype)initWithFrame:(CGRect)frame WithTitle:(NSString *)title WithMessage:(NSString *)message
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 5;
        [self layoutXLBCustomAlertView];
        self.titleLabel.text = title;
        
    }
    return self;
}



- (void)layoutXLBCustomAlertView
{
    [self addSubview:self.titleLabel];
  
    
    [self addSubview:self.cancleBtn];
    
}


- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, self.frame.size.width, 20)];
        _titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _titleLabel;
}


- (UILabel *)messageLabel
{
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc] init];
        _messageLabel.font = [UIFont systemFontOfSize:15];
    }
    return _titleLabel;
}
- (UIButton *)cancleBtn
{
    if (!_cancleBtn) {
        _cancleBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, self.frame.size.width, 50)];
        [_cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_cancleBtn addTarget:self action:@selector(alertDismiss) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancleBtn;
}


- (void)alertDismiss
{
    [super alertDismiss];
    if (self.clickCancleBlock) {
        self.clickCancleBlock();
    }
}






@end
