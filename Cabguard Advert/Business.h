//
//  Business.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/9/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "JSONModel.h"
#import "BusinessCategory.h"
#import "BusinessAddress.h"

@interface Business : JSONModel

@property (assign, nonatomic) int id;
@property (assign, nonatomic) int loginId;
@property (assign, nonatomic) int haveManyLocation;
@property (strong, nonatomic) NSString <Optional> *about;
@property (strong, nonatomic) NSString <Optional>  *name;
@property (strong, nonatomic) NSString <Optional>  *website;
@property (strong, nonatomic) NSString <Optional>  *registrationNumber;
@property (strong, nonatomic) NSString <Optional>  *startDate;
@property (strong, nonatomic) NSString <Optional>  *vatNumber;
@property (strong, nonatomic) NSString <Optional>  *createdDate;
@property (strong, nonatomic) BusinessCategory <Optional>  *businessCategory;
@property (strong, nonatomic) NSArray <BusinessAddress>  *address;


+(BOOL)propertyIsOptional:(NSString*)propertyName;
+(BOOL)propertyIsIgnored:(NSString*)propertyName;

@end
