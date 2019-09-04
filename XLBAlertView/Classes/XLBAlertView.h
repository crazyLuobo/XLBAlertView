//
//  XLBAlertView.h
//  Xcodetry
//
//  Created by iOS002 on 2019/9/3.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XLBAlertView;
NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, XLBAlertAnimationOptions) {
    XLBAlertAnimationOptionNone = 0,
    XLBAlertAnimationOptionZoom ,       // First zoom in, and then shrink, in the reduction
    XLBAlertAnimationOptionTopToCenter, // From top to center
};

typedef void(^ShowAlterViewBlock)(XLBAlertView *showAlterView);

@interface XLBAlertView : UIView

+ (void)showAlertContentView:(UIView *)alterView withAnimationOption:(XLBAlertAnimationOptions)animationOption;

+ (void)showAlertContentView:(UIView *)alterView withAnimationOption:(XLBAlertAnimationOptions)animationOption withShowAlertBlock:(ShowAlterViewBlock)showBlock;

- (void)remove;
@end

NS_ASSUME_NONNULL_END
