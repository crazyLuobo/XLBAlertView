//
//  XLBAlertViewFactory.h
//  Xcodetry
//
//  Created by iOS002 on 2019/9/4.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <XLBBaseAlertView.h>
NS_ASSUME_NONNULL_BEGIN

@interface XLBAlertViewFactory : NSObject
+ (void)showTitle:(NSString *)title withMessage:(NSString *)message withClickBtnBlock:(ClickBtnBlock)clickBtnBlock withClickCancelBlock:(ClickCancleBlock)clickCancleBlock;
+ (void)ImageUrl:(NSString *)imageUrl withClickCancleBlock:(ClickCancleBlock)clickCancleBlock;
@end

NS_ASSUME_NONNULL_END
