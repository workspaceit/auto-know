//
//  PostAdvertThreeViewController.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/7/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Response.h"
#import "SubscriptionResponse.h"
#import "Currency.h"
#import "CompanyType.h"
#import "PayPalMobile.h"
#import "Country.h"
#import "Advert.h"

@interface PostAdvertThreeViewController : UIViewController<UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource,PayPalPaymentDelegate, UIPopoverControllerDelegate>
{
    NSUserDefaults *defaults;
    NSString *baseurl;
    
}

@property(nonatomic, strong, readwrite) NSString *environment;
@property(nonatomic, assign, readwrite) BOOL acceptCreditCards;
@property(nonatomic, strong, readwrite) NSString *resultText;
@property(nonatomic, strong, readwrite) PayPalConfiguration *payPalConfig;
@property (nonatomic, strong) UITapGestureRecognizer *singleTap;
@property (strong, nonatomic) IBOutlet UITextField *onlineStoreTxt;
@property (strong, nonatomic) IBOutlet UITextField *salesLine;
@property (strong, nonatomic) IBOutlet UITextField *enquiries;
@property (strong, nonatomic) IBOutlet UIButton *nextBtn;
@property (strong, nonatomic) IBOutlet UIButton *backBtn;
@property (strong, nonatomic) IBOutlet UIView *closingDayFirst;
@property (strong, nonatomic) IBOutlet UIView *closingDaySecond;
@property (strong, nonatomic) IBOutlet UIView *openingTime;
@property (strong, nonatomic) IBOutlet UIView *openingDayFirst;
@property (strong, nonatomic) IBOutlet UIView *openingDaySecond;
@property (strong, nonatomic) IBOutlet UIView *closingTime;
@property (strong, nonatomic) IBOutlet UIView *addressView;
@property (strong, nonatomic) IBOutlet UITextField *openingdayText;
@property (strong, nonatomic) IBOutlet UITextField *openingdayTwoText;
@property (strong, nonatomic) IBOutlet UITextField *opentimeText;
@property (strong, nonatomic) IBOutlet UITextField *closetimeText;
@property (strong, nonatomic) IBOutlet UITextField *closingdayText;
@property (strong, nonatomic) IBOutlet UITextField *closingdayTwoText;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *loading;
@property (strong, nonatomic) IBOutlet UITextView *limitation;
@property (strong, nonatomic) IBOutlet UIButton *tncBtn;
@property (strong, nonatomic) IBOutlet UISwitch *tncSwitch;

@property (strong, nonatomic)  NSMutableArray *myObject;

@property (strong, nonatomic) UIPickerView *datePicker1;
@property (strong, nonatomic) UIPickerView *datePicker2;
@property (strong, nonatomic) UIPickerView *datePicker5;
@property (strong, nonatomic) UIPickerView *datePicker6;

@property (strong, nonatomic) Response *response;
@property (strong, nonatomic) SubscriptionResponse *responseSub;

@property (strong, nonatomic) Currency *discountCurrency;
@property (strong, nonatomic) Currency *currency;
@property (strong, nonatomic) CompanyType *companyType;
@property (strong, nonatomic) NSString *companyTypeOther;

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
@property(strong,nonatomic)   NSString *aboutCompany;
@property (strong, nonatomic) NSString *openingDayFisrt;
@property (strong, nonatomic) NSString *openingDayLast;
@property (strong, nonatomic) NSString *openTime;
@property (strong, nonatomic) NSString *closeTime;
@property (strong, nonatomic) NSString *closingDayFirstStr;
@property (strong, nonatomic) NSString *closingDayLastStr;
@property (strong, nonatomic) NSString *limitationStr;
@property (strong, nonatomic) NSString *id;
@property (strong, nonatomic) NSString *open1;
@property (strong, nonatomic) NSString *open2;
@property (strong, nonatomic) NSString *close1;
@property (strong, nonatomic) NSString *close2;
@property (strong, nonatomic) NSMutableArray *otherImgtokens;
@property (assign, nonatomic) BOOL edit;
@property (assign, nonatomic) BOOL change;
@property (strong, nonatomic) IBOutlet UISwitch *alwaysOn;
@property (strong, nonatomic) IBOutlet UIView *closeTimeView;
@property (strong, nonatomic) Country *country;
@property (strong, nonatomic) NSString *customId;
@property (strong, nonatomic) NSString *ref;
@property (strong, nonatomic) NSString *info;
@property (strong, nonatomic) NSString *misc;
@property (assign , nonatomic) BOOL always_open;
@property (strong, nonatomic) NSMutableArray *otherImg;
@property (strong, nonatomic) NSString *bannerImage;
@property (strong,nonatomic) NSString *onlineStoreAddress;
@property (strong,nonatomic) NSString *sales;
@property (strong,nonatomic) NSString *enquiry;
@property (strong,nonatomic) NSString *timings;
@property (assign,nonatomic) int serviceAlwaysOn ;
@property (strong, nonatomic) NSString *lat;
@property (strong, nonatomic) NSString *lng;
@property  (strong, nonatomic) Advert *advertData;
@end
