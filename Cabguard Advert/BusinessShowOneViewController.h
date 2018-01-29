//
//  BusinessShowOneViewController.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/9/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Business.h"

@interface BusinessShowOneViewController : UIViewController

@property (strong,nonatomic) Business *business;
@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *type;
@property (strong, nonatomic) IBOutlet UITextView *about;

@end
