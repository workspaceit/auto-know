//
//  Advert.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/8/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "JSONModel.h"
#import "AdvertAddress.h"
#import "AdvertOpening.h"
#import "AppCredential.h"
#import "Currency.h"
#import "CompanyType.h"

@protocol Advert

@end

@interface Advert : JSONModel


@property (strong, nonatomic) AppCredential <Optional> *creator;
@property (assign, nonatomic) int businessId;
@property (assign, nonatomic) int id;
@property (assign, nonatomic) double discount;
@property (assign, nonatomic) double price;
@property (strong, nonatomic) NSString <Optional> *offer;
@property (strong, nonatomic) NSString <Optional>  *picture;
@property (strong, nonatomic) NSString <Optional>  *limitation;
@property (strong, nonatomic) NSString <Optional>  *companyName;
@property (strong, nonatomic) NSString <Optional>  *website;
@property (strong, nonatomic) NSString <Optional> *phoneNumber;
@property (strong,nonatomic) NSString <Optional> *customId;
@property (strong,nonatomic) NSString <Optional> *ref;
@property (strong,nonatomic) NSString <Optional> *nb;
@property (strong,nonatomic) NSString <Optional> *misc;
@property  (assign,nonatomic) BOOL alwaysOpen;
@property (strong, nonatomic) AdvertAddress <Optional>  *advertAddress;
@property (strong, nonatomic) AdvertOpening <Optional>  *advertOpening;
@property (strong, nonatomic) Currency <Optional>  *currency;
@property (strong, nonatomic) Currency <Optional>  *discountCurrency;
@property (strong, nonatomic) CompanyType <Optional>  *companyType;
@property (strong, nonatomic) NSMutableArray <Optional>  *otherImages;
@property (strong,nonatomic) NSString <Optional> *onlineStoreAddress;
@property (strong,nonatomic) NSString <Optional> *salesLine;
@property (strong,nonatomic) NSString <Optional> *enquiries;
@property (strong,nonatomic) NSString <Optional> *aboutCompany;
@property (strong,nonatomic)  NSMutableArray <Optional> *advertOpenings;




+(BOOL)propertyIsOptional:(NSString*)propertyName;
+(BOOL)propertyIsIgnored:(NSString*)propertyName;

@end
