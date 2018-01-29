//
//  PersonTitleResponse.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/8/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "JSONModel.h"
#import "ResponseStat.h"
#import "PersonTitle.h"

@interface PersonTitleResponse : JSONModel

@property (strong, nonatomic) ResponseStat *responseStat;
@property (strong, nonatomic) NSArray <PersonTitle>  *responseData;

+(BOOL)propertyIsOptional:(NSString*)propertyName;
+(BOOL)propertyIsIgnored:(NSString*)propertyName;


@end
