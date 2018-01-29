//
//  BusinessShowViewController.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/9/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "BusinessShowViewController.h"
#import "BusinessShowOneViewController.h"
#import "BusinessShowTwoViewController.h"
#import "BusinessShowThreeViewController.h"


@interface BusinessShowViewController ()

@end

@implementation BusinessShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
       self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
}

-(void) viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"basic"])
    {
        BusinessShowOneViewController *data= segue.destinationViewController;
        data.business = self.business;
       
    }
    
    if ([segue.identifier isEqualToString:@"address"])
    {
        BusinessShowTwoViewController *data= segue.destinationViewController;
        data.business = self.business;
        
    }
    
    if ([segue.identifier isEqualToString:@"aditional"])
    {
        BusinessShowThreeViewController *data= segue.destinationViewController;
        data.business = self.business;
        
    }
}


@end
