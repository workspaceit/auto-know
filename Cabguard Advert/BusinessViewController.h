//
//  BusinessViewController.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 10/30/17.
//  Copyright © 2017 Workspace Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Advert.h"
@interface BusinessViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *companyNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *companyTypeLabel;
@property (strong, nonatomic) IBOutlet UILabel *websiteLabel;
@property (strong, nonatomic) IBOutlet UILabel *phoneNoLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UILabel *discountLabel;
@property (strong, nonatomic) IBOutlet UITextView *offerText;



@property (strong,nonatomic) Advert* advert;
@end
