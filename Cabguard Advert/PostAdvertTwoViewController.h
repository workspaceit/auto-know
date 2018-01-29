//
//  PostAdvertTwoViewController.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/7/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Country.h"
#import "Currency.h"
#import "CompanyType.h"
#import "Response.h"
#import "Country.h"
#import "CountryResponse.h"
#import "Advert.h"
@interface PostAdvertTwoViewController : UIViewController<UITextFieldDelegate>
{
    NSUserDefaults *defaults;
    NSString *baseurl;
}


@property (strong, nonatomic) Response *response;
@property (nonatomic, strong) UITapGestureRecognizer *singleTap;

@property (strong, nonatomic) IBOutlet UIView *cityView;
@property (strong, nonatomic) IBOutlet UIView *postcodeView;
@property (strong, nonatomic) IBOutlet UIView *addressView;
@property (strong, nonatomic) IBOutlet UIButton *nextBtn;
@property (strong, nonatomic) IBOutlet UIButton *backBtn;
@property (strong, nonatomic) IBOutlet UIView *customIdView;
@property (strong, nonatomic) IBOutlet UIView *refView;
@property (strong, nonatomic) IBOutlet UIView *infoView;
@property (strong, nonatomic) IBOutlet UIView *miscView;
@property (strong, nonatomic) IBOutlet UIView *aboutCompanyView;

@property (strong, nonatomic) IBOutlet UITextField *cityText;
@property (strong, nonatomic) IBOutlet UITextField *postcodeText;
@property (strong, nonatomic) IBOutlet UITextView *addressText;
@property (strong, nonatomic) IBOutlet UITextField *customId;
@property (strong, nonatomic) IBOutlet UITextField *refText;
@property (strong, nonatomic) IBOutlet UITextField *infoText;
@property (strong, nonatomic) IBOutlet UITextField *miscText;
@property (strong, nonatomic) IBOutlet UITextView *aboutCompanyText;

@property (strong, nonatomic) Currency *discountCurrency;
@property (strong, nonatomic) Currency *currency;
@property (strong, nonatomic) CompanyType *companyType;
@property (strong, nonatomic) NSString *companyTypeOther;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) NSString *companyName;
@property (strong, nonatomic) NSString *phoneNumber;
@property (strong, nonatomic) NSString *website;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *discount;
@property (strong, nonatomic) NSString *price;
@property (strong, nonatomic) NSString *descriptn;
@property (strong, nonatomic) NSString *town;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *postcode;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *openingDayFisrt;
@property (strong, nonatomic) NSString *openingDayLast;
@property (strong, nonatomic) NSString *openTime;
@property (strong, nonatomic) NSString *closeTime;
@property (strong, nonatomic) NSString *closingDayFirstStr;
@property (strong, nonatomic) NSString *closingDayLastStr;
@property (strong, nonatomic) NSString *limitationStr;
@property (strong, nonatomic) NSString *id;
@property(strong,nonatomic)   NSString *aboutCompany;
@property (assign, nonatomic) BOOL edit;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *loading;
@property (strong, nonatomic) NSMutableArray *otherImg;
@property (strong, nonatomic) NSString *bannerImage;
@property (strong, nonatomic) IBOutlet UIView *countryView;
@property (strong, nonatomic) IBOutlet UILabel *countryLbl;

@property (strong, nonatomic) NSString *custom;
@property (strong, nonatomic) NSString *ref;
@property (strong, nonatomic) NSString *info;
@property (strong, nonatomic) NSString *misc;
@property (strong, nonatomic) Country *country;
@property (strong, nonatomic) NSString *lat;
@property (strong, nonatomic) NSString *lng;
@property (assign , nonatomic) BOOL always_open;
@property  (strong, nonatomic) CountryResponse *countryData;
@property  (strong, nonatomic) Advert *advertData;
@end
