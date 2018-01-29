//
//  AdvertTiming.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 10/26/17.
//  Copyright © 2017 Workspace Infotech. All rights reserved.
//

#import "JSONModel.h"

@interface AdvertTiming : JSONModel
@property (assign, nonatomic) int  id;
@property (assign, nonatomic) int  advertId;
@property (assign, nonatomic) BOOL  alwaysOpen;
@property (strong, nonatomic) NSString <Optional>  *day;
@property (strong, nonatomic) NSString <Optional>  *openingTime;
@property (strong, nonatomic) NSString <Optional>  *closingTime;
@property (assign, nonatomic) BOOL  open;
+(BOOL)propertyIsOptional:(NSString*)propertyName;
+(BOOL)propertyIsIgnored:(NSString*)propertyName;
@end
