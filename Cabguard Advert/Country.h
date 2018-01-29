//
//  Country.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/8/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "JSONModel.h"

@protocol Country

@end

@interface Country : JSONModel

@property (assign, nonatomic) int id;
@property (assign, nonatomic) int status;
@property (strong, nonatomic) NSString <Optional>  *iso;
@property (strong, nonatomic) NSString <Optional>  *iso3;
@property (strong, nonatomic) NSString <Optional>   *nickName;
@property (strong, nonatomic) NSString <Optional>  *numCode;
@property (strong, nonatomic) NSString <Optional>  *phoneCode;

+(BOOL)propertyIsOptional:(NSString*)propertyName;
+(BOOL)propertyIsIgnored:(NSString*)propertyName;



@end
