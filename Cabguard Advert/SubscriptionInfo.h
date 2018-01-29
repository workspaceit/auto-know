//
//  SubscriptionInfo.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/31/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "JSONModel.h"

@interface SubscriptionInfo : JSONModel


@property (assign, nonatomic) int id;
@property (assign, nonatomic) double price;
@property (strong, nonatomic) NSString <Optional>  *currency;
@property (strong, nonatomic) NSString <Optional>  *createdDate;


+(BOOL)propertyIsOptional:(NSString*)propertyName;
+(BOOL)propertyIsIgnored:(NSString*)propertyName;


@end
