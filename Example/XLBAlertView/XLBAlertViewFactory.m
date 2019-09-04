//
//  XLBAlertViewFactory.m
//  Xcodetry
//
//  Created by iOS002 on 2019/9/4.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import "XLBAlertViewFactory.h"
#import <XLBAlertView.h>
#import "XLBCustomAlertView.h"
#import "XLBAlertImageView.h"

@interface XLBAlertViewFactory()
@property (nonatomic, strong) XLBAlertView *showAlertView;
@property (nonatomic, strong) XLBBaseAlertView *customView;
@end
@implementation XLBAlertViewFactory



+ (void)showTitle:(NSString *)title withMessage:(NSString *)message withClickBtnBlock:(ClickBtnBlock)clickBtnBlock withClickCancelBlock:(ClickCancleBlock)clickCancleBlock
{
    XLBAlertViewFactory *factory = [[XLBAlertViewFactory alloc] init];
    XLBCustomAlertView *custom = [[XLBCustomAlertView alloc] initWithFrame:CGRectMake(0, 0, 200, 300) WithTitle:@"标题" WithMessage:@"哈哈哈哈你好啊"];
    factory.customView = custom;
    custom.clickCancleBlock = clickCancleBlock;
    custom.clickBtnBlock = clickBtnBlock;
    [XLBAlertView showAlertContentView:custom withAnimationOption:XLBAlertAnimationOptionZoom withShowAlertBlock:^(XLBAlertView * _Nonnull showAlterView) {
        custom.contentAlertView = showAlterView;
    }];
}

+ (void)ImageUrl:(NSString *)imageUrl withClickCancleBlock:(ClickCancleBlock)clickCancleBlock
{
    XLBAlertViewFactory *factory = [[XLBAlertViewFactory alloc] init];
    XLBAlertImageView *imageView = [[XLBAlertImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 300)];
    factory.customView = imageView;
    imageView.clickCancleBlock = clickCancleBlock;
    [XLBAlertView showAlertContentView:imageView withAnimationOption:XLBAlertAnimationOptionZoom withShowAlertBlock:^(XLBAlertView * _Nonnull showAlterView) {
          imageView.contentAlertView = showAlterView;
    }];
    
}


@end
