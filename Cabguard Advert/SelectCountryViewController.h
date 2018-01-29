//
//  SelectCountryViewController.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/7/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountryResponse.h"

@interface SelectCountryViewController : UIViewController
{
    NSUserDefaults *defaults;
    NSString *baseurl;
}

@property (strong, nonatomic) CountryResponse *data;
@property (strong, nonatomic) IBOutlet UITableView *tableData;

@end
