//
//  Business.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/9/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "Business.h"

@implementation Business

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    if([propertyName isEqualToString:@"loginId"])
        return YES;
    if([propertyName isEqualToString:@"id"])
        return YES;
    if([propertyName isEqualToString:@"haveManyLocation"])
        return YES;
    if([propertyName isEqualToString:@"address"])
        return YES;
    
    return NO;
}


+(BOOL)propertyIsIgnored:(NSString*)propertyName
{
    
    return NO;
}

@end
