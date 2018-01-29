//
//  PostAdvertOneViewController.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/7/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "PostAdvertOneViewController.h"
#import "PostAdvertTwoViewController.h"
#import "AdvertDetailsViewController.h"
#import "ToastView.h"
#import "SelectionViewController.h"
#import "JSONHTTPClient.h"
#import "UIImageView+WebCache.h"
#import "Advert.h"
#import "AdvertImagesViewController.h"
#import "AdverListViewController.h"
@interface PostAdvertOneViewController ()
@property (strong,nonatomic) UITextField *activeField;
@end

@implementation PostAdvertOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];

    defaults = [NSUserDefaults standardUserDefaults];
    baseurl = [defaults objectForKey:@"baseurl"];
    fineurl = [defaults objectForKey:@"fineurl"];
    
    self.discountView.layer.cornerRadius = 10.0;
    [self.discountView.layer setMasksToBounds:YES];
    
    self.discountView.frame = CGRectInset(self.discountView.frame, -0.5f, -0.5f);
    self.discountView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.discountView.layer.borderWidth = 0.5f;
    
    self.priceView.layer.cornerRadius = 10.0;
    [self.priceView.layer setMasksToBounds:YES];
    
    self.priceView.frame = CGRectInset(self.priceView.frame, -0.5f, -0.5f);
    self.priceView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.priceView.layer.borderWidth = 0.5f;
    
    self.descriptionView.layer.cornerRadius = 10.0;
    [self.descriptionView.layer setMasksToBounds:YES];
    
    self.descriptionView.frame = CGRectInset(self.priceView.frame, -0.5f, -0.5f);
    self.descriptionView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.descriptionView.layer.borderWidth = 0.5f;
    
    self.companyNameView.layer.cornerRadius = 10.0;
    [self.companyNameView.layer setMasksToBounds:YES];
    
    self.companyNameView.frame = CGRectInset(self.companyNameView.frame, -0.5f, -0.5f);
    self.companyNameView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.companyNameView.layer.borderWidth = 0.5f;
    
    self.companyTypeView.layer.cornerRadius = 10.0;
    [self.companyTypeView.layer setMasksToBounds:YES];
    
    self.companyTypeView.frame = CGRectInset(self.companyTypeView.frame, -0.5f, -0.5f);
    self.companyTypeView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.companyTypeView.layer.borderWidth = 0.5f;
    
    self.websiteView.layer.cornerRadius = 10.0;
    [self.websiteView.layer setMasksToBounds:YES];
    
    self.websiteView.frame = CGRectInset(self.websiteView.frame, -0.5f, -0.5f);
    self.websiteView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.websiteView.layer.borderWidth = 0.5f;
    
    self.phoneView.layer.cornerRadius = 10.0;
    [self.phoneView.layer setMasksToBounds:YES];
    
    self.phoneView.frame = CGRectInset(self.phoneView.frame, -0.5f, -0.5f);
    self.phoneView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.phoneView.layer.borderWidth = 0.5f;
    
    self.discountCurrencyView.layer.cornerRadius = 10.0;
    [self.discountCurrencyView.layer setMasksToBounds:YES];
    
    self.discountCurrencyView.frame = CGRectInset(self.discountCurrencyView.frame, -0.5f, -0.5f);
    self.discountCurrencyView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.discountCurrencyView.layer.borderWidth = 0.5f;
    
    self.priceCurrencyView.layer.cornerRadius = 10.0;
    [self.priceCurrencyView.layer setMasksToBounds:YES];
    
    self.priceCurrencyView.frame = CGRectInset(self.priceCurrencyView.frame, -0.5f, -0.5f);
    self.priceCurrencyView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.priceCurrencyView.layer.borderWidth = 0.5f;

    
    
    
    self.nextBtn.layer.cornerRadius = 20.0;
    [self.nextBtn.layer setMasksToBounds:YES];
    
    self.singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [self.view addGestureRecognizer:self.singleTap];
    [self registerForKeyboardNotifications];
    self.phoneText.delegate = self;
    self.websiteText.delegate = self;
    self.companyNameText.delegate = self;
    self.priceText.delegate = self;
    self.discountText.delegate = self;
    self.discountText.delegate = self;
    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(keyboardDidShowOrHide:)
//                                                 name:UIKeyboardWillShowNotification
//                                               object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(keyboardDidShowOrHide:)
//                                                 name:UIKeyboardWillHideNotification
//                                               object:nil];
   
}

