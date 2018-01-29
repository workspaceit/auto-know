//
//  AdvertSingleResponse.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/11/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "AdvertSingleResponse.h"

@implementation AdvertSingleResponse

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    if([propertyName isEqualToString:@""])
        return YES;
    
    return NO;
}


+(BOOL)propertyIsIgnored:(NSString*)propertyName
{
    
    return NO;
}

@end
