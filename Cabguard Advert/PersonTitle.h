//
//  PersonTitle.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/8/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "JSONModel.h"

@protocol PersonTitle

@end

@interface PersonTitle : JSONModel

@property (assign, nonatomic) int id;
@property (strong, nonatomic) NSString  *name;
@property (strong, nonatomic) NSString  *createdDate;


+(BOOL)propertyIsOptional:(NSString*)propertyName;
+(BOOL)propertyIsIgnored:(NSString*)propertyName;



@end