- (IBAction)next:(id)sender {
    
//    if (!self.image)
//    {
//        [ToastView showToastInParentView:self.view withText:@"Select A Image for your post" withDuaration:2.0];
//    }
//    else
    if ([self.discountText.text isEqual:@""])
    {
        [ToastView showToastInParentView:self.view withText:@"Enter The discount value" withDuaration:2.0];
    }
    else if ([self.discountCurrencyLabel.text isEqual:@""])
    {
        [ToastView showToastInParentView:self.view withText:@"Select The discount currency" withDuaration:2.0];
    }
    else if ([self.priceText.text isEqual:@""])
    {
        [ToastView showToastInParentView:self.view withText:@"Enter The Price" withDuaration:2.0];
    }
    else if ([self.priceCurrencyLabel.text isEqual:@""])
    {
        [ToastView showToastInParentView:self.view withText:@"Select The price currency" withDuaration:2.0];
    }
    else if ([self.descriptionText.text isEqual:@""])
    {
        [ToastView showToastInParentView:self.view withText:@"Enter a description for your post" withDuaration:2.0];
    }
    else if ([self.companyTypeLabel.text isEqual:@""])
    {
        [ToastView showToastInParentView:self.view withText:@"Selct company Type" withDuaration:2.0];
    }
    else if ([self.companyNameText.text isEqual:@""])
    {
        [ToastView showToastInParentView:self.view withText:@"Enter a company name" withDuaration:2.0];
    }
    else if ([self.websiteText.text isEqual:@""])
    {
        [ToastView showToastInParentView:self.view withText:@"Enter a company website" withDuaration:2.0];
    }
    else if ([self.phoneText.text isEqual:@""])
    {
        [ToastView showToastInParentView:self.view withText:@"Enter a phone number" withDuaration:2.0];
    }
    else if([self.companyType.name isEqualToString:@"Other"] && [self.companyTypeOther isEqualToString:@""]){
        [ToastView showToastInParentView:self.view withText:@"Enter Company type" withDuaration:2.0];
        [self showCompanyTypeOtherDialog];
    }
    else
    {
        if (self.edit)
        {
            [self.loading startAnimating];
            NSDictionary *inventory = @{
                                        @"id": self.id,
                                        @"discount" : self.discountText.text,
                                        @"price" : self.priceText.text,
                                        @"offer" : self.descriptionText.text,
                                        @"address" : self.address,
                                        @"about_company": self.advertData.aboutCompany,
                                        @"location" : self.advertData.advertAddress.location,
                                        @"postcode" : self.advertData.advertAddress.postCode,
                                        @"custom_id" :self.advertData.customId,
                                        @"ref"   : self.advertData.ref,
                                        @"nb":self.advertData.nb,
                                        @"misc":self.advertData.misc,
                                        @"limitation" : self.advertData.limitation,
                                        @"always_open"   :[NSString stringWithFormat:@"%d",self.advertData.alwaysOpen] ,
                                        @"website" : self.websiteText.text,
                                        @"company_name" : self.companyNameText.text,
                                        @"phone_number" :  self.phoneText.text,
                                        @"discount_currency" : [NSString stringWithFormat:@"%d",self.discountCurrency.id],
                                        @"currency_id" : [NSString stringWithFormat:@"%d",self.currency.id],
                                        @"company_type_id" : [NSString stringWithFormat:@"%d",self.companyType.id],
//                                        @"banner_image_tkn" : self.advertData.bannerImage,
//                                        @"other_images_tkn" :imgJsonString,
                                        @"country": [NSString stringWithFormat:@"%d",self.advertData.advertAddress.country.id],
                                        @"company_type_other":(self.companyTypeOther != nil) ? self.companyTypeOther : @"",
                                        @"online_store_address":self.advertData.onlineStoreAddress,
                                        @"sales_line":self.advertData.salesLine,
                                        @"enquiries":self.advertData.enquiries,
//                                        @"timings":self.timings,
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
                                                       data.companyName = self.companyNameText.text;
                                                       data.website = self.websiteText.text;
                                                       data.phoneNumber = self.phoneText.text;
                                                       data.discount = [self.discountText.text floatValue];
                                                       data.price = [self.priceText.text floatValue];
                                                       data.offer = self.descriptionText.text;
                                                       data.limitation = self.limitationStr;
                                                       
                                                       AdvertAddress *address=[[AdvertAddress alloc]init];
                                                       address.location = self.city;
                                                       address.postCode = self.postcode;
                                                       address.address = self.address;
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
           [self performSegueWithIdentifier:@"pickimage" sender:self];
        }
    }

     
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


- (IBAction)showImagePicker:(id)sender {
    
     [self showImagePickerForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
}

- (void)showImagePickerForSourceType:(UIImagePickerControllerSourceType)sourceType
{
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.modalPresentationStyle = UIModalPresentationCurrentContext;
    imagePickerController.sourceType = sourceType;
    imagePickerController.delegate = self;
    
    self.imagePickerController = imagePickerController;
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    [self dismissViewControllerAnimated:YES completion:NULL];
    self.picChange = true;
    self.image = image;
    self.imageView.image = image;
    
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}


- (IBAction)close:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (void)handleSingleTap:(UITapGestureRecognizer *)sender
{
    [self.view endEditing:YES];
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
    self.scrillView.contentInset = contentInsets;
    self.scrillView.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your application might not need or want this behavior.
    CGRect aRect = self.view.frame;
    aRect.size.height -= kbSize.height;
    if (!CGRectContainsPoint(aRect, self.activeField.frame.origin) ) {
        CGPoint scrollPoint = CGPointMake(0.0, self.activeField.frame.origin.y-kbSize.height);
        [self.scrillView setContentOffset:scrollPoint animated:YES];
    }
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scrillView.contentInset = contentInsets;
    self.scrillView.scrollIndicatorInsets = contentInsets;
}
-(void) viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    
    [self.view endEditing:YES];
    
    if (self.newPost) {
        
        self.priceText.text = @"";
        self.discountText.text =@"";
        self.descriptionText.text = @"";
        self.currency = nil;
        self.discountCurrency = nil;
        self.companyType = nil;
        self.companyNameText.text = @"";
        self.websiteText.text = @"";
        self.phoneText.text = @"";
        
        [ToastView showToastInParentView:self.view withText:@"Post Submission Success !!!" withDuaration:2.0];
        
        self.newPost = NO;
    }
    
    
    if (!self.typeChange) {
        self.companyNameText.text = (self.companyName) ? self.companyName: @"";
        self.websiteText.text = (self.website) ? self.website: @"";
        self.phoneText.text = (self.phoneNumber) ? self.phoneNumber: @"";
        self.priceText.text = (self.price) ? self.price: @"";
        self.discountText.text = (self.discount) ? self.discount: @"";
        self.descriptionText.text = (self.descriptn) ? self.descriptn: @"";
        self.imageView.image = (self.image)?self.image:[UIImage imageNamed:@"arrow164"];
    }
   
    
    self.discountCurrencyLabel.text = (self.discountCurrency) ? ([self.discountCurrency.currencyCode isEqual:@""])?@"Select Discount\nOffer ":self.discountCurrency.currencyCode: @"Select Discount\nOffer";
    self.priceCurrencyLabel.text = (self.currency) ? ([self.currency.currencyCode isEqual:@""])?@"Select \n Currency":self.currency.currencyCode: @"Select \n Currency";
    self.companyTypeLabel.text = (self.companyType) ? self.companyType.name: @"Select Company Type";
    if([self.companyType.name isEqualToString:@"Other"]){
        [self showCompanyTypeOtherDialog];
        
    }
    self.title = (self.edit)?@"Edit Advert":@"Post Advert";
    [self.nextBtn setTitle:(self.edit)?@"Update":@"next" forState:UIControlStateNormal];
}
-(void)showCompanyTypeOtherDialog{
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle: @"Company Category"
                                                                              message: @""
                                                                       preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Company Type";
        //            textField.textColor = [UIColor blueColor];
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.borderStyle = UITextBorderStyleRoundedRect;
    }];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSArray * textfields = alertController.textFields;
        UITextField * namefield = textfields[0];
        NSLog(@"%@",namefield.text);
        self.companyTypeOther = namefield.text;
        
    }]];
    [self presentViewController:alertController animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"next"])
    {
        PostAdvertTwoViewController *data= segue.destinationViewController;
        data.image = self.imageView.image;
        data.discount = self.discountText.text;
        data.price = self.priceText.text;
        data.descriptn = self.descriptionText.text;
        data.website = self.websiteText.text;
        data.companyName = self.companyNameText.text;
        data.phoneNumber = self.phoneText.text;
        data.currency = self.currency;
        data.discountCurrency = self.discountCurrency;
        data.companyType = self.companyType;
        data.companyTypeOther = self.companyTypeOther;
    }
    if ([segue.identifier isEqualToString:@"pickimage"])
    {
        AdvertImagesViewController *data= segue.destinationViewController;
        data.discount = self.discountText.text;
        data.price = self.priceText.text;
        data.descriptn = self.descriptionText.text;
        data.website = self.websiteText.text;
        data.companyName = self.companyNameText.text;
        data.phoneNumber = self.phoneText.text;
        data.currency = self.currency;
        data.discountCurrency = self.discountCurrency;
        data.companyType = self.companyType;
    }
    if ([segue.identifier isEqualToString:@"companyType"])
    {
        SelectionViewController *data= segue.destinationViewController;
        data.type = 0;
       
    }
    
    if ([segue.identifier isEqualToString:@"discount"])
    {
        SelectionViewController *data= segue.destinationViewController;
        data.type = 1;
        
    }
    
    if ([segue.identifier isEqualToString:@"price"])
    {
        SelectionViewController *data= segue.destinationViewController;
        data.type = 2;
    }
}

@end
