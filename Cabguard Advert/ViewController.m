//
//  ViewController.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/7/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "ViewController.h"
#import "JSONHTTPClient.h"
#import "ToastView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    defaults = [NSUserDefaults standardUserDefaults];
    baseurl = [defaults objectForKey:@"baseurl"];
    
    self.logoView.layer.cornerRadius = 60.0;
    [self.logoView.layer setMasksToBounds:YES];
    
    self.usernameView.layer.cornerRadius = 20.0;
    [self.usernameView.layer setMasksToBounds:YES];
    
    self.passwordView.layer.cornerRadius = 20.0;
    [self.passwordView.layer setMasksToBounds:YES];
    
    self.loginBtn.layer.cornerRadius = 20.0;
    [self.loginBtn.layer setMasksToBounds:YES];
    
    self.loginBtn.layer.cornerRadius = 20.0;
    [self.loginBtn.layer setMasksToBounds:YES];
    
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
    
    self.username.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Username / Email" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.password.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];

}

-(void)viewWillAppear:(BOOL)animated
{
    
    NSLog(@"%@",[defaults objectForKey:@"access_token"]);
   
    if([defaults objectForKey:@"access_token"])
    {
        [self.loading startAnimating];
        
        NSDictionary *inventory = @{
                                    @"accesstoken" : [defaults objectForKey:@"access_token"],

                                    };
        
        [JSONHTTPClient postJSONFromURLWithString:[NSString stringWithFormat:@"%@authenticate",baseurl] params:inventory
                                       completion:^(NSDictionary *json, JSONModelError *err) {
                                           
                                           NSError* error = nil;
                                           self.response = [[SIgnUpResponse alloc] initWithDictionary:json error:&error];
                                           
                                           NSLog(@"%@",error);
                                           
                                           if(error)
                                           {
                                               [ToastView showToastInParentView:self.view withText:@"Server Unreachable" withDuaration:2.0];
                                           }
                                           
                                           
                                           [self.loading stopAnimating];
                                           
                                           if(self.response.responseStat.status){
                                               
                                               
                                               NSLog(@"%@",self.response);
                                               
                                               AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
                                               app.authCredential = self.response.responseData;
                                               [self performSegueWithIdentifier:@"next" sender:self];
                                           }
                                           else
                                           {
                                               [ToastView showToastInParentView:self.view withText:self.response.responseStat.msg withDuaration:2.0];
                                           }
                                           
                                       }];
    }
}

-(void) viewDidAppear:(BOOL)animated
{
     self.navigationController.navigationBarHidden = YES;
}

- (void)handleSingleTap:(UITapGestureRecognizer *)sender
{
    [self.view endEditing:YES];
}

- (IBAction)login:(id)sender {
    
    
    if ([self.username.text isEqual:@""])
    {
        [ToastView showToastInParentView:self.view withText:@"Enter Your Email/Username" withDuaration:2.0];
    }
    else if ([self.password.text isEqual:@""])
    {
        [ToastView showToastInParentView:self.view withText:@"Enter Your Password" withDuaration:2.0];
    }
    else
    {
        [self.loading startAnimating];
        
        NSDictionary *inventory = @{
                                    @"email" : self.username.text,
                                    @"password" : self.password.text,
                            
                                    };
        
        [JSONHTTPClient postJSONFromURLWithString:[NSString stringWithFormat:@"%@auth/login",baseurl] params:inventory
                                       completion:^(NSDictionary *json, JSONModelError *err) {
                                           
                                           NSError* error = nil;
                                           self.response = [[SIgnUpResponse alloc] initWithDictionary:json error:&error];
                                           
                                           NSLog(@"%@",error);
                                           
                                           if(error)
                                           {
                                               [ToastView showToastInParentView:self.view withText:@"Server Unreachable" withDuaration:2.0];
                                           }
                                          
                                           
                                           [self.loading stopAnimating];
                                           
                                           if(self.response.responseStat.status){
                                               
                                               
                                               NSLog(@"%@",self.response);
                                               [defaults removeObjectForKey:@"access_token"];
                                               [defaults setValue:self.response.responseData.accessToken forKey:@"access_token"];
                                               AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
                                               app.authCredential = self.response.responseData;
                                               [self performSegueWithIdentifier:@"next" sender:self];
                                           }
                                           else
                                           {
                                               [ToastView showToastInParentView:self.view withText:self.response.responseStat.msg withDuaration:2.0];
                                           }
                                           
                                       }];
        
    
    }

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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
