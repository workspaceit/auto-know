//
//  PostAdvertThreeViewController.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/7/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "PostAdvertThreeViewController.h"
#import "ToastView.h"
#import "JSONHTTPClient.h"
#import "JSONModelLib.h"
#import "PostAdvertOneViewController.h"
#import "Day.h"
#import "Advert.h"
#import "AdvertDetailsViewController.h"
#import "AppDelegate.h"
#import "ImageResponse.h"
#import "AdverListViewController.h"
//#define kPayPalEnvironment PayPalEnvironmentSandbox

@interface PostAdvertThreeViewController ()
@property(nonatomic) NSString *bimToken;
@property(nonatomic) NSMutableArray *tokens;
@end

@implementation PostAdvertThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    defaults = [NSUserDefaults standardUserDefaults];
    baseurl = [defaults objectForKey:@"baseurl"];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    // Set up payPalConfig
//    _payPalConfig = [[PayPalConfiguration alloc] init];
//#if HAS_CARDIO
//    _payPalConfig.acceptCreditCards = YES;
//#else
//    _payPalConfig.acceptCreditCards = NO;
//#endif
//    _payPalConfig.merchantName = @"Cabguard Advert";
//    _payPalConfig.merchantPrivacyPolicyURL = [NSURL URLWithString:@"https://www.paypal.com/webapps/mpp/ua/privacy-full"];
//    _payPalConfig.merchantUserAgreementURL = [NSURL URLWithString:@"https://www.paypal.com/webapps/mpp/ua/useragreement-full"];
//    _payPalConfig.languageOrLocale = [NSLocale preferredLanguages][0];
//    _payPalConfig.payPalShippingAddressOption = PayPalShippingAddressOptionPayPal;
//    self.environment = kPayPalEnvironment;
//    
//    NSLog(@"PayPal iOS SDK version: %@", [PayPalMobile libraryVersion]);

    
    UIDatePicker *datePicker3 = [[UIDatePicker alloc]init];
    [datePicker3 setDate:[NSDate date]];
    [datePicker3 setDatePickerMode:UIDatePickerModeTime];
    [datePicker3 addTarget:self action:@selector(updateOpeningTime:) forControlEvents:UIControlEventValueChanged];
    [self.opentimeText setInputView:datePicker3];
    
    UIDatePicker *datePicker4 = [[UIDatePicker alloc]init];
    [datePicker4 setDate:[NSDate date]];
    [datePicker4 setDatePickerMode:UIDatePickerModeTime];
    [datePicker4 addTarget:self action:@selector(updateClosingTime:) forControlEvents:UIControlEventValueChanged];
    [self.closetimeText setInputView:datePicker4];
    
    self.datePicker5 = [[UIPickerView alloc]init];
    [self.datePicker5 setDataSource: self];
    [self.datePicker5 setDelegate: self];
    self.datePicker5.showsSelectionIndicator = YES;
    [self.closingdayText setInputView:self.datePicker5];
    
    self.datePicker6 = [[UIPickerView alloc]init];
    [self.datePicker6 setDataSource: self];
    [self.datePicker6 setDelegate: self];
    self.datePicker6.showsSelectionIndicator = YES;
    [self.closingdayTwoText setInputView:self.datePicker6];
    
    self.datePicker1 = [[UIPickerView alloc]init];
    [self.datePicker1 setDataSource: self];
    [self.datePicker1 setDelegate: self];
    self.datePicker1.showsSelectionIndicator = YES;
    [self.openingdayText setInputView: self.datePicker1];
    
    self.datePicker2 = [[UIPickerView alloc]init];
    [self.datePicker2 setDataSource: self];
    [self.datePicker2 setDelegate: self];
    self.datePicker2.showsSelectionIndicator = YES;
    [self.openingdayTwoText setInputView:self.datePicker2];
    

    
    self.openingDayFirst.layer.cornerRadius = 10.0;
    [self.openingDayFirst.layer setMasksToBounds:YES];
    
    self.openingDayFirst.frame = CGRectInset(self.openingDayFirst.frame, -0.5f, -0.5f);
    self.openingDayFirst.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.openingDayFirst.layer.borderWidth = 0.5f;
    
    self.openingDaySecond.layer.cornerRadius = 10.0;
    [self.openingDaySecond.layer setMasksToBounds:YES];
    
    self.openingDaySecond.frame = CGRectInset(self.openingDaySecond.frame, -0.5f, -0.5f);
    self.openingDaySecond.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.openingDaySecond.layer.borderWidth = 0.5f;
    
    self.openingTime.layer.cornerRadius = 10.0;
    [self.openingTime.layer setMasksToBounds:YES];
    
    self.openingTime.frame = CGRectInset(self.openingTime.frame, -0.5f, -0.5f);
    self.openingTime.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.openingTime.layer.borderWidth = 0.5f;
    
    self.closingTime.layer.cornerRadius = 10.0;
    [self.closingTime.layer setMasksToBounds:YES];
    
    self.closingTime.frame = CGRectInset(self.closingTime.frame, -0.5f, -0.5f);
    self.closingTime.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.closingTime.layer.borderWidth = 0.5f;

    
    
    self.closingDayFirst.layer.cornerRadius = 10.0;
    [self.closingDayFirst.layer setMasksToBounds:YES];
    
    self.closingDayFirst.frame = CGRectInset(self.closingDayFirst.frame, -0.5f, -0.5f);
    self.closingDayFirst.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.closingDayFirst.layer.borderWidth = 0.5f;
    
    self.closingDaySecond.layer.cornerRadius = 10.0;
    [self.closingDaySecond.layer setMasksToBounds:YES];
    
    self.closingDaySecond.frame = CGRectInset(self.closingDaySecond.frame, -0.5f, -0.5f);
    self.closingDaySecond.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.closingDaySecond.layer.borderWidth = 0.5f;
    
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
    
    
   /* [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShowOrHide:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShowOrHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil]; */
    
    
    
    
    [self initDays];
    self.tokens = [[NSMutableArray alloc]init];
}
- (IBAction)alwaysOnSwitchAction:(UISwitch *)sender {
    if(sender.isOn){
        [self.closeTimeView setHidden:YES];
        [self.closingDayFirst setHidden:YES];
        [self.closingDaySecond setHidden:YES];
        [self.openingdayText setText:@"Sat"];
        [self.openingdayTwoText setText:@"Fri"];
        self.openingdayTwoText.enabled = NO;
        self.openingdayText.enabled = NO;
        self.open1 = @"1";
        self.open2 = @"7";
        
    }else{
        [self.closeTimeView setHidden:NO];
        [self.closingDayFirst setHidden:NO];
        [self.closingDaySecond setHidden:NO];
        [self.openingdayText setText:@""];
        [self.openingdayTwoText setText:@""];
        self.openingdayTwoText.enabled = YES;
        self.openingdayText.enabled = YES;
        
        self.open1 = NULL;
        self.open2 = NULL;
    }
}

