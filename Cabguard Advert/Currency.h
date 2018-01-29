//
//  Currency.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/10/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "JSONModel.h"

@protocol Currency

@end

@interface Currency : JSONModel

@property (assign, nonatomic) int id;
@property (assign, nonatomic) int sequence;
@property (strong, nonatomic) NSString <Optional> *createdDate;
@property (strong, nonatomic) NSString <Optional>  *currencyCode;

+(BOOL)propertyIsOptional:(NSString*)propertyName;
+(BOOL)propertyIsIgnored:(NSString*)propertyName;




@end
