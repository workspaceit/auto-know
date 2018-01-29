//
//  BussinessDataOneViewController.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/7/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BusinessCategory.h"
#import "Response.h"

@interface BussinessDataOneViewController : UIViewController
{
    NSUserDefaults *defaults;
    NSString *baseurl;
}

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *loading;
@property (strong, nonatomic) Response *response;
@property (nonatomic, strong) UITapGestureRecognizer *singleTap;
@property (strong, nonatomic) IBOutlet UIView *nameView;
@property (strong, nonatomic) IBOutlet UIView *typeView;
@property (strong, nonatomic) IBOutlet UIView *descriptionView;
@property (strong, nonatomic) IBOutlet UIButton *nextBtn;

@property (strong, nonatomic) IBOutlet UITextField *nameText;
@property (strong, nonatomic) IBOutlet UILabel *typeLabel;
@property (strong, nonatomic) IBOutlet UITextView *descriptionText;

@property (strong, nonatomic) BusinessCategory *type;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *shortDescription;

@property (assign, nonatomic) BOOL edit;
@property (assign, nonatomic) BOOL typeChange;

@end