-(void)initDays
{
    self.myObject = [[NSMutableArray alloc] init];
    
    for (int i=1;i<=7;i++) {
        
        Day *day=[[Day alloc]init];
        day.value = i;
        
        if(i==1)
        {
            day.name = @"Sat";
        }
        else if (i==2)
        {
            day.name = @"Sun";
        }
        else if (i==3)
        {
            day.name = @"Mon";
        }
        else if (i==4)
        {
            day.name = @"Tue";
        }
        else if (i==5)
        {
            day.name = @"Wed";
        }
        else if (i==6)
        {
            day.name = @"Thu";
        }
        else
        {
            day.name = @"Fri";
        }
        
        [self.myObject addObject:day];
        
    }
    
    [self.datePicker1 reloadAllComponents];
    [self.datePicker2 reloadAllComponents];
    [self.datePicker5 reloadAllComponents];
    [self.datePicker6 reloadAllComponents];
    
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
    
    Day *day = self.myObject[row];
    
    if(pickerView == self.datePicker1)
    {
        self.openingdayText.text = day.name;
        self.open1 = [NSString stringWithFormat:@"%d",day.value];
    }
    
    if(pickerView == self.datePicker2)
    {
        self.openingdayTwoText.text = day.name;
        self.open2 = [NSString stringWithFormat:@"%d",day.value];
    }
    
    if(pickerView == self.datePicker5)
    {
        self.closingdayText.text = day.name;
        self.close1 = [NSString stringWithFormat:@"%d",day.value];
    }
    
    if(pickerView == self.datePicker6)
    {
        self.closingdayTwoText.text = day.name;
        self.close2 = [NSString stringWithFormat:@"%d",day.value];
    }
    
   
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    return self.myObject.count;
}





- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    
    Day *day = self.myObject[row];
    
    return day.name;
}




-(void)updateOpeningTime:(id)sender
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH.mm";
    UIDatePicker *picker = (UIDatePicker*)self.opentimeText.inputView;
    self.opentimeText.text = [formatter stringFromDate:picker.date];
}

-(void)updateClosingTime:(id)sender
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH.mm";
    UIDatePicker *picker = (UIDatePicker*)self.closetimeText.inputView;
    self.closetimeText.text = [formatter stringFromDate:picker.date];
}


- (IBAction)next:(id)sender {
    NSLog(@"%@",[NSNumber numberWithBool:[self.alwaysOn isOn]]);
    
    if ([self.openingdayText.text isEqual:@""] || [self.openingdayTwoText.text isEqual:@""] || [self.opentimeText.text isEqual:@""] || [self.closetimeText.text isEqual:@""])
    {
        [ToastView showToastInParentView:self.view withText:@"Select Opening Time" withDuaration:2.0];
    }
    else if ([NSNumber numberWithBool:[self.alwaysOn isOn]]==0 &&([self.closingdayText.text isEqual:@""] || [self.closingdayTwoText.text isEqual:@""]))
    {
        [ToastView showToastInParentView:self.view withText:@"Select Closing Time" withDuaration:2.0];
    }
    else if ([self.limitation.text isEqual:@""])
    {
        [ToastView showToastInParentView:self.view withText:@"Enter Limitations" withDuaration:2.0];
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
                                        @"address" : self.advertData.advertAddress.address,
                                        @"about_company": self.advertData.aboutCompany,
                                        @"location" :  self.advertData.advertAddress.location,
                                        @"postcode" :self.advertData.advertAddress.postCode,
                                        @"custom_id" :self.advertData.customId,
                                        @"ref"   : self.advertData.ref,
                                        @"nb":self.advertData.nb,
                                        @"misc":self.advertData.misc,
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
                                        @"online_store_address":self.onlineStoreTxt.text,
                                        @"sales_line":self.salesLine.text,
                                        @"enquiries":self.enquiries.text,
                                        @"lat" :  self.advertData.advertAddress.lat,
                                        @"lng": self.advertData.advertAddress.lng
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
                                                       data.customId = self.customId;
                                                       data.ref = self.ref;
                                                       data.nb = self.info;
                                                       data.misc = self.misc;
                                                       data.alwaysOpen =[self.alwaysOn isOn];
                                                       
                                                       AdvertAddress *address=[[AdvertAddress alloc]init];
                                                       address.location = self.city;
                                                       address.postCode = self.postcode;
                                                       address.address = self.address;
                                                       data.advertAddress = address;
                                                       
                                                       AdvertOpening *opening=[[AdvertOpening alloc]init];
                                                       opening.openingStartDay = [self.open1 intValue];
                                                       opening.openingEndDay = [self.open2 intValue];
                                                       opening.closingStartDay = [self.close1 intValue];
                                                       opening.closingEndDay = [self.close2 intValue];
                                                       opening.openingTime = [self.opentimeText.text floatValue];
                                                       opening.closingTime = [self.closetimeText.text floatValue];
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
            
            if (self.tncSwitch.isOn)
            {
                [self post];
            }
            else
            {
                [ToastView showToastInParentView:self.view withText:@"Have to agrees with the T.N.C for posting" withDuaration:2.0];
            }
       
        }
    }
    
    
}

