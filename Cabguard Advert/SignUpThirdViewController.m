//
//  SignUpThirdViewController.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/7/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "SignUpThirdViewController.h"
#import "JSONHTTPClient.h"
#import "ToastView.h"

@implementation SignUpThirdViewController

-(void) viewDidLoad
{
    [super viewDidLoad];
    
    defaults = [NSUserDefaults standardUserDefaults];
    baseurl = [defaults objectForKey:@"baseurl"];
    
    self.closeBtn.layer.cornerRadius = 16.0;
    [self.closeBtn.layer setMasksToBounds:YES];
    
    self.emailView.layer.cornerRadius = 20.0;
    [self.emailView.layer setMasksToBounds:YES];
    
    self.passwordView.layer.cornerRadius = 20.0;
    [self.passwordView.layer setMasksToBounds:YES];
    
    self.confirmPassword.layer.cornerRadius = 20.0;
    [self.confirmPassword.layer setMasksToBounds:YES];
    
    self.backBtn.layer.cornerRadius = 20.0;
    [self.backBtn.layer setMasksToBounds:YES];
    
    self.nextBtn.layer.cornerRadius = 20.0;
    [self.nextBtn.layer setMasksToBounds:YES];
    
    
    
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
    self.passText.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.confirmText.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Confirm Password" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];

}


- (IBAction)back:(id)sender {
    
     [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)next:(id)sender {
    
    if ([self.emailText.text isEqual:@""])
    {
        [ToastView showToastInParentView:self.view withText:@"Enter Your Email" withDuaration:2.0];
    }
    else if ([self.passText.text isEqual:@""])
    {
        [ToastView showToastInParentView:self.view withText:@"Enter Your Password" withDuaration:2.0];
    }
    else if ([self.confirmText.text isEqual:@""])
    {
        [ToastView showToastInParentView:self.view withText:@"Confirm Your Password" withDuaration:2.0];
    }
    else if (![self.confirmText.text isEqual:self.passText.text])
    {
        [ToastView showToastInParentView:self.view withText:@"Password Doesn't Match" withDuaration:2.0];
    }
    else
    {
        [self.loading startAnimating];
        
        NSDictionary *inventory = @{
                                    @"agreement" : @"1",
                                    @"email" : self.emailText.text,
                                    @"password" : self.passText.text,
                                    @"password_confirm" : self.confirmText.text,
                                    @"house_number" : self.house,
                                    @"street" : self.street,
                                    @"city" : self.city,
                                    @"postcode" : self.postcode,
                                    @"title" : self.personTitle.name,
                                    @"f_name" : self.firstName,
                                    @"l_name" : self.lastName,
                                    @"phone_number" : self.phoneNo,
                                    };
        
        [JSONHTTPClient postJSONFromURLWithString:[NSString stringWithFormat:@"%@signup/submit",baseurl] params:inventory
                                       completion:^(NSDictionary *json, JSONModelError *err) {
                                           
                                           NSError* error = nil;
                                           self.response = [[SIgnUpResponse alloc] initWithDictionary:json error:&error];
                                           
                                           NSLog(@"%@",error);
                                           
                                           if(error)
                                           {
                                               [ToastView showToastInParentView:self.view withText:@"Server Unreachable" withDuaration:2.0];
                                           }
                                           else
                                           {
                                               [ToastView showToastInParentView:self.view withText:self.response.responseStat.msg withDuaration:2.0];
                                           }
                                           
                                           [self.loading stopAnimating];
                                           
                                           if(self.response.responseStat.status){
                                               
                                               NSLog(@"%@",self.response);
                                               
                                               [self performSegueWithIdentifier:@"next" sender:self];
                                           }
                                           
                                       }];

    }

    
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


@end
