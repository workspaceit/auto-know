//
//  BusinessCategory.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/9/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "JSONModel.h"

@protocol BusinessCategory

@end

@interface BusinessCategory : JSONModel


@property (assign, nonatomic) int id;
@property (strong, nonatomic) NSString <Optional> *categoryDisplayValue;
@property (strong, nonatomic) NSString <Optional>  *createdDate;
@property (strong, nonatomic) NSString <Optional>  *categoryValue;



+(BOOL)propertyIsOptional:(NSString*)propertyName;
+(BOOL)propertyIsIgnored:(NSString*)propertyName;


@end
