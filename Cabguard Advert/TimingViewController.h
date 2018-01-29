//
//  TimingViewController.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 10/26/17.
//  Copyright © 2017 Workspace Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Currency.h"
#import "CompanyType.h"
#import "Country.h"
@interface TimingViewController :UIViewController<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UISwitch *alwaysOn;
@property (strong, nonatomic) IBOutlet UISwitch *alwaysSame;
@property (strong, nonatomic) IBOutlet UITableView *dayTable;

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
@property (strong, nonatomic) NSString *openingDayFisrt;
@property (strong, nonatomic) NSString *openingDayLast;
@property (strong, nonatomic) NSString *openTime;
@property (strong, nonatomic) NSString *closeTime;
@property (strong, nonatomic) NSString *closingDayFirstStr;
@property (strong, nonatomic) NSString *closingDayLastStr;
@property (strong, nonatomic) NSString *limitationStr;
@property (strong, nonatomic) NSString *id;
@property(strong,nonatomic)   NSString *aboutCompany;
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
@property (strong, nonatomic) NSString *lat;
@property (strong, nonatomic) NSString *lng;


@end
