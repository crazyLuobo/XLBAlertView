//
//  XLBViewController.m
//  XLBAlertView
//
//  Created by yanwenbo_78201@163.com on 09/03/2019.
//  Copyright (c) 2019 yanwenbo_78201@163.com. All rights reserved.
//

#import "XLBViewController.h"
#import "XLBAlertViewFactory.h"
#import  <SXAlertView.h>
@interface XLBViewController ()

@end

@implementation XLBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)showImageAlertViewAciton:(id)sender {
    
    [XLBAlertViewFactory showTitle:@"777" withMessage:@"" withClickBtnBlock:^(NSInteger clickIndex) {
        
    } withClickCancelBlock:^{
        
    }];
}
- (IBAction)showWordAlertViewAction:(id)sender {
    [XLBAlertViewFactory ImageUrl:@"" withClickCancleBlock:^{
        
    }];
}
- (IBAction)showSXAlertViewAction:(id)sender {
    [SXAlertView showWithTitle:@"标准展示" message:@"这是标准展示，上边的是为了用于展示其他方面" cancelButtonTitle:@"取消" otherButtonTitle:@"确定" clickButtonBlock:^(SXAlertView * _Nonnull alertView, NSInteger buttonIndex) {
        
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
