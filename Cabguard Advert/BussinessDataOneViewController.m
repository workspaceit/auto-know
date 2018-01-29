//
//  BussinessDataOneViewController.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/7/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "BussinessDataOneViewController.h"
#import "BussinessDataTwoViewController.h"
#import "JSONHTTPClient.h"
#import "ToastView.h"
#import "AppDelegate.h"

@interface BussinessDataOneViewController ()

@end

@implementation BussinessDataOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    defaults = [NSUserDefaults standardUserDefaults];
    baseurl = [defaults objectForKey:@"baseurl"];
    
    self.nameView.layer.cornerRadius = 10.0;
    [self.nameView.layer setMasksToBounds:YES];
    
    self.nameView.frame = CGRectInset(self.nameView.frame, -0.5f, -0.5f);
    self.nameView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.nameView.layer.borderWidth = 0.5f;
    
    self.typeView.layer.cornerRadius = 10.0;
    [self.typeView.layer setMasksToBounds:YES];
    
    self.typeView.frame = CGRectInset(self.typeView.frame, -0.5f, -0.5f);
    self.typeView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.typeView.layer.borderWidth = 0.5f;
    
    self.descriptionView.layer.cornerRadius = 10.0;
    [self.descriptionView.layer setMasksToBounds:YES];
    
    self.descriptionView.frame = CGRectInset(self.descriptionView.frame, -0.5f, -0.5f);
    self.descriptionView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.descriptionView.layer.borderWidth = 0.5f;
    
    self.nextBtn.layer.cornerRadius = 20.0;
    [self.nextBtn.layer setMasksToBounds:YES];
    
    self.singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:self.singleTap];
    
    
    /*[[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShowOrHide:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShowOrHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];*/
    
}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    
    self.typeLabel.text = (self.type)? self.type.categoryDisplayValue :  @"Select Type";
    
    if(!self.typeChange)
    {
    self.nameText.text = (self.name)? self.name :  @"";
    self.descriptionText.text = (self.shortDescription)? self.shortDescription :  @"";
    }
    
    [self.nextBtn setTitle:(self.edit)?@"Update":@"next" forState:UIControlStateNormal];
   
}

- (IBAction)next:(id)sender {
    
    if (!self.type)
    {
        [ToastView showToastInParentView:self.view withText:@"Select A Type" withDuaration:2.0];
    }
    else if ([self.nameText.text isEqual:@""])
    {
        [ToastView showToastInParentView:self.view withText:@"Enter a name" withDuaration:2.0];
    }
    else if ([self.descriptionText.text isEqual:@""])
    {
        [ToastView showToastInParentView:self.view withText:@"Enter a description" withDuaration:2.0];
    }
    else
    {
        if (self.edit)
        {
            NSDictionary *inventory = @{
                                        @"name" : self.nameText.text,
                                        @"company_type" : [NSString stringWithFormat:@"%d",self.type.id],
                                        @"about" : self.descriptionText.text,
                                        };
            
            [JSONHTTPClient postJSONFromURLWithString:[NSString stringWithFormat:@"%@business/updateInfo",baseurl] params:inventory
                                           completion:^(NSDictionary *json, JSONModelError *err) {
                                               
                                               NSError* error = nil;
                                               self.response = [[Response alloc] initWithDictionary:json error:&error];
                                               
                                               NSLog(@"%@",error);
                                               
                                               if(error)
                                               {
                                                   [ToastView showToastInParentView:self.view withText:@"Server Unreachable" withDuaration:2.0];
                                               }
                                               else
                                               {
                                                   NSLog(@"%@",self.response);
                                                   
                                                   if(self.response.responseStat.status){
                                                       
                                                       AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
                                                       app.business.name = self.nameText.text;
                                                       app.business.businessCategory = self.type;
                                                       app.business.about = self.descriptionText.text;
                                                       [self.navigationController popViewControllerAnimated:YES];
                                                       
                                                   }
                                                   else
                                                   {
                                                       [ToastView showToastInParentView:self.view withText:self.response.responseStat.msg withDuaration:2.0];
                                                   }
                                               }
                                               
                                               [self.loading stopAnimating];
                                               
                                           }];
        

        }
        else
        {
            [self performSegueWithIdentifier:@"next" sender:self];
        }
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"next"])
    {
        BussinessDataTwoViewController *data= segue.destinationViewController;
        data.type = self.type;
        data.name = self.nameText.text;
        data.shortDescription = self.descriptionText.text;
    }
}
@end
