//
//  BusinessShowOneViewController.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/9/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "BusinessShowOneViewController.h"
#import "BussinessDataOneViewController.h"
#import "AppDelegate.h"

@interface BusinessShowOneViewController ()

@end

@implementation BusinessShowOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
   
}

-(void) viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    self.business = app.business;
    
    self.name.text = self.business.name;
    self.type.text = self.business.businessCategory.categoryDisplayValue;
    self.about.text = self.business.about;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"edit"])
    {
        BussinessDataOneViewController *data= segue.destinationViewController;
        data.type = self.business.businessCategory;
        data.name = self.business.name;
        data.shortDescription = self.business.about;
        data.edit = true;
    }
}


@end
