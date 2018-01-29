//
//  BussinessDataThreeViewController.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/7/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BusinessCategory.h"
#import "Country.h"
#import "Response.h"

@interface BussinessDataThreeViewController : UIViewController
{
    NSUserDefaults *defaults;
    NSString *baseurl;
}

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *loading;
@property (strong, nonatomic) Response *response;
@property (nonatomic, strong) UITapGestureRecognizer *singleTap;
@property (strong, nonatomic) IBOutlet UIView *websiteView;
@property (strong, nonatomic) IBOutlet UIView *locationView;
@property (strong, nonatomic) IBOutlet UIView *vatView;
@property (strong, nonatomic) IBOutlet UIView *registrationView;
@property (strong, nonatomic) IBOutlet UIView *dateView;
@property (strong, nonatomic) IBOutlet UIButton *nextBtn;
@property (strong, nonatomic) IBOutlet UIButton *backBtn;

@property (strong, nonatomic) IBOutlet UITextField *websiteText;
@property (strong, nonatomic) IBOutlet UITextField *locationNotext;
@property (strong, nonatomic) IBOutlet UITextField *vatNoText;
@property (strong, nonatomic) IBOutlet UITextField *regNoText;
@property (strong, nonatomic) IBOutlet UITextField *startDateText;

@property (strong, nonatomic) BusinessCategory *type;
@property (strong, nonatomic) Country *country;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *shortDescription;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *postcode;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *website;
@property (strong, nonatomic) NSString *locationNo;
@property (strong, nonatomic) NSString *vatNo;
@property (strong, nonatomic) NSString *regNo;
@property (strong, nonatomic) NSString *startDate;


@property (assign, nonatomic) BOOL edit;


@end
