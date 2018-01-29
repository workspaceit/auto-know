//
//  ResponseStat.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/8/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "JSONModel.h"
#import "ResponseError.h"

@interface ResponseStat : JSONModel

@property (strong, nonatomic) NSString  *msg;
@property (assign, nonatomic) BOOL status;
@property (assign, nonatomic) BOOL isLogin;
@property (strong, nonatomic) NSArray <ResponseError>  *requestError;

+(BOOL)propertyIsOptional:(NSString*)propertyName;
+(BOOL)propertyIsIgnored:(NSString*)propertyName;


@end
