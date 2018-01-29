//
//  ImageResponse.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 7/25/17.
//  Copyright © 2017 Workspace Infotech. All rights reserved.
//

#import "JSONModel.h"
#import "ResponseStat.h"

@interface ImageResponse : JSONModel
@property (strong, nonatomic) ResponseStat *responseStat;
@property (strong, nonatomic) NSString  *responseData;

+(BOOL)propertyIsOptional:(NSString*)propertyName;
+(BOOL)propertyIsIgnored:(NSString*)propertyName;
@end
