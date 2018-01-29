//
//  SignUpFourthViewController.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/7/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "SignUpFourthViewController.h"

@implementation SignUpFourthViewController

-(void) viewDidLoad
{
    [super viewDidLoad];
    
    self.logo.layer.cornerRadius = 50.0;
    [self.logo.layer setMasksToBounds:YES];
    
    self.messageView.layer.cornerRadius = 20.0;
    [self.messageView.layer setMasksToBounds:YES];
    
    self.loginBtn.layer.cornerRadius = 20.0;
    [self.loginBtn.layer setMasksToBounds:YES];
   
    
    
}


- (IBAction)close:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}


-(void) viewDidAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

@end
