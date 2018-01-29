//
//  SignUpSecondViewController.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/7/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "SignUpSecondViewController.h"
#import "ToastView.h"
#import "SignUpThirdViewController.h"

@implementation SignUpSecondViewController

-(void) viewDidLoad
{
    [super viewDidLoad];
    
    self.closeBtn.layer.cornerRadius = 16.0;
    [self.closeBtn.layer setMasksToBounds:YES];
    
    self.houseView.layer.cornerRadius = 20.0;
    [self.houseView.layer setMasksToBounds:YES];
    
    self.streetView.layer.cornerRadius = 20.0;
    [self.streetView.layer setMasksToBounds:YES];
    
    self.cityView.layer.cornerRadius = 20.0;
    [self.cityView.layer setMasksToBounds:YES];
    
    self.postView.layer.cornerRadius = 20.0;
    [self.postView.layer setMasksToBounds:YES];
    
    self.backBtn.layer.cornerRadius = 20.0;
    [self.backBtn.layer setMasksToBounds:YES];
    
    self.nextBtn.layer.cornerRadius = 20.0;
    [self.nextBtn.layer setMasksToBounds:YES];
    
    self.housenoText.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"House No" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.streetText.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Street" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.cityText.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"City" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.postcodeTExt.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Postal Code" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    
    self.singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:self.singleTap];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShowOrHide:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShowOrHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    
    
}

- (IBAction)back:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)next:(id)sender {
    
    
//    if ([self.housenoText.text isEqual:@""])
//    {
//        [ToastView showToastInParentView:self.view withText:@"Enter Your House No" withDuaration:2.0];
//    }
//    else if ([self.streetText.text isEqual:@""])
//    {
//        [ToastView showToastInParentView:self.view withText:@"Enter Your Street No" withDuaration:2.0];
//    }
//    else if ([self.cityText.text isEqual:@""])
//    {
//        [ToastView showToastInParentView:self.view withText:@"Enter Your City" withDuaration:2.0];
//    }
//    else if ([self.postcodeTExt.text isEqual:@""])
//    {
//        [ToastView showToastInParentView:self.view withText:@"Enter Your Post Code" withDuaration:2.0];
//    }
//    else
//    {
        [self performSegueWithIdentifier:@"next" sender:self];
//    }

}

- (IBAction)close:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (void)handleSingleTap:(UITapGestureRecognizer *)sender
{
    [self.view endEditing:YES];
}


-(void)keyboardDidShowOrHide:(NSNotification *)notification
{
    NSDictionary *userInfo = [notification userInfo];
    NSTimeInterval animationDuration;
    UIViewAnimationCurve animationCurve;
    CGRect keyboardEndFrame;
    
    [[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] getValue:&animationCurve];
    [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&keyboardEndFrame];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:animationDuration];
    [UIView setAnimationCurve:animationCurve];
    
    CGRect newFrame = self.view.frame;
    newFrame.origin.y = keyboardEndFrame.origin.y - newFrame.size.height;
    self.view.frame = newFrame;
    
    
    
    [UIView commitAnimations];
}


-(void) viewDidAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"next"])
    {
        SignUpThirdViewController *data= segue.destinationViewController;
        data.personTitle = self.personTitle;
        data.firstName = self.firstName;
        data.lastName = self.lastName;
        data.phoneNo = self.phoneNo;
        data.house = ([self.housenoText.text isEqualToString: @""])?@"N/A": self.housenoText.text;
        data.street = ([self.streetText.text isEqualToString:@""])? @"N/A" : self.streetText.text;
        data.city = ([self.cityText.text isEqualToString:@""])?@"N/A" : self.cityText.text;
        data.postcode = ([self.postcodeTExt.text isEqualToString:@""])?@"N/A" : self.postcodeTExt.text;
    }
}


@end
