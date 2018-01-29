//
//  SignUpSecondViewController.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/7/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonTitle.h"

@interface SignUpSecondViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *closeBtn;
@property (nonatomic, strong) UITapGestureRecognizer *singleTap;
@property (strong, nonatomic) IBOutlet UIView *houseView;
@property (strong, nonatomic) IBOutlet UIView *streetView;
@property (strong, nonatomic) IBOutlet UIView *cityView;
@property (strong, nonatomic) IBOutlet UIView *postView;
@property (strong, nonatomic) IBOutlet UIButton *backBtn;
@property (strong, nonatomic) IBOutlet UIButton *nextBtn;

@property (strong, nonatomic) IBOutlet UITextField *housenoText;
@property (strong, nonatomic) IBOutlet UITextField *streetText;
@property (strong, nonatomic) IBOutlet UITextField *cityText;
@property (strong, nonatomic) IBOutlet UITextField *postcodeTExt;

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
