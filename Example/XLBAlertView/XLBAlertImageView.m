//
//  XLBAlertImageView.m
//  Xcodetry
//
//  Created by iOS002 on 2019/9/4.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import "XLBAlertImageView.h"
@interface XLBAlertImageView()
@property (nonatomic, strong) UIImageView *backImageView;
@property (nonatomic, strong) UIButton *cancleBtn;

@end
@implementation XLBAlertImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self layoutXLBAlertImageView];
    }
    return self;
}

- (void)layoutXLBAlertImageView
{
    [self addSubview:self.backImageView];
    
    [self addSubview:self.cancleBtn];
   
}


#pragma mark - getter and setter
- (UIImageView *)backImageView
{
    if (!_backImageView) {
        _backImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _backImageView.image = [UIImage imageNamed:@"showImage"];
    }
    return _backImageView;
}

- (UIButton *)cancleBtn
{
    if (!_cancleBtn) {
        _cancleBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 60, 10, 60, 20)];
        [_cancleBtn setTitle:@"关闭" forState:UIControlStateNormal];
        [_cancleBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
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
