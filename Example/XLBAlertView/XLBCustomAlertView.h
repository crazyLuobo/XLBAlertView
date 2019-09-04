//
//  XLBCustomAlertView.h
//  Xcodetry
//
//  Created by iOS002 on 2019/9/4.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XLBBaseAlertView.h>
NS_ASSUME_NONNULL_BEGIN

@interface XLBCustomAlertView : XLBBaseAlertView
- (instancetype)initWithFrame:(CGRect)frame WithTitle:(NSString *)title WithMessage:(NSString *)message;
@end

NS_ASSUME_NONNULL_END
