//
//  AgreementViewController.m
//  Cabguard Advert
//
//  Created by Siam Biswas on 3/2/16.
//  Copyright © 2016 Workspace Infotech. All rights reserved.
//

#import "AgreementViewController.h"

@interface AgreementViewController ()

@end

@implementation AgreementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)continue:(id)sender {
    if(_check.isOn){
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setValue:@"YES" forKey:@"agreed"];
        [self performSegueWithIdentifier:@"next" sender:self];
        
        
    }else{
        UIAlertView *response = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Plaese Accept the agreement" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [response show];
    }
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
