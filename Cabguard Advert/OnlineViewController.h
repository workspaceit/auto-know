//
//  OnlineViewController.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 10/30/17.
//  Copyright © 2017 Workspace Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Advert.h"
#import "AdvertTiming.h"
@interface OnlineViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *onStoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *salesLabel;
@property (strong, nonatomic) IBOutlet UILabel *enquiriesLabel;
@property (strong, nonatomic) IBOutlet UILabel *aboutComapnyLabel;
@property (strong, nonatomic) IBOutlet UILabel *openingtimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *closingTimeLabel;

@property (strong,nonatomic) Advert *advert;
@end
