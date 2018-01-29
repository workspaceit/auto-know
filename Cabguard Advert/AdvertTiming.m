//
//  AdvertTiming.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 10/26/17.
//  Copyright © 2017 Workspace Infotech. All rights reserved.
//

#import "AdvertTiming.h"

@implementation AdvertTiming
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
