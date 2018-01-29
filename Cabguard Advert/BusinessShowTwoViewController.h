//
//  BusinessShowTwoViewController.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/9/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Business.h"

@interface BusinessShowTwoViewController : UIViewController

@property (strong,nonatomic) Business *business;
@property (strong, nonatomic) IBOutlet UITextField *country;
@property (strong, nonatomic) IBOutlet UITextField *city;
@property (strong, nonatomic) IBOutlet UITextField *postcode;
@property (strong, nonatomic) IBOutlet UITextView *address;

@end
