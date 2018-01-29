//
//  PostAdvertTwoViewController.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/7/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "PostAdvertTwoViewController.h"
#import "PostAdvertThreeViewController.h"
#import "ToastView.h"
#import "JSONHTTPClient.h"
#import "AdvertDetailsViewController.h"
#import "SelectionViewController.h"
#import "TimingViewController.h"
#import <GooglePlaces/GooglePlaces.h>
#import "JSONModelLib.h"
#import "AdverListViewController.h"
@interface PostAdvertTwoViewController ()<GMSAutocompleteViewControllerDelegate>
@property (strong,nonatomic) UITextField *activeField;
@end

@implementation PostAdvertTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];

    defaults = [NSUserDefaults standardUserDefaults];
    baseurl = [defaults objectForKey:@"baseurl"];
    
    self.cityView.layer.cornerRadius = 10.0;
    [self.cityView.layer setMasksToBounds:YES];
    
    self.cityView.frame = CGRectInset(self.cityView.frame, -0.5f, -0.5f);
    self.cityView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.cityView.layer.borderWidth = 0.5f;
    
    
    self.countryView.layer.cornerRadius = 10.0;
    [self.countryView.layer setMasksToBounds:YES];
    
    self.countryView.frame = CGRectInset(self.cityView.frame, -0.5f, -0.5f);
    self.countryView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.countryView.layer.borderWidth = 0.5f;
    
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
    
    self.aboutCompanyView.layer.cornerRadius = 10.0;
    [self.aboutCompanyView.layer setMasksToBounds:YES];
    self.aboutCompanyView.frame = CGRectInset(self.addressView.frame, -0.5f, -0.5f);
    self.aboutCompanyView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.aboutCompanyView.layer.borderWidth = 0.5f;
    
    self.customIdView.layer.cornerRadius = 10.0;
    [self.customIdView.layer setMasksToBounds:YES];
    
    self.customIdView.frame = CGRectInset(self.cityView.frame, -0.5f, -0.5f);
    self.customIdView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.customIdView.layer.borderWidth = 0.5f;
    
    self.refView.layer.cornerRadius = 10.0;
    [self.refView.layer setMasksToBounds:YES];
    
    self.refView.frame = CGRectInset(self.cityView.frame, -0.5f, -0.5f);
    self.refView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.refView.layer.borderWidth = 0.5f;
    
    self.infoView.layer.cornerRadius = 10.0;
    [self.infoView.layer setMasksToBounds:YES];
    
    self.infoView.frame = CGRectInset(self.cityView.frame, -0.5f, -0.5f);
    self.infoView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.infoView.layer.borderWidth = 0.5f;
    
    self.miscView.layer.cornerRadius = 10.0;
    [self.miscView.layer setMasksToBounds:YES];
    
    self.miscView.frame = CGRectInset(self.cityView.frame, -0.5f, -0.5f);
    self.miscView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.miscView.layer.borderWidth = 0.5f;
    
    self.nextBtn.layer.cornerRadius = 5.0;
    [self.nextBtn.layer setMasksToBounds:YES];
    
    self.backBtn.layer.cornerRadius = 5.0;
    [self.backBtn.layer setMasksToBounds:YES];
    
    self.countryView.frame = CGRectInset(self.cityView.frame, -0.5f, -0.5f);
    self.countryView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.countryView.layer.borderWidth = 0.5f;
    UITapGestureRecognizer * tabgesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(getcountry:)];
    [self.countryView addGestureRecognizer:tabgesture];
    
    self.singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:self.singleTap];
     [self registerForKeyboardNotifications];
    self.customId.delegate = self;
    self.refText.delegate = self;
    self.infoText.delegate = self;
    self.miscText.delegate = self;
    [self setCountryData];
    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(keyboardDidShowOrHide:)
//                                                 name:UIKeyboardWillShowNotification
//                                               object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(keyboardDidShowOrHide:)
//                                                 name:UIKeyboardWillHideNotification
//                                               object:nil];
    
}

-(void) getcountry :(UITapGestureRecognizer *)sender{
//    [self performSegueWithIdentifier:@"country" sender:sender];
    GMSAutocompleteViewController *acController = [[GMSAutocompleteViewController alloc] init];
    acController.delegate = self;
    [self presentViewController:acController animated:YES completion:nil];
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
    
    self.cityText.text = (self.city) ? self.city : @"";
    self.countryLbl.text = (self.advertData.advertAddress.country.nickName) ? self.advertData.advertAddress.country.nickName: @"Choose Address";
    self.postcodeText.text = (self.postcode) ? self.postcode : @"";
    self.addressText.text = (self.address) ? self.address : @"";
    self.customId.text = (self.custom) ? self.custom : @"";
    self.refText.text = (self.ref) ? self.ref : @"";
    self.miscText.text = (self.misc) ? self.misc : @"";
    self.infoText.text = (self.info) ? self.info : @"";
    self.aboutCompanyText.text = (self.aboutCompany)? self.aboutCompany:@"";
  
    self.title = (self.edit)?@"Edit Advert":@"Post Advert";
    [self.nextBtn setTitle:(self.edit)?@"Update":@"next" forState:UIControlStateNormal];
     self.backBtn.hidden = self.edit;
    
    if(self.country){
        self.countryLbl.text = _country.nickName;
        self.countryLbl.textColor = [UIColor blackColor];
    }
    self.cityText.userInteractionEnabled = NO;
    self.addressText.userInteractionEnabled = NO;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    self.activeField = textField;
}
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}

