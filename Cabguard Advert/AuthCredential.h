//
//  AuthCredential.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/8/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "AppCredential.h"

@interface AuthCredential : AppCredential

@property (assign, nonatomic) BOOL active;
@property (assign, nonatomic) BOOL banned;
@property (strong, nonatomic) NSString <Optional> *accessToken;

+(BOOL)propertyIsOptional:(NSString*)propertyName;
+(BOOL)propertyIsIgnored:(NSString*)propertyName;

@end
