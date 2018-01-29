//
//  SelectionViewController.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/10/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CurrencyResponse.h"
#import "CompanyTypeResponse.h"
#import "CountryResponse.h"
@interface SelectionViewController : UIViewController
{
    NSUserDefaults *defaults;
    NSString *baseurl;
}


@property (strong, nonatomic) IBOutlet UITableView *tableData;
@property (strong, nonatomic) CurrencyResponse *currencyData;
@property (strong, nonatomic) CompanyTypeResponse *typeData;
@property  (strong, nonatomic) CountryResponse *countryData;

@property (assign, nonatomic) int type;
@property (assign, nonatomic) BOOL edit;

@end
