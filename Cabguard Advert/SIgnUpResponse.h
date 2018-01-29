//
//  SIgnUpResponse.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/8/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "JSONModel.h"
#import "ResponseStat.h"
#import "AuthCredential.h"

@interface SIgnUpResponse : JSONModel

@property (strong, nonatomic) ResponseStat *responseStat;
@property (strong, nonatomic) AuthCredential <Optional> *responseData;

+(BOOL)propertyIsOptional:(NSString*)propertyName;
+(BOOL)propertyIsIgnored:(NSString*)propertyName;


@end
