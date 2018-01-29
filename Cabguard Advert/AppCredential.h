//
//  AppCredential.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/8/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "JSONModel.h"
#import "Person.h"

@interface AppCredential : JSONModel

@property (assign, nonatomic) int id;
@property (assign, nonatomic) int type;
@property (strong, nonatomic) Person <Optional>  *person;
@property (strong, nonatomic) NSString <Optional>  *email;
@property (strong, nonatomic) NSString <Optional>   *userName;
@property (strong, nonatomic) NSString <Optional>  *createdDate;

+(BOOL)propertyIsOptional:(NSString*)propertyName;
+(BOOL)propertyIsIgnored:(NSString*)propertyName;


@end
