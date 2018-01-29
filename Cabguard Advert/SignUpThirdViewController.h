//
//  SignUpThirdViewController.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/7/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonTitle.h"
#import "SIgnUpResponse.h"

@interface SignUpThirdViewController : UIViewController
{
    NSUserDefaults *defaults;
    NSString *baseurl;
}

@property (strong, nonatomic) IBOutlet UIView *emailView;
@property (strong, nonatomic) IBOutlet UIButton *closeBtn;
@property (nonatomic, strong) UITapGestureRecognizer *singleTap;
@property (strong, nonatomic) IBOutlet UIView *passwordView;
@property (strong, nonatomic) IBOutlet UIView *confirmPassword;
@property (strong, nonatomic) IBOutlet UIButton *nextBtn;
@property (strong, nonatomic) IBOutlet UIButton *backBtn;
@property (strong, nonatomic) IBOutlet UITextField *emailText;
@property (strong, nonatomic) IBOutlet UITextField *passText;
@property (strong, nonatomic) IBOutlet UITextField *confirmText;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *loading;

@property (strong, nonatomic) SIgnUpResponse *response;


@property (strong, nonatomic) PersonTitle *personTitle;
@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *phoneNo;
@property (strong, nonatomic) NSString *house;
@property (strong, nonatomic) NSString *street;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *postcode;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *pass;
@property (strong, nonatomic) NSString *confirmpass;

@end
