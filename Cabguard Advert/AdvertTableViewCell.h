//
//  AdvertTableViewCell.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/8/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdvertTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *price;
@property (strong, nonatomic) IBOutlet UILabel *discount;
@property (strong, nonatomic) IBOutlet UILabel *openingtime;
@property (strong, nonatomic) IBOutlet UILabel *location;
@property (strong, nonatomic) IBOutlet UILabel *descriptionValue;
@property (strong, nonatomic) IBOutlet UILabel *companyName;


@end
