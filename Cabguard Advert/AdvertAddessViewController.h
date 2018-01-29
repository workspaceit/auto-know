//
//  AdvertAddessViewController.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 10/30/17.
//  Copyright © 2017 Workspace Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Advert.h"
@interface AdvertAddessViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *addressLabel;
@property (strong, nonatomic) IBOutlet UILabel *specialInfoLabel;
@property (strong, nonatomic) IBOutlet UILabel *additionalInfoLabel;
@property (strong,nonatomic) Advert *advert;
@end
