//
//  BusinessAddressArray.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/9/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "JSONModel.h"
#import "BusinessAddress.h"

@interface BusinessAddressArray : JSONModel

@property (strong, nonatomic) NSArray *address;

@end
