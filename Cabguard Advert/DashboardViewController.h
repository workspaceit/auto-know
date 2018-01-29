//
//  DashboardViewController.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/7/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Response.h"
#import "BusinessResponse.h"
#import "PayPalMobile.h"

@interface DashboardViewController : UIViewController<PayPalPaymentDelegate, UIPopoverControllerDelegate>
{
    NSUserDefaults *defaults;
    NSString *baseurl;
}
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *loading;

@property (strong, nonatomic) IBOutlet UIView *containerView;
@property(nonatomic, strong, readwrite) NSString *environment;
@property(nonatomic, assign, readwrite) BOOL acceptCreditCards;
@property(nonatomic, strong, readwrite) NSString *resultText;
@property(nonatomic, strong, readwrite) PayPalConfiguration *payPalConfig;

@property (strong, nonatomic) Response *data;
@property (strong, nonatomic) BusinessResponse *response;

@end
