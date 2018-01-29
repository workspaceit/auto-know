//
//  BussinessDataTwoViewController.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/7/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BusinessCategory.h"
#import "BusinessAddress.h"
#import "Country.h"
#import "Response.h"

@interface BussinessDataTwoViewController : UIViewController
{
    NSUserDefaults *defaults;
    NSString *baseurl;
}

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *loading;
@property (strong, nonatomic) Response *response;
@property (nonatomic, strong) UITapGestureRecognizer *singleTap;
@property (strong, nonatomic) IBOutlet UIView *countryView;
@property (strong, nonatomic) IBOutlet UIView *cityView;
@property (strong, nonatomic) IBOutlet UIView *postcodeView;
@property (strong, nonatomic) IBOutlet UIView *addressView;
@property (strong, nonatomic) IBOutlet UIButton *nextBtn;
@property (strong, nonatomic) IBOutlet UIButton *backBtn;
@property (strong, nonatomic) IBOutlet UITextField *cityText;
@property (strong, nonatomic) IBOutlet UILabel *countryLabel;
@property (strong, nonatomic) IBOutlet UITextField *postcodeText;
@property (strong, nonatomic) IBOutlet UITextView *addressText;





@property (strong, nonatomic) Country *country;
@property (strong, nonatomic) BusinessCategory *type;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *shortDescription;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *postcode;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *countryName;
@property (strong, nonatomic) BusinessAddress *addreessB;
@property (assign, nonatomic) BOOL edit;
@property (assign, nonatomic) BOOL countryChange;


@end
