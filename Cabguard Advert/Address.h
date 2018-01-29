//
//  Address.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/8/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "JSONModel.h"

@interface Address : JSONModel

@property (assign, nonatomic) int id;
@property (strong, nonatomic) NSString  *houseNumber;
@property (strong, nonatomic) NSString  *street;
@property (strong, nonatomic) NSString  *city;
@property (strong, nonatomic) NSString  *postCode;
@property (strong, nonatomic) NSString  *createdDate;

+(BOOL)propertyIsOptional:(NSString*)propertyName;
+(BOOL)propertyIsIgnored:(NSString*)propertyName;

@end
