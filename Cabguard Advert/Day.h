//
//  Day.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/9/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "JSONModel.h"

@interface Day : JSONModel

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) int value;

@end
