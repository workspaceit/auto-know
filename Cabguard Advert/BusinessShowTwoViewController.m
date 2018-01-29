//
//  BusinessShowTwoViewController.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/9/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "BusinessShowTwoViewController.h"
#import "BussinessDataTwoViewController.h"
#import "AppDelegate.h"

@interface BusinessShowTwoViewController ()

@end

@implementation BusinessShowTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
       self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
}

-(void) viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    self.business = app.business;
    
    BusinessAddress *address = self.business.address[0];
    
    self.country.text = address.country;
    self.city.text = address.city;
    self.postcode.text = address.postCode;
    self.address.text = address.address;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"edit"])
    {
        BussinessDataTwoViewController *data= segue.destinationViewController;
        data.countryName = self.country.text;
        data.city = self.city.text;
        data.postcode = self.postcode.text;
        data.address = self.address.text;
        data.edit = true;
        
        AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        self.business = app.business;
        
        data.addreessB = self.business.address[0];
    }
}



@end
