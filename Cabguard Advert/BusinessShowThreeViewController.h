//
//  BusinessShowThreeViewController.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/9/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Business.h"

@interface BusinessShowThreeViewController : UIViewController

@property (strong,nonatomic) Business *business;
@property (strong, nonatomic) IBOutlet UITextField *website;
@property (strong, nonatomic) IBOutlet UITextField *location;
@property (strong, nonatomic) IBOutlet UITextField *vat;
@property (strong, nonatomic) IBOutlet UITextField *registration;
@property (strong, nonatomic) IBOutlet UITextField *startDate;


@end
