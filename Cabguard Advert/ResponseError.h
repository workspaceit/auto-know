//
//  ResponseError.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/8/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "JSONModel.h"

@protocol ResponseError

@end

@interface ResponseError : JSONModel

@property (strong, nonatomic) NSString  *params;
@property (strong, nonatomic) NSString  *msg;


+(BOOL)propertyIsOptional:(NSString*)propertyName;
+(BOOL)propertyIsIgnored:(NSString*)propertyName;


@end