- (void)paymentcheck{
    
    self.responseSub = [[SubscriptionResponse alloc] initFromURLWithString:[NSString stringWithFormat:@"%@api/subscription/get/config",baseurl]
                                                             completion:^(JSONModel *model, JSONModelError *err) {
                                                                 
                                                                 
                                                                 if(self.responseSub.responseStat.status){
//                                                                     NSLog(@"%@",self.responseSub);
//                                                                     
//                                                                     PayPalItem *item1 = [PayPalItem itemWithName:@"Advert Post Subscription"
//                                                                                                     withQuantity:2
//                                                                                                        withPrice:[NSDecimalNumber decimalNumberWithString:[NSString stringWithFormat:@"%f",self.responseSub.responseData.price]]
//                                                                                                     withCurrency:self.responseSub.responseData.currency
//                                                                                                          withSku:[NSString stringWithFormat:@"Advert-%@",self.responseSub.responseData.createdDate]];
//                                                                     NSArray *items = @[item1];
//                                                                     
//                                                                     NSDecimalNumber *subtotal = [PayPalItem totalPriceForItems:items];
//                                                                     
//                                                                     NSDecimalNumber *shipping = [[NSDecimalNumber alloc] initWithString:@"0"];
//                                                                     NSDecimalNumber *tax = [[NSDecimalNumber alloc] initWithString:@"0"];
//                                                                     PayPalPaymentDetails *paymentDetails = [PayPalPaymentDetails paymentDetailsWithSubtotal:subtotal
//                                                                                                                                                withShipping:shipping
//                                                                                                                                                     withTax:tax];
//                                                                     
//                                                                     NSDecimalNumber *total = [[subtotal decimalNumberByAdding:shipping] decimalNumberByAdding:tax];
//                                                                     
//                                                                     PayPalPayment *payment = [[PayPalPayment alloc] init];
//                                                                     payment.amount = total;
//                                                                     payment.currencyCode = self.responseSub.responseData.currency;
//                                                                     payment.shortDescription = @"Cabguard Advert";
//                                                                     payment.items = items;
//                                                                     payment.paymentDetails = paymentDetails;
//                                                                     
//                                                                     if (!payment.processable) {
//                                                                         
//                                                                     }
//                                                                     
//                                                                     
//                                                                     self.payPalConfig.acceptCreditCards = self.acceptCreditCards;
//                                                                     PayPalPaymentViewController *paymentViewController = [[PayPalPaymentViewController alloc] initWithPayment:payment
//                                                                                                                                                                 configuration:self.payPalConfig
//                                                                                                                                                                      delegate:self];
//                                                                     [self presentViewController:paymentViewController animated:YES completion:nil];

                                                                    
                                                                     
                                                                 }
                                                                 
                                                                 
                                                                 
                                                             }];

    
   }


