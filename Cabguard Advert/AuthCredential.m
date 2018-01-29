//
//  AuthCredential.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/8/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "AuthCredential.h"

@implementation AuthCredential

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    if([propertyName isEqualToString:@"active"])
        return YES;
    
    if([propertyName isEqualToString:@"banned"])
        return YES;

    
    return NO;
}


+(BOOL)propertyIsIgnored:(NSString*)propertyName
{
    
    return NO;
}


@end
