//
//  XLBBaseAlertView.m
//  Xcodetry
//
//  Created by iOS002 on 2019/9/4.
//  Copyright © 2019 iOS002. All rights reserved.
//

#import "XLBBaseAlertView.h"
#import "XLBAlertView.h"
@implementation XLBBaseAlertView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

// 用于消失
- (void)alertDismiss
{
    if (self.contentAlertView) {
        [self.contentAlertView remove];
    }
}


@end
