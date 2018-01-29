//
//  AdverListViewController.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/7/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdvertResponse.h"
#import "Country.h"

@interface AdverListViewController : UIViewController
{
    NSUserDefaults *defaults;
    NSString *baseurl;
    NSString *fineurl;
}

@property (strong, nonatomic) CompanyType *companyType;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *tableDistance;
@property (strong, nonatomic) IBOutlet UIView *searchView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *searchHeight;
@property (strong, nonatomic) IBOutlet UITableView *tableData;
@property (nonatomic, strong) UITapGestureRecognizer *singleTap;
@property (strong, nonatomic) AdvertResponse *data;
@property (strong, nonatomic)  NSMutableArray *myObject;


@property (assign,nonatomic) int offset;
@property (assign,nonatomic) BOOL isData;
@property (assign,nonatomic) BOOL loaded;
@property (assign,nonatomic) BOOL edited;


@property (strong, nonatomic) IBOutlet UILabel *companyTypeLabel;
@property (strong, nonatomic) IBOutlet UITextField *cityText;
@property (strong, nonatomic) IBOutlet UITextField *postcodeText;
@property (strong, nonatomic) IBOutlet UIView *countryView;
@property (strong, nonatomic) IBOutlet UILabel *countyLbl;


@property (strong, nonatomic) IBOutlet UIView *cityView;
@property (strong, nonatomic) IBOutlet UIView *postcodeView;
@property (strong, nonatomic) IBOutlet UIButton *searchBtn;
@property (strong, nonatomic) IBOutlet UIView *companyTypeView;

@property (strong, nonatomic) IBOutlet UIButton *companyTypeCloseBtn;


@property (assign,nonatomic) BOOL search;
@property (strong,nonatomic) Country *country;

@end