//-(void)keyboardDidShowOrHide:(NSNotification *)notification
//{
//    NSDictionary *userInfo = [notification userInfo];
//    NSTimeInterval animationDuration;
//    UIViewAnimationCurve animationCurve;
//    CGRect keyboardEndFrame;
//
//    [[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] getValue:&animationCurve];
//    [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
//    [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] getValue:&keyboardEndFrame];
//
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:animationDuration];
//    [UIView setAnimationCurve:animationCurve];
//
//    CGRect newFrame = self.view.frame;
//    newFrame.origin.y = keyboardEndFrame.origin.y - newFrame.size.height;
//    self.view.frame = newFrame;
//
//
//
//    [UIView commitAnimations];
//}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your application might not need or want this behavior.
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    if (!CGRectContainsPoint(aRect, self.activeField.frame.origin) ) {
        CGPoint scrollPoint = CGPointMake(0.0, self.activeField.frame.origin.y-kbSize.height);
        [self.scrollView setContentOffset:scrollPoint animated:YES];
    }
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
}
- (IBAction)next:(id)sender {
    if ([self.cityText.text isEqual:@""])
    {
        [ToastView showToastInParentView:self.view withText:@"Enter city" withDuaration:2.0];
    }
    else if ([self.countryLbl.text isEqual:@"Choose Address"])
    {
        [ToastView showToastInParentView:self.view withText:@"Enter country" withDuaration:2.0];
    }
    else if ([self.postcodeText.text isEqual:@""])
    {
        [ToastView showToastInParentView:self.view withText:@"Enter postcode" withDuaration:2.0];
    }
    else if ([self.addressText.text isEqual:@""])
    {
        [ToastView showToastInParentView:self.view withText:@"Enter bussiness address" withDuaration:2.0];
    }
    else
    {
        if (self.edit)
        {
            [self.loading startAnimating];
            
            NSDictionary *inventory = @{
                                        
                                        @"id": self.id,
                                        @"discount" : [NSString stringWithFormat:@"%f",self.advertData.discount ],
                                        @"price" : [NSString stringWithFormat:@"%f",self.advertData.price],
                                        @"offer" : self.advertData.offer,
                                        @"address" : self.addressText.text,
                                        @"about_company": self.advertData.aboutCompany,
                                        @"location" :  self.cityText.text,
                                        @"postcode" : self.postcodeText.text,
                                        @"custom_id" :self.customId.text,
                                        @"ref"   : self.refText.text,
                                        @"nb":self.infoText.text,
                                        @"misc":self.miscText.text,
                                        @"limitation" : self.advertData.limitation,
                                        @"always_open"   :[NSString stringWithFormat:@"%d",self.advertData.alwaysOpen] ,
                                        @"website" : self.advertData.website,
                                        @"company_name" : self.advertData.companyName,
                                        @"phone_number" :  self.advertData.phoneNumber,
                                        @"discount_currency" : [NSString stringWithFormat:@"%d",self.advertData.discountCurrency.id],
                                        @"currency_id" : [NSString stringWithFormat:@"%d",self.advertData.currency.id],
                                        @"company_type_id" : [NSString stringWithFormat:@"%d",self.companyType.id],
                                        @"country": [NSString stringWithFormat:@"%d",self.advertData.advertAddress.country.id],
                                        @"company_type_other":(self.companyTypeOther != nil) ? self.companyTypeOther : @"",
                                        @"online_store_address":self.advertData.onlineStoreAddress,
                                        @"sales_line":self.advertData.salesLine,
                                        @"enquiries":self.advertData.enquiries,
                                        @"lat" :  self.lat,
                                        @"lng": self.lng
                                        
                                        };
            
            [JSONHTTPClient postJSONFromURLWithString:[NSString stringWithFormat:@"%@api/advertpost/update",baseurl] params:inventory
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
                                                       
                                                       Advert *data = [[Advert alloc]init];
                                                       data.id = [self.id intValue];
                                                       data.discountCurrency = self.discountCurrency;
                                                       data.currency= self.currency;
                                                       data.companyType = self.companyType;
                                                       data.companyName = self.companyName;
                                                       data.phoneNumber = self.phoneNumber;
                                                       data.website = self.website;
                                                       data.discount = [self.discount floatValue];
                                                       data.price = [self.price floatValue];
                                                       data.offer = self.descriptn;
                                                       data.limitation = self.limitationStr;
                                                       data.customId = self.customId.text;
                                                       data.ref = self.refText.text;
                                                       data.nb = self.infoText.text;
                                                       data.misc = self.miscText.text;
                                                       data.aboutCompany = self.aboutCompanyText.text;
                                                       
                                                       AdvertAddress *address=[[AdvertAddress alloc]init];
                                                       address.location = self.cityText.text;
                                                       address.postCode = self.postcodeText.text;
                                                       address.address = self.addressText.text;
                                                       
                                                       
                                                       data.advertAddress = address;
                                                       
                                                       
                                                       AdvertOpening *opening=[[AdvertOpening alloc]init];
                                                       opening.openingStartDay = [self.openingDayFisrt intValue];
                                                       opening.openingEndDay = [self.openingDayLast intValue];
                                                       opening.closingStartDay = [self.closingDayFirstStr intValue];
                                                       opening.closingEndDay = [self.closingDayLastStr intValue];
                                                       opening.openingTime = [self.openTime floatValue];
                                                       opening.closingTime = [self.closeTime floatValue];
                                                       data.advertOpening = opening;
                                                       NSInteger numberOfViewControllers = self.navigationController.viewControllers.count;
                                                       AdvertDetailsViewController *data1 = [self.navigationController.viewControllers objectAtIndex:numberOfViewControllers - 2];
                                                       data1.data = data;
                                                       data1.editedImg = self.image;
                                                       data1.edited = true;
                                                       AdverListViewController *data2 = [self.navigationController.viewControllers objectAtIndex:numberOfViewControllers - 3];
                                                       [self.navigationController popToViewController:data2 animated:YES];
                                                       
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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"next"])
    {
        TimingViewController *data= segue.destinationViewController;
        data.image = self.image;
        data.otherImg = self.otherImg;
        data.bannerImage = self.bannerImage;
        data.discount = self.discount;
        data.price = self.price;
        data.descriptn = self.descriptn;
        data.city = self.cityText.text;
        data.postcode = self.postcodeText.text;
        data.address = self.addressText.text;
        data.aboutCompany = self.aboutCompanyText.text;
        data.website = self.website;
        data.companyName = self.companyName;
        data.phoneNumber = self.phoneNumber;
        data.currency = self.currency;
        data.discountCurrency = self.discountCurrency;
        data.companyType = self.companyType;
        data.customId = self.customId.text;
        data.ref = self.refText.text;
        data.info = self.infoText.text;
        data.misc = self.miscText.text;
        data.country = self.country;
        data.companyTypeOther = self.companyTypeOther;
        data.lat = self.lat;
        data.lng = self.lng;
        
    }
    if ([segue.identifier isEqualToString:@"country"])
    {
        SelectionViewController *data= segue.destinationViewController;
        data.type = 4;
        
    }
}
#pragma MARK:- Google Autocomplete
// Handle the user's selection.
- (void)viewController:(GMSAutocompleteViewController *)viewController
didAutocompleteWithPlace:(GMSPlace *)place {
    [self dismissViewControllerAnimated:YES completion:nil];
    // Do something with the selected place.
    self.lat = [NSString stringWithFormat:@"%f",place.coordinate.latitude ];
    self.lng = [NSString stringWithFormat:@"%f",place.coordinate.longitude ];
    self.address =  [NSString stringWithFormat:@"%@,%@", place.name ,place.formattedAddress];
    for (id object in place.addressComponents) {
    
        if([[object valueForKey:@"type"] isEqualToString:@"locality"]){
            self.city =  [object valueForKey:@"name"];
        }
        if([[object valueForKey:@"type"] isEqualToString:@"country"]){
            self.countryLbl.text = [object valueForKey:@"name"];
            for (Country *cn in self.countryData.responseData){
                if([[cn.nickName lowercaseString] isEqualToString:[[object valueForKey:@"name"] lowercaseString]]){
                    self.country = cn;
                }
            }
        }
        
    }
}

- (void)viewController:(GMSAutocompleteViewController *)viewController
didFailAutocompleteWithError:(NSError *)error {
    [self dismissViewControllerAnimated:YES completion:nil];
    // TODO: handle the error.
    NSLog(@"Error: %@", [error description]);
}

// User canceled the operation.
- (void)wasCancelled:(GMSAutocompleteViewController *)viewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

// Turn the network activity indicator on and off again.
- (void)didRequestAutocompletePredictions:(GMSAutocompleteViewController *)viewController {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

- (void)didUpdateAutocompletePredictions:(GMSAutocompleteViewController *)viewController {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

-(void) setCountryData{
    self.countryData = [[CountryResponse alloc] initFromURLWithString:[NSString stringWithFormat:@"%@country/all",baseurl]
                                                           completion:^(JSONModel *model, JSONModelError *err) {
                                                               
                                                               
                                                               if(self.countryData.responseStat.status){
                                                                   NSLog(@"%@",self.countryData);
                                                                  
                                                                   
                                                               }
                                                               
                                                               
                                                               
                                                           }];
}

@end
