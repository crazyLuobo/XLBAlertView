//
//  XLBBaseAlertView.h
//  Xcodetry
//
//  Created by iOS002 on 2019/9/4.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLBAlertViewBaseProtocol.h"
@class XLBAlertView;
NS_ASSUME_NONNULL_BEGIN

typedef void(^ClickCancleBlock)(void);
typedef void(^ClickBtnBlock)(NSInteger clickIndex);
@interface XLBBaseAlertView : UIView<XLBAlertViewBaseProtocol>
@property (nonatomic, weak) XLBAlertView *contentAlertView;
@property (nonatomic, copy) ClickCancleBlock clickCancleBlock;
@property (nonatomic, copy) ClickBtnBlock clickBtnBlock;
- (void)alertDismiss;
@end

NS_ASSUME_NONNULL_END
