//
//  DashboardViewController.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/7/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "DashboardViewController.h"
#import "BusinessShowViewController.h"
#import "ToastView.h"
#import "JSONHTTPClient.h"
#import "JSONModelLib.h"
#import "AppDelegate.h"

#define kPayPalEnvironment PayPalEnvironmentSandbox

@interface DashboardViewController ()

@end

@implementation DashboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    defaults = [NSUserDefaults standardUserDefaults];
    baseurl = [defaults objectForKey:@"baseurl"];
    
    // Set up payPalConfig
    _payPalConfig = [[PayPalConfiguration alloc] init];
#if HAS_CARDIO
    _payPalConfig.acceptCreditCards = YES;
#else
    _payPalConfig.acceptCreditCards = NO;
#endif
    _payPalConfig.merchantName = @"Cabguard Advert";
    _payPalConfig.merchantPrivacyPolicyURL = [NSURL URLWithString:@"https://www.paypal.com/webapps/mpp/ua/privacy-full"];
    _payPalConfig.merchantUserAgreementURL = [NSURL URLWithString:@"https://www.paypal.com/webapps/mpp/ua/useragreement-full"];
    _payPalConfig.languageOrLocale = [NSLocale preferredLanguages][0];
    _payPalConfig.payPalShippingAddressOption = PayPalShippingAddressOptionPayPal;
    self.environment = kPayPalEnvironment;
    
    NSLog(@"PayPal iOS SDK version: %@", [PayPalMobile libraryVersion]);

    
     self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self setPayPalEnvironment:self.environment];
    
    self.navigationController.navigationBarHidden = YES;
    
}

- (IBAction)showBussiness:(id)sender {
    
    [self.loading startAnimating];

    
    self.response = [[BusinessResponse alloc] initFromURLWithString:[NSString stringWithFormat:@"%@business/self/get",baseurl]
                                                    completion:^(JSONModel *model, JSONModelError *err){
                                                        
                                                        [self.loading stopAnimating];

                                                        
                                                        if(err)
                                                        {
                                                            [ToastView showToastInParentView:self.view withText:@"Server Unreachable" withDuaration:2.0];
                                                        }
                                                        else
                                                        {
                                                            NSLog(@"%@",self.response);
                                                        
                                                            if(self.response.responseStat.status)
                                                            {
                                                                AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
                                                                app.business = self.response.responseData;
                                                                [self performSegueWithIdentifier:@"show" sender:self];
                                                            }
                                                            else
                                                            {
                                                                [self performSegueWithIdentifier:@"entry" sender:self];
                                                            }
                                                        }
                                                        
                                                        
                                                        
                                                    }];
    
    
}


- (IBAction)postAdvert:(id)sender {
    
    [self.loading startAnimating];
    
    
    self.response = [[BusinessResponse alloc] initFromURLWithString:[NSString stringWithFormat:@"%@business/self/get",baseurl]
                                                         completion:^(JSONModel *model, JSONModelError *err){
                                                             
                                                             [self.loading stopAnimating];
                                                             
                                                             if(err)
                                                             {
                                                                 [ToastView showToastInParentView:self.view withText:@"Server Unreachable" withDuaration:2.0];
                                                             }
                                                             else
                                                             {
                                                                 NSLog(@"%@",self.response);
                                                                 
                                                                 if(self.response.responseStat.status)
                                                                 {
                                                                     AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
                                                                     app.business = self.response.responseData;
                                                                     [self performSegueWithIdentifier:@"post" sender:self];
                                                                 }
                                                                 else
                                                                 {
                                                                     [ToastView showToastInParentView:self.view withText:@"Entry bussiness data first" withDuaration:2.0];

                                                                 }
                                                             }
                                                             
                                                             
                                                             
                                                             
                                                         }];

    
}

- (IBAction)paymentcheck:(id)sender {
    
    PayPalItem *item1 = [PayPalItem itemWithName:@"Advert Post"
                                    withQuantity:2
                                       withPrice:[NSDecimalNumber decimalNumberWithString:@"100.00"]
                                    withCurrency:@"USD"
                                         withSku:@"Advert-00037"];
    NSArray *items = @[item1];
    
    NSDecimalNumber *subtotal = [PayPalItem totalPriceForItems:items];
    
    NSDecimalNumber *shipping = [[NSDecimalNumber alloc] initWithString:@"5.99"];
    NSDecimalNumber *tax = [[NSDecimalNumber alloc] initWithString:@"2.50"];
    PayPalPaymentDetails *paymentDetails = [PayPalPaymentDetails paymentDetailsWithSubtotal:subtotal
                                                                               withShipping:shipping
                                                                                    withTax:tax];
    
    NSDecimalNumber *total = [[subtotal decimalNumberByAdding:shipping] decimalNumberByAdding:tax];
    
    PayPalPayment *payment = [[PayPalPayment alloc] init];
    payment.amount = total;
    payment.currencyCode = @"USD";
    payment.shortDescription = @"Cabguard Advert";
    payment.items = items;
    payment.paymentDetails = paymentDetails;
    
    if (!payment.processable) {
        
    }
    
    
    self.payPalConfig.acceptCreditCards = self.acceptCreditCards;
    PayPalPaymentViewController *paymentViewController = [[PayPalPaymentViewController alloc] initWithPayment:payment
                                                                                                configuration:self.payPalConfig
                                                                                                     delegate:self];
    [self presentViewController:paymentViewController animated:YES completion:nil];
}

- (IBAction)close:(id)sender {
    
    
    [self.loading startAnimating];

    
    self.data = [[Response alloc] initFromURLWithString:[NSString stringWithFormat:@"%@logOutUser",baseurl]
                                                        completion:^(JSONModel *model, JSONModelError *err) {
                                                            
                                                            
                                                            [self.loading stopAnimating];

                                                            
                                                            
                                                        }];
    
     [defaults removeObjectForKey:@"access_token"];
     [defaults setValue:nil forKey:@"access_token"];
     [self.navigationController popToRootViewControllerAnimated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
    NSLog(@"PayPal Payment Success!");
    self.resultText = [completedPayment description];
    [ToastView showToastInParentView:self.view withText:self.resultText withDuaration:2.0];

    [self sendCompletedPaymentToServer:completedPayment]; // Payment was processed successfully; send to server for verification and fulfillment
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)payPalPaymentDidCancel:(PayPalPaymentViewController *)paymentViewController {
    NSLog(@"PayPal Payment Canceled");
    self.resultText = nil;
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark Proof of payment validation

- (void)sendCompletedPaymentToServer:(PayPalPayment *)completedPayment {
    // TODO: Send completedPayment.confirmation to server
    NSLog(@"Here is your proof of payment:\n\n%@\n\nSend this to your server for confirmation and fulfillment.", completedPayment.confirmation);
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"show"])
    {
        BusinessShowViewController *data= segue.destinationViewController;
        data.business = self.response.responseData;
        
    }
}


@end
