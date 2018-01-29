//
//  SignUpFirstViewController.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/7/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonTitle.h"

@interface SignUpFirstViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *closeBtn;
@property (nonatomic, strong) UITapGestureRecognizer *singleTap;
@property (strong, nonatomic) IBOutlet UIView *titleView;
@property (strong, nonatomic) IBOutlet UIView *firstnameView;
@property (strong, nonatomic) IBOutlet UIButton *nextBtn;
@property (strong, nonatomic) IBOutlet UIView *lastnameView;
@property (strong, nonatomic) IBOutlet UIView *phoneView;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UITextField *firstnameText;
@property (strong, nonatomic) IBOutlet UITextField *lastnameText;
@property (strong, nonatomic) IBOutlet UITextField *phoneText;

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
