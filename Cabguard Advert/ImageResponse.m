//
//  ImageResponse.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 7/25/17.
//  Copyright © 2017 Workspace Infotech. All rights reserved.
//

#import "ImageResponse.h"

@implementation ImageResponse
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
