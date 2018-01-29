//
//  AdvertDetailsViewController.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/10/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Advert.h"
#import "Response.h"

@interface AdvertDetailsViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSUserDefaults *defaults;
    NSString *baseurl;
    NSString *fineurl;
}

@property (strong, nonatomic) Advert *data;
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *price;
@property (strong, nonatomic) IBOutlet UILabel *discount;
@property (strong, nonatomic) IBOutlet UILabel *openingtime;
@property (strong, nonatomic) IBOutlet UILabel *location;
@property (strong, nonatomic) IBOutlet UILabel *descriptionValue;
@property (strong, nonatomic) IBOutlet UILabel *companyName;
@property (strong, nonatomic) Response *response;
@property (strong, nonatomic) IBOutlet UIButton *editBtn;
@property (strong, nonatomic) IBOutlet UILabel *companyTypeLabel;
@property (strong, nonatomic) IBOutlet UILabel *aboutCompanyLabel;
@property (strong, nonatomic) IBOutlet UILabel *website;
@property (strong, nonatomic) IBOutlet UILabel *closingtime;
@property (strong, nonatomic) IBOutlet UILabel *phoneNumber;
@property (strong, nonatomic) IBOutlet UILabel *additionalLabel;
@property (strong, nonatomic) IBOutlet UICollectionView *imagesCollection;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *basicViewContainer;
@property (strong, nonatomic) IBOutlet UIView *addressViewContainer;
@property (strong, nonatomic) IBOutlet UIView *onlineViewContainer;
@property (assign, nonatomic) int state;
@property (assign, nonatomic) BOOL edited;

@property (strong, nonatomic) IBOutlet UIButton *basic;
@property (strong, nonatomic) IBOutlet UIButton *address;
@property (strong, nonatomic) IBOutlet UIButton *others;
@property (assign ,nonatomic) BOOL isAlwaysOpen;

@property (strong, nonatomic) UIImage *editedImg;
@property (assign,nonatomic)  long selectedImage;
@end
