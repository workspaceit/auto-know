//
//  AdvertImages.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 7/27/17.
//  Copyright © 2017 Workspace Infotech. All rights reserved.
//

#import "JSONModel.h"

@interface AdvertImages : JSONModel
@property (assign, nonatomic) int  id;
@property (assign, nonatomic) int  advertId;
@property (strong, nonatomic) NSString <Optional>  *imagePath;
@property (strong, nonatomic) NSString <Optional>  *createDate;
+(BOOL)propertyIsOptional:(NSString*)propertyName;
+(BOOL)propertyIsIgnored:(NSString*)propertyName;
@end
