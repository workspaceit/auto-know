//
//  Person.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/8/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "JSONModel.h"
#import "Address.h"

@interface Person : JSONModel

@property (assign, nonatomic) int id;
@property (strong, nonatomic) NSString  *title;
@property (strong, nonatomic) NSString  *firstName;
@property (strong, nonatomic) NSString  *lastName;
@property (strong, nonatomic) NSString  *phoneNumber;
@property (strong, nonatomic) Address  *address;
@property (strong, nonatomic) NSString  *createdDate;


+(BOOL)propertyIsOptional:(NSString*)propertyName;
+(BOOL)propertyIsIgnored:(NSString*)propertyName;



@end
