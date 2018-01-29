//
//  PostAdvertOneViewController.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/7/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Currency.h"
#import "CompanyType.h"
#import "Response.h"
#import "Advert.h"
@interface PostAdvertOneViewController : UIViewController<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UITextFieldDelegate>
{
    NSUserDefaults *defaults;
    NSString *baseurl;
     NSString *fineurl;
}

@property (strong, nonatomic) Response *response;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *loading;
@property (nonatomic) UIImagePickerController *imagePickerController;
@property (nonatomic, strong) UITapGestureRecognizer *singleTap;
@property (strong, nonatomic) IBOutlet UIView *discountView;
@property (strong, nonatomic) IBOutlet UIView *priceView;
@property (strong, nonatomic) IBOutlet UIView *descriptionView;
@property (strong, nonatomic) IBOutlet UIButton *nextBtn;
@property (strong, nonatomic) IBOutlet UIView *discountCurrencyView;
@property (strong, nonatomic) IBOutlet UIView *priceCurrencyView;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UITextField *discountText;
@property (strong, nonatomic) IBOutlet UITextField *priceText;
@property (strong, nonatomic) IBOutlet UITextView *descriptionText;
@property (strong, nonatomic) IBOutlet UITextField *companyNameText;
@property (strong, nonatomic) IBOutlet UILabel *companyTypeLabel;
@property (strong, nonatomic) IBOutlet UITextField *websiteText;
@property (strong, nonatomic) IBOutlet UITextField *phoneText;

@property (strong, nonatomic) IBOutlet UIView *companyTypeView;
@property (strong, nonatomic) IBOutlet UIView *companyNameView;
@property (strong, nonatomic) IBOutlet UIView *websiteView;
@property (strong, nonatomic) IBOutlet UIView *phoneView;

@property (strong, nonatomic) IBOutlet UILabel *discountCurrencyLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceCurrencyLabel;
@property (strong, nonatomic) IBOutlet UIScrollView *scrillView;


@property (strong, nonatomic) Currency *discountCurrency;
@property (strong, nonatomic) Currency *currency;
@property (strong, nonatomic) CompanyType *companyType;
@property (strong, nonatomic) NSString *companyTypeOther;
@property (strong, nonatomic) NSString *companyName;
@property (strong, nonatomic) NSString *phoneNumber;
@property (strong, nonatomic) NSString *website;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *imageStr;
@property (strong, nonatomic) NSString *discount;
@property (strong, nonatomic) NSString *price;
@property (strong, nonatomic) NSString *descriptn;
@property (strong, nonatomic) NSString *city;
@property (strong,nonatomic)  NSString *country;
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
@property (strong ,nonatomic) Advert *advertData;


@property (assign, nonatomic) BOOL typeChange;
@property (assign, nonatomic) BOOL newPost;
@property (assign, nonatomic) BOOL edit;
@property (assign, nonatomic) BOOL picChange;

@property (strong, nonatomic) NSString *customId;
@property (strong, nonatomic) NSString *ref;
@property (strong, nonatomic) NSString *info;
@property (strong, nonatomic) NSString *misc;
@property (assign , nonatomic) BOOL always_open;

@end
