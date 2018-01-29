//
//  BusinessAddress.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/9/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "JSONModel.h"

@protocol BusinessAddress

@end

@interface BusinessAddress : JSONModel

@property (assign, nonatomic) int id;
@property (assign, nonatomic) int businessId;
@property (strong, nonatomic) NSString <Optional> *address;
@property (strong, nonatomic) NSString <Optional>  *city;
@property (strong, nonatomic) NSString <Optional>  *country;
@property (strong, nonatomic) NSString <Optional>  *postCode;


+(BOOL)propertyIsOptional:(NSString*)propertyName;
+(BOOL)propertyIsIgnored:(NSString*)propertyName;

@end