-(NSString*) imageToString : (UIImage*) image{
    CGFloat compression = 0.9f;
    CGFloat maxCompression = 0.1f;
    int maxFileSize = 250*1024;
    
    NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
    
    while ([imageData length] > maxFileSize && compression > maxCompression)
    {
        compression -= 0.1;
        imageData = UIImageJPEGRepresentation(image, compression);
    }
    
    return [imageData base64EncodedStringWithOptions:0];
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

- (IBAction)tnc:(id)sender {
    
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://cabguardpro.com/terms"]];
}

-(void) viewWillAppear:(BOOL)animated
{
    NSLog(@"is always open :%d",self.always_open);
    self.navigationController.navigationBarHidden = NO;
    
    self.tncBtn.hidden = self.edit;
    self.tncSwitch.hidden = self.edit;
    
    if (!self.change) {
        NSNumberFormatter *fmt = [[NSNumberFormatter alloc] init];
        [fmt setPositiveFormat:@"0.##"];
        
        self.opentimeText.text = (self.openTime)?self.openTime : @"";
        self.closetimeText.text = (self.closeTime)?self.closeTime : @"";
        self.openingdayText.text = (self.openingDayFisrt)?[self dayName:[self.openingDayFisrt intValue]] : @"";
        self.openingdayTwoText.text = (self.openingDayLast)?[self dayName:[self.openingDayLast intValue]] : @"";
        
        self.open1 = (self.openingDayFisrt)?self.openingDayFisrt : @"";
        self.open2 = (self.openingDayLast)?self.openingDayLast : @"";
        
        self.closingdayText.text = (self.closingDayFirstStr)?[self dayName:[self.closingDayFirstStr intValue]] : @"";
        self.closingdayTwoText.text = (self.closingDayLastStr)?[self dayName:[self.closingDayLastStr intValue]] : @"";
        
        self.close1 = (self.closingDayFirstStr)?self.closingDayFirstStr : @"";
        self.close2 = (self.closingDayLastStr)?self.closingDayLastStr : @"";
        
        if(self.always_open){
            [self.alwaysOn setOn:YES animated:YES];
            [self.closeTimeView setHidden:YES];
            [self.closingDayFirst setHidden:YES];
            [self.closingDaySecond setHidden:YES];
            
        }
        
        
        self.limitation.text = (self.limitationStr)?self.limitationStr : @"";
        self.onlineStoreTxt.text = self.onlineStoreAddress? self.onlineStoreAddress:@"";
        self.salesLine.text = self.sales? self.sales:@"";
        self.enquiries.text = self.enquiry? self.enquiry:@"";
        self.title = (self.edit)?@"Edit Advert":@"Post Advert";
        [self.nextBtn setTitle:(self.edit)?@"Update":@"next" forState:UIControlStateNormal];
        self.backBtn.hidden = self.edit;
    }
   

}

-(NSString*) dayName:(int) value
{
    if (value == 1)
    {
        return @"Sat";
    }
    else if(value == 2)
    {
        return @"Sun";
    }
    else if(value == 3)
    {
        return @"Mon";
    }
    else if(value == 4)
    {
        return @"Tue";
    }
    else if(value == 5)
    {
        return @"Wed";
    }
    else if(value == 6)
    {
        return @"Thu";
    }
    else
    {
        return @"Fri";
    }
}

- (void)setPayPalEnvironment:(NSString *)environment {
    self.environment = environment;
    [PayPalMobile preconnectWithEnvironment:environment];
}

- (BOOL)acceptCreditCards {
    return self.payPalConfig.acceptCreditCards;
}

- (void)setAcceptCreditCards:(BOOL)acceptCreditCards {
    self.payPalConfig.acceptCreditCards = acceptCreditCards;
}

#pragma mark PayPalPaymentDelegate methods

- (void)payPalPaymentViewController:(PayPalPaymentViewController *)paymentViewController didCompletePayment:(PayPalPayment *)completedPayment {
    NSLog(@"PayPal Payment Success! %@",[completedPayment description]);
    self.resultText = [completedPayment description];
    self.change = true;
    [ToastView showToastInParentView:self.view withText:self.resultText withDuaration:2.0];
   
    
    [self sendCompletedPaymentToServer:completedPayment]; // Payment was processed successfully; send to server for verification and fulfillment
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)payPalPaymentDidCancel:(PayPalPaymentViewController *)paymentViewController {
    NSLog(@"PayPal Payment Canceled");
    self.resultText = nil;
    self.change = true;
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark Proof of payment validation

- (void)sendCompletedPaymentToServer:(PayPalPayment *)completedPayment {
    // TODO: Send completedPayment.confirmation to server
    NSLog(@"Here is your proof of payment:\n\n%@\n\nSend this to your server for confirmation and fulfillment.", completedPayment);
    
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *now = [[NSDate alloc] init];
    NSString *dateString = [format stringFromDate:now];
    
    
    
    NSDictionary *inventory = @{
                                @"txn_id" : completedPayment.confirmation[@"response"][@"id"],
                                @"mc_currency" : completedPayment.currencyCode,
                                @"payer_id" : [NSString stringWithFormat:@"%d",app.authCredential.id],
                                @"payment_status" : completedPayment.confirmation[@"response"][@"state"],
                                @"first_name" : app.authCredential.person.firstName,
                                @"last_name" : app.authCredential.person.lastName,
                                @"address_country_code" : app.authCredential.person.address.postCode,
                                @"address_country" :app.authCredential.person.address.city,
                                @"mc_gross" : completedPayment.amount,
                                @"tax" : @"0",
                                @"payment_date" : dateString
                                };
    
    NSLog(@"%@",inventory);
    
    [JSONHTTPClient postJSONFromURLWithString:[NSString stringWithFormat:@"%@api/paypal/return",baseurl] params:inventory
                                   completion:^(NSDictionary *json, JSONModelError *err) {
                                       
                                       NSError* error = nil;
                                       self.response = [[Response alloc] initWithDictionary:json error:&error];
                                       
                                       NSLog(@"%@",err);
                                       
                                       
                                       NSLog(@"%@",self.response);
                                           
                                           
                                        [ToastView showToastInParentView:self.view withText:self.response.responseStat.msg withDuaration:2.0];
                                               
            
                                       
                                       [self.loading stopAnimating];
                                       
                                   }];
     
    

}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) post{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self.otherImg  options:NSJSONWritingPrettyPrinted error:&error];
    NSString *imgJsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    NSDictionary *inventory = @{
                                @"discount" : self.discount,
                                @"price" : self.price,
                                @"offer" : self.descriptn,
                                @"address" : self.address,
                                @"about_company": self.aboutCompany,
                                @"location" : self.city,
                                @"postcode" : self.postcode,
                                @"custom_id" :self.customId,
                                @"ref"   : self.ref,
                                @"nb":self.info,
                                @"misc":self.misc,
                                @"limitation" : self.limitation.text,
                                @"always_open"   :[NSString stringWithFormat:@"%d",self.serviceAlwaysOn] ,
                                @"website" : self.website,
                                @"company_name" : self.companyName,
                                @"phone_number" : self.phoneNumber,
                                @"discount_currency" : [NSString stringWithFormat:@"%d",self.discountCurrency.id],
                                @"currency_id" : [NSString stringWithFormat:@"%d",self.currency.id],
                                @"company_type_id" : [NSString stringWithFormat:@"%d",self.companyType.id],
                                @"banner_image_tkn" : self.bannerImage,
                                @"other_images_tkn" :imgJsonString,
                                @"country": [NSString stringWithFormat:@"%d",self.country.id],
                                @"company_type_other":(self.companyTypeOther != nil) ? self.companyTypeOther : @"",
                                @"online_store_address":self.onlineStoreTxt.text,
                                @"sales_line":self.salesLine.text,
                                @"enquiries":self.enquiries.text,
                                @"timings":self.timings,
                                @"lat" :  self.lat,
                                @"lng": self.lng
                                };
    //   NSLog(@"%@",inventory);
    
    [JSONHTTPClient postJSONFromURLWithString:[NSString stringWithFormat:@"%@advertpost/add",baseurl] params:inventory
                                   completion:^(NSDictionary *json, JSONModelError *err) {
                                       
                                       NSError* error = nil;
                                       self.response = [[Response alloc] initWithDictionary:json error:&error];
                                       
                                       NSLog(@"json %@",json);
                                       
                                       if(error)
                                       {
                                           NSLog(@"error in  3 %@",error);
                                           [ToastView showToastInParentView:self.view withText:@"Server Unreachable" withDuaration:2.0];
                                       }
                                       else
                                       {
                                           NSLog(@"%@",self.response);
                                           
                                           if(self.response.responseStat.status){
                                               
                                               NSLog(@"%@",self.response);
                                               NSInteger numberOfViewControllers = self.navigationController.viewControllers.count;
                                               PostAdvertOneViewController *data1 = [self.navigationController.viewControllers objectAtIndex:numberOfViewControllers - 5];
                                               data1.newPost = YES;
                                               [self.navigationController popToViewController:data1 animated:YES];
                                               
                                           }
                                           else
                                           {
                                               [ToastView showToastInParentView:self.view withText:self.response.responseStat.msg withDuaration:2.0];
                                               
                                               if ([self.response.responseStat.msg isEqualToString:@"Your subscription expired"]) {
                                                   [self paymentcheck];
                                               }
                                           }
                                       }
                                       
                                       [self.loading stopAnimating];
                                       
                                   }];

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
