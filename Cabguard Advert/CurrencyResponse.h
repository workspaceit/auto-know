//
//  CurrencyResponse.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/10/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "JSONModel.h"
#import "ResponseStat.h"
#import "Currency.h"

@interface CurrencyResponse : JSONModel

@property (strong, nonatomic) ResponseStat *responseStat;
@property (strong, nonatomic) NSArray <Currency>  *responseData;

+(BOOL)propertyIsOptional:(NSString*)propertyName;
+(BOOL)propertyIsIgnored:(NSString*)propertyName;

@end
