//
//  PersonalInfoViewController.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/7/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "PersonalInfoViewController.h"
#import "AppDelegate.h"

@interface PersonalInfoViewController ()

@end

@implementation PersonalInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    self.nameText.text = [NSString stringWithFormat:@"Name : %@ %@ %@",app.authCredential.person.title,app.authCredential.person.firstName,app.authCredential.person.lastName];
    self.phoneText.text = [NSString stringWithFormat:@"Phone Number : %@",app.authCredential.person.phoneNumber];
    self.emailText.text = [NSString stringWithFormat:@"Email: %@",app.authCredential.email];
    self.addressText.text = [NSString stringWithFormat:@"Address : House - %@ ,Street - %@, %@-%@",app.authCredential.person.address.houseNumber,app.authCredential.person.address.street,app.authCredential.person.address.city,app.authCredential.person.address.postCode];
}

-(void) viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
