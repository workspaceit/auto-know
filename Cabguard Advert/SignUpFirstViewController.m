//
//  SignUpFirstViewController.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/7/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "SignUpFirstViewController.h"
#import "ToastView.h"
#import "SignUpSecondViewController.h"

@implementation SignUpFirstViewController

-(void) viewDidLoad
{
    [super viewDidLoad];
    
    self.closeBtn.layer.cornerRadius = 16.0;
    [self.closeBtn.layer setMasksToBounds:YES];
    
    self.titleView.layer.cornerRadius = 20.0;
    [self.titleView.layer setMasksToBounds:YES];
    
    self.firstnameView.layer.cornerRadius = 20.0;
    [self.firstnameView.layer setMasksToBounds:YES];
    
    self.lastnameView.layer.cornerRadius = 20.0;
    [self.lastnameView.layer setMasksToBounds:YES];
    
    self.phoneView.layer.cornerRadius = 20.0;
    [self.phoneView.layer setMasksToBounds:YES];
    
    self.nextBtn.layer.cornerRadius = 20.0;
    [self.nextBtn.layer setMasksToBounds:YES];
    
    
    self.firstnameText.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"First Name" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.lastnameText.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Last Name" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.phoneText.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Phone Number" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
   
    
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

-(void) viewWillAppear:(BOOL)animated
{
    NSLog(@"%@",self.personTitle);
    
    if(self.personTitle)
    {
        self.titleLabel.text = self.personTitle.name;
    }
    else
    {
        self.titleLabel.text = @"Select Title";
    }
}


- (IBAction)close:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}


- (IBAction)next:(id)sender {
    
    if (!self.personTitle)
    {
         [ToastView showToastInParentView:self.view withText:@"Select A Title First" withDuaration:2.0];
    }
    else if ([self.firstnameText.text isEqual:@""])
    {
         [ToastView showToastInParentView:self.view withText:@"Enter Your First Name" withDuaration:2.0];
    }
    else if ([self.lastnameText.text isEqual:@""])
    {
         [ToastView showToastInParentView:self.view withText:@"Enter Your Last Name" withDuaration:2.0];
    }
    else if ([self.phoneText.text isEqual:@""])
    {
         [ToastView showToastInParentView:self.view withText:@"Enter Your Phone No" withDuaration:2.0];
    }
    else
    {
         [self performSegueWithIdentifier:@"next" sender:self];
    }
    
    
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
        SignUpSecondViewController *data= segue.destinationViewController;
        data.personTitle = self.personTitle;
        data.firstName = self.firstnameText.text;
        data.lastName = self.lastnameText.text;
        data.phoneNo = self.phoneText.text;
    }
}

@end
