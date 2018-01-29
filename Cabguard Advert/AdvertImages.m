//
//  AdvertImages.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 7/27/17.
//  Copyright © 2017 Workspace Infotech. All rights reserved.
//

#import "AdvertImages.h"

@implementation AdvertImages
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
