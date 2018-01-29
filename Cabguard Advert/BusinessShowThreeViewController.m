//
//  BusinessShowThreeViewController.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/9/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "BusinessShowThreeViewController.h"
#import "BussinessDataThreeViewController.h"
#import "AppDelegate.h"

@interface BusinessShowThreeViewController ()

@end

@implementation BusinessShowThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
       self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
}

-(void) viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    self.business = app.business;
    
    self.website.text = self.business.website;
    self.location.text = [NSString stringWithFormat:@"%d",self.business.haveManyLocation];
    self.vat.text = self.business.vatNumber;
    self.registration.text = self.business.registrationNumber;
    
   
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-d HH:mm:ss";
    NSDate *date =[formatter dateFromString:self.business.startDate];
    formatter.dateFormat = @"dd.MM.yyyy";

    
     NSLog(@"%@ %@",self.business.startDate,[formatter stringFromDate:date]);
    
    
    self.startDate.text = [formatter stringFromDate:date];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"edit"])
    {
        BussinessDataThreeViewController *data= segue.destinationViewController;
        data.website = self.website.text;
        data.locationNo = self.location.text;
        data.vatNo = self.vat.text;
        data.regNo = self.registration.text;
        data.startDate = self.startDate.text;
        data.edit = true;
    }
}
@end
