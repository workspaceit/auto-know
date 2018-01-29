//
//  AdvertImagesViewController.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 7/25/17.
//  Copyright © 2017 Workspace Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToastView.h"
#import "Currency.h"
#import "CompanyType.h"
#import <QBImagePickerController/QBImagePickerController.h> 
@interface AdvertImagesViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource,UINavigationControllerDelegate,UIImagePickerControllerDelegate,QBImagePickerControllerDelegate,UICollectionViewDelegateFlowLayout>
{
    NSUserDefaults *defaults;
    NSString *baseurl;
    
}
@property (strong, nonatomic) IBOutlet UIImageView *bannerImages;
@property (strong, nonatomic) IBOutlet UICollectionView *imagesCol;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *loader;
@property (strong,nonatomic) NSString *discount;
@property (strong,nonatomic) NSString *price;
@property (strong,nonatomic) NSString *descriptn;
@property (strong,nonatomic) NSString *website;
@property (strong,nonatomic) NSString *companyName;
@property (strong,nonatomic) NSString *phoneNumber;
@property (strong, nonatomic) Currency *discountCurrency;
@property (strong, nonatomic) Currency *currency;
@property (strong, nonatomic) CompanyType *companyType;
@property (strong,nonatomic) NSString *bannerImagePath;
@property (strong,nonatomic) NSMutableArray *otherImagePaths;
@property (nonatomic) Boolean editable;
@end
