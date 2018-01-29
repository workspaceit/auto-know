//
//  BussinessDataThreeViewController.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/7/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "BussinessDataThreeViewController.h"
#import "BusinessShowViewController.h"
#import "DashboardViewController.h"
#import "JSONHTTPClient.h"
#import "ToastView.h"
#import "BusinessAddressArray.h"
#import "AppDelegate.h"

@interface BussinessDataThreeViewController ()

@end

@implementation BussinessDataThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    defaults = [NSUserDefaults standardUserDefaults];
    baseurl = [defaults objectForKey:@"baseurl"];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    UIDatePicker *datePicker3 = [[UIDatePicker alloc]init];
    [datePicker3 setDate:[NSDate date]];
    [datePicker3 setDatePickerMode:UIDatePickerModeDate];
    [datePicker3 addTarget:self action:@selector(updateTime:) forControlEvents:UIControlEventValueChanged];
    [self.startDateText setInputView:datePicker3];
    
    
    self.websiteView.layer.cornerRadius = 10.0;
    [self.websiteView.layer setMasksToBounds:YES];
    
    self.websiteView.frame = CGRectInset(self.websiteView.frame, -0.5f, -0.5f);
    self.websiteView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.websiteView.layer.borderWidth = 0.5f;
    
    self.locationView.layer.cornerRadius = 10.0;
    [self.locationView.layer setMasksToBounds:YES];
    
    self.locationView.frame = CGRectInset(self.locationView.frame, -0.5f, -0.5f);
    self.locationView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.locationView.layer.borderWidth = 0.5f;
    
    self.vatView.layer.cornerRadius = 10.0;
    [self.vatView.layer setMasksToBounds:YES];
    
    self.vatView.frame = CGRectInset(self.vatView.frame, -0.5f, -0.5f);
    self.vatView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.vatView.layer.borderWidth = 0.5f;
    
    self.registrationView.layer.cornerRadius = 10.0;
    [self.registrationView.layer setMasksToBounds:YES];
    
    self.registrationView.frame = CGRectInset(self.registrationView.frame, -0.5f, -0.5f);
    self.registrationView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.registrationView.layer.borderWidth = 0.5f;
    
    self.dateView.layer.cornerRadius = 10.0;
    [self.dateView.layer setMasksToBounds:YES];
    
    self.dateView.frame = CGRectInset(self.dateView.frame, -0.5f, -0.5f);
    self.dateView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.dateView.layer.borderWidth = 0.5f;
    
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

-(void)updateTime:(id)sender
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"dd.MM.yyyy";
    UIDatePicker *picker = (UIDatePicker*)self.startDateText.inputView;
    self.startDateText.text = [formatter stringFromDate:picker.date];
}

- (IBAction)next:(id)sender {
    
    /*if ([self.websiteText.text isEqual:@""])
    {
        [ToastView showToastInParentView:self.view withText:@"Enter website" withDuaration:2.0];
    }
    else if ([self.locationNotext.text isEqual:@""])
    {
        [ToastView showToastInParentView:self.view withText:@"Enter Location No" withDuaration:2.0];
    }
    else if ([self.vatNoText.text isEqual:@""])
    {
        [ToastView showToastInParentView:self.view withText:@"Enter Vat No" withDuaration:2.0];
    }
    else if ([self.regNoText.text isEqual:@""])
    {
        [ToastView showToastInParentView:self.view withText:@"Enter Registration No" withDuaration:2.0];
    }
    else if ([self.locationNotext.text isEqual:@""])
    {
        [ToastView showToastInParentView:self.view withText:@"Enter Business Start Date" withDuaration:2.0];
    }
    else*/
    {
        if (self.edit) {
            
            [self.loading startAnimating];
            
            NSDictionary *inventory = @{
                                       
                                        @"website" : self.websiteText.text,
                                        @"have_many_location" : self.locationNotext.text,
                                        @"vat_number" : self.vatNoText.text,
                                        @"registration_number" : self.regNoText.text,
                                        @"start_date" : self.startDateText.text,
                                        };
            
            [JSONHTTPClient postJSONFromURLWithString:[NSString stringWithFormat:@"%@business/updateAdditional",baseurl] params:inventory
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
                                                       
                                                       app.business.website = self.websiteText.text;
                                                       app.business.haveManyLocation = [self.locationNotext.text intValue];
                                                       app.business.vatNumber = self.vatNoText.text;
                                                       app.business.registrationNumber = self.regNoText.text;
                                                       
                                                       
                                                       NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                                                       formatter.dateFormat = @"dd.MM.yyyy";
                                                       NSDate *date =[formatter dateFromString:self.startDateText.text];
                                                       formatter.dateFormat = @"yyyy-MM-d HH:mm:ss";
                                                       
                                                       app.business.startDate = [formatter stringFromDate:date];
                                                       
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
        [self.loading startAnimating];
        
        BusinessAddress *addressT= [[BusinessAddress alloc]init];
        addressT.country = self.country.nickName;
        addressT.city = self.city;
        addressT.postCode = self.postcode;
        addressT.address = self.address;
        addressT.id = 0;
        addressT.businessId = 0;
        
        
        NSMutableArray *addressArray = [[NSMutableArray alloc]init];
        [addressArray addObject:[addressT toDictionary]];
    
        
        NSError* error;
        NSData *dataR = [NSJSONSerialization dataWithJSONObject:addressArray options:NSJSONWritingPrettyPrinted error:&error];
        NSString* jsonString = [[NSString alloc] initWithData:dataR encoding:NSUTF8StringEncoding];
        
        NSDictionary *inventory = @{
                                    @"name" : self.name,
                                    @"address" : jsonString,
                                    @"website" : self.websiteText.text,
                                    @"company_type" : [NSString stringWithFormat:@"%d",self.type.id],
                                    @"have_many_location" : self.locationNotext.text,
                                    @"vat_number" : self.vatNoText.text,
                                    @"registration_number" : self.regNoText.text,
                                    @"start_date" : self.startDateText.text,
                                    @"about" : self.shortDescription,
                                    };
        
        [JSONHTTPClient postJSONFromURLWithString:[NSString stringWithFormat:@"%@business/add",baseurl] params:inventory
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
                                                   
                                                   NSLog(@"%@",self.response);
                                                   NSInteger numberOfViewControllers = self.navigationController.viewControllers.count;
                                                   BusinessShowViewController *data = [[BusinessShowViewController alloc]init];

                                                   DashboardViewController *data1 = [self.navigationController.viewControllers objectAtIndex:numberOfViewControllers - 4];
                                                   [self.navigationController popToViewController:data1 animated:YES];
                                                   [self.navigationController pushViewController:data animated:YES];
                                                   
                                               }
                                               else
                                               {
                                                   [ToastView showToastInParentView:self.view withText:self.response.responseStat.msg withDuaration:2.0];
                                               }
                                           }
                                           
                                           [self.loading stopAnimating];
                                           
                                       }];
        }
    }
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


-(void) viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    
    self.websiteText.text = (self.website) ? self.website : @"";
    self.vatNoText.text = (self.vatNo) ? self.vatNo : @"";
    self.regNoText.text = (self.regNo) ? self.regNo : @"";
    self.locationNotext.text = (self.locationNo) ? self.locationNo : @"";
    self.startDateText.text = (self.startDate) ? self.startDate : @"";

    
    [self.nextBtn setTitle:(self.edit)?@"Update":@"next" forState:UIControlStateNormal];
    self.backBtn.hidden = self.edit;
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
