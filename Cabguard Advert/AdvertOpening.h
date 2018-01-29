//
//  AdvertOpening.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/8/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "JSONModel.h"

@interface AdvertOpening : JSONModel

@property (assign, nonatomic) int advertId;
@property (assign, nonatomic) int id;
@property (assign, nonatomic) int openingStartDay;
@property (assign, nonatomic) int openingEndDay;
@property (assign, nonatomic) double openingTime;
@property (assign, nonatomic) double closingTime;
@property (assign, nonatomic) int closingEndDay;
@property (assign, nonatomic) int closingStartDay;

+(BOOL)propertyIsOptional:(NSString*)propertyName;
+(BOOL)propertyIsIgnored:(NSString*)propertyName;

@end
