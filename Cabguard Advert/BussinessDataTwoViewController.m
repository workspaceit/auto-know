//
//  BussinessDataTwoViewController.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/7/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "BussinessDataTwoViewController.h"
#import "ToastView.h"
#import "BussinessDataThreeViewController.h"
#import "JSONHTTPClient.h"
#import "AppDelegate.h"

@interface BussinessDataTwoViewController ()

@end

@implementation BussinessDataTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    defaults = [NSUserDefaults standardUserDefaults];
    baseurl = [defaults objectForKey:@"baseurl"];
    
    
    self.countryView.layer.cornerRadius = 10.0;
    [self.countryView.layer setMasksToBounds:YES];
    
    self.countryView.frame = CGRectInset(self.countryView.frame, -0.5f, -0.5f);
    self.countryView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.countryView.layer.borderWidth = 0.5f;
    
    self.cityView.layer.cornerRadius = 10.0;
    [self.cityView.layer setMasksToBounds:YES];
    
    self.cityView.frame = CGRectInset(self.cityView.frame, -0.5f, -0.5f);
    self.cityView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.cityView.layer.borderWidth = 0.5f;
    
    self.postcodeView.layer.cornerRadius = 10.0;
    [self.postcodeView.layer setMasksToBounds:YES];
    
    self.postcodeView.frame = CGRectInset(self.postcodeView.frame, -0.5f, -0.5f);
    self.postcodeView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.postcodeView.layer.borderWidth = 0.5f;
    
    self.addressView.layer.cornerRadius = 10.0;
    [self.addressView.layer setMasksToBounds:YES];
    
    self.addressView.frame = CGRectInset(self.addressView.frame, -0.5f, -0.5f);
    self.addressView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.addressView.layer.borderWidth = 0.5f;
    
    self.nextBtn.layer.cornerRadius = 20.0;
    [self.nextBtn.layer setMasksToBounds:YES];
    
    self.backBtn.layer.cornerRadius = 20.0;
    [self.backBtn.layer setMasksToBounds:YES];
    
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


- (IBAction)back:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
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

- (IBAction)next:(id)sender {
    
    if (!self.country && !self.countryName)
    {
        [ToastView showToastInParentView:self.view withText:@"Select A Country" withDuaration:2.0];
    }
    else if ([self.cityText.text isEqual:@""])
    {
        [ToastView showToastInParentView:self.view withText:@"Enter a City" withDuaration:2.0];
    }
    else if ([self.postcodeText.text isEqual:@""])
    {
        [ToastView showToastInParentView:self.view withText:@"Enter a Postcode" withDuaration:2.0];
    }
    else if ([self.addressText.text isEqual:@""])
    {
        [ToastView showToastInParentView:self.view withText:@"Enter a business address" withDuaration:2.0];
    }
    else
    {
        if (self.edit)
        {
            
            BusinessAddress *addressT= [[BusinessAddress alloc]init];
            addressT.country = self.countryLabel.text;
            addressT.city = self.cityText.text;
            addressT.postCode = self.postcodeText.text;
            addressT.address = self.addressText.text;
            addressT.id = self.addreessB.id;
            addressT.businessId = self.addreessB.businessId;
            
            
            NSMutableArray *addressArray = [[NSMutableArray alloc]init];
            [addressArray addObject:[addressT toDictionary]];
            
            
            NSError* error;
            NSData *dataR = [NSJSONSerialization dataWithJSONObject:addressArray options:NSJSONWritingPrettyPrinted error:&error];
            NSString* jsonString = [[NSString alloc] initWithData:dataR encoding:NSUTF8StringEncoding];
            
            NSDictionary *inventory = @{
                                        @"address" : jsonString,
                                        };
            
            [JSONHTTPClient postJSONFromURLWithString:[NSString stringWithFormat:@"%@business/updateAddress",baseurl] params:inventory
                                           completion:^(NSDictionary *json, JSONModelError *err) {
                                               
                                               NSError* error = nil;
                                               
                                                NSLog(@"%@",err);
                                               
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
                                                       
                                                       BusinessAddress *addressT= app.business.address[0];
                                                       addressT.country = self.countryLabel.text;
                                                       addressT.city = self.cityText.text;
                                                       addressT.postCode = self.postcodeText.text;
                                                       addressT.address = self.addressText.text;
                                                       
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


-(void) viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    
    self.countryLabel.text = (self.country) ? self.country.nickName : @"Select Country";
   

    if (!self.countryChange) {
        
         self.countryLabel.text = (self.countryName) ? self.countryName : @"Select Country";
         self.cityText.text = (self.city) ? self.city : @"";
         self.postcodeText.text = (self.postcode) ? self.postcode : @"";
         self.addressText.text = (self.address) ? self.address : @"";
    }
    
    [self.nextBtn setTitle:(self.edit)?@"Update":@"next" forState:UIControlStateNormal];
     self.backBtn.hidden = self.edit;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"next"])
    {
        BussinessDataThreeViewController *data= segue.destinationViewController;
        data.type = self.type;
        data.name = self.name;
        data.shortDescription = self.shortDescription;
        data.country = self.country;
        data.city = self.cityText.text;
        data.postcode = self.postcodeText.text;
        data.address = self.addressText.text;
    }
}

@end
