//
//  CompanyType.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/10/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "JSONModel.h"

@protocol CompanyType

@end

@interface CompanyType : JSONModel

@property (assign, nonatomic) int id;
@property (strong, nonatomic) NSString <Optional>  *name;

+(BOOL)propertyIsOptional:(NSString*)propertyName;
+(BOOL)propertyIsIgnored:(NSString*)propertyName;

@end
