//
//  BusinessCategoryResponse.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/9/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "JSONModel.h"
#import "ResponseStat.h"
#import "BusinessCategory.h"

@interface BusinessCategoryResponse : JSONModel

@property (strong, nonatomic) ResponseStat *responseStat;
@property (strong, nonatomic) NSArray <BusinessCategory>  *responseData;

+(BOOL)propertyIsOptional:(NSString*)propertyName;
+(BOOL)propertyIsIgnored:(NSString*)propertyName;

@end
