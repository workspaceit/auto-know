//
//  SelectTitleViewController.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/7/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonTitleResponse.h"

@interface SelectTitleViewController : UIViewController
{
    NSUserDefaults *defaults;
    NSString *baseurl;
}

@property (strong, nonatomic) IBOutlet UITableView *tableData;
@property (nonatomic, strong) UITapGestureRecognizer *singleTap;
@property (strong, nonatomic) PersonTitleResponse *data;


@end
