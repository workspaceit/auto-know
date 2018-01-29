//
//  AdvertAddress.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/8/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "JSONModel.h"
#import "Country.h"
@interface AdvertAddress : JSONModel

@property (assign, nonatomic) int advertId;
@property (assign, nonatomic) int id;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *location;
@property (strong, nonatomic) NSString *postCode;
@property (strong, nonatomic) Country <Optional> *country;
@property (strong, nonatomic) NSString *lat;
@property (strong, nonatomic) NSString *lng;
//Addtional Info
//@property (strong,nonatomic) NSString <Optional> *cudtomId;
//@property (strong,nonatomic) NSString <Optional>*ref;
//@property (strong,nonatomic) NSString <Optional>*info;
//@property (strong,nonatomic) NSString <Optional>*misc;


+(BOOL)propertyIsOptional:(NSString*)propertyName;
+(BOOL)propertyIsIgnored:(NSString*)propertyName;

@end
