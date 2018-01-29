//
//  AdvertDetailsViewController.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/10/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "AdvertDetailsViewController.h"
#import "AdverListViewController.h"
#import "PostAdvertOneViewController.h"
#import "PostAdvertTwoViewController.h"
#import "PostAdvertThreeViewController.h"
#import "UIImageView+WebCache.h"
#import "JSONHTTPClient.h"
#import "ToastView.h"
#import "AppDelegate.h"
#import "MapViewController.h"
#import "AdvertImages.h"
#import "SingleImageViewController.h"
#import "AdvertImagesViewController.h"
#import "BusinessViewController.h"
#import "AdvertAddessViewController.h"
#import "OnlineViewController.h"
@interface AdvertDetailsViewController ()

@end

@implementation AdvertDetailsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    defaults = [NSUserDefaults standardUserDefaults];
    baseurl = [defaults objectForKey:@"baseurl"];
    fineurl = [defaults objectForKey:@"fineurl"];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    
    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    self.editBtn.hidden = (self.data.creator.id == app.authCredential.id)? false:true ;
 
    self.state = 0;
    [self changeState];
    _imagesCollection.delegate = self;
    _imagesCollection.dataSource = self;
    [_imagesCollection reloadData];
    NSLog(@"otherimages %lu", (unsigned long)[self.data.otherImages count]);
    
}




- (IBAction)back:(id)sender {
    
    NSInteger numberOfViewControllers = self.navigationController.viewControllers.count;
    AdverListViewController *data1 = [self.navigationController.viewControllers objectAtIndex:numberOfViewControllers - 2];
    data1.edited = self.edited;
    [self.navigationController popViewControllerAnimated:YES];
}


-(void) viewWillAppear:(BOOL)animated
{
   
    if (self.data.advertOpening.closingStartDay==0 &&self.data.advertOpening.closingEndDay==0) {
        self.isAlwaysOpen = YES;
    }
    self.image.image = (self.editedImg) ? self.editedImg : self.image.image;
    
    self.companyTypeLabel.text = [NSString stringWithFormat:@"Type: %@",self.data.companyType.name];
    self.discount.text = [NSString stringWithFormat:@"Discount: %d %@",(int)self.data.discount,self.data.discountCurrency.currencyCode];
    self.price.text = [NSString stringWithFormat:@"Price: %d %@",(int)self.data.price,self.data.currency.currencyCode];
    self.descriptionValue.text = [NSString stringWithFormat:@"Offer:  %@",self.data.offer];
    self.location.text = [NSString stringWithFormat:@"Location:  %@ ,%@ %@",self.data.advertAddress.address,self.data.advertAddress.location,self.data.advertAddress.postCode];
    self.additionalLabel.text = [NSString stringWithFormat:@"Additional Info : Custom id:%@ ,Ref :%@,NB: %@, MISC : %@",self.data.customId,self.data.ref,self.data.nb,self.data.misc];
//    self.aboutCompanyLabel.text = [NSString stringWithFormat:@"%@",self.data.advertAddress.aboutCompany];
    self.companyName.text = self.data.companyName;
    
    NSNumberFormatter *fmt = [[NSNumberFormatter alloc] init];
    [fmt setPositiveFormat:@"0.##"];
    
    self.openingtime.text = [NSString stringWithFormat:@"Opening Time:  %@ to %@, %.02f-%.02f",[self dayName:self.data.advertOpening.openingStartDay],[self dayName:self.data.advertOpening.openingEndDay],self.data.advertOpening.openingTime,self.data.advertOpening.closingTime];
    
    
    if([[self dayName:self.data.advertOpening.openingStartDay] isEqualToString:@"Sat"] &&[[self dayName:self.data.advertOpening.openingEndDay] isEqualToString:@"Fri"]){
        self.closingtime.text = @"24/7 Service";
    }else{
        self.closingtime.text = [NSString stringWithFormat:@"Closing Time:  %@ to %@",[self dayName:self.data.advertOpening.closingStartDay],[self dayName:self.data.advertOpening.closingEndDay]];
    }
    
    
    if(!self.editedImg)
    {
      [self.image sd_setImageWithURL:[NSURL URLWithString:[NSMutableString stringWithFormat:@"%@%@",fineurl,self.data.picture]]
                  placeholderImage:nil];
    }
    NSString *text = [NSString stringWithFormat:@"Website: %@ ",
                      self.data.website
                      
                      ];
    
    // If attributed text is supported (iOS6+)
    if ([ self.website respondsToSelector:@selector(setAttributedText:)]) {
        
        // Define general attributes for the entire text
        NSDictionary *attribs = @{
                                  NSForegroundColorAttributeName:  self.website.textColor,
                                  NSFontAttributeName:  self.website.font
                                  };
        NSMutableAttributedString *attributedText =
        [[NSMutableAttributedString alloc] initWithString:text
                                               attributes:attribs];
        
        
        UIColor *purpleColor = [UIColor purpleColor];
        UIFont *boldFont = [UIFont boldSystemFontOfSize: self.website.font.pointSize];
        NSRange purpleBoldTextRange = [text rangeOfString: self.data.website];// * Notice that usage of rangeOfString in this case may cause some bugs - I use it here only for demonstration
        [attributedText setAttributes:@{NSForegroundColorAttributeName:purpleColor,
                                        NSFontAttributeName:boldFont}
                                range:purpleBoldTextRange];
        
        self.website.attributedText = attributedText;
    }else{
        self.website.text = [NSString stringWithFormat:@"Website: %@",self.data.website];
    }
    
    NSString *newtext = [NSString stringWithFormat:@"Phone No.: %@ ",
                         self.data.phoneNumber
                         
                         ];
    
    // If attributed text is supported (iOS6+)
    if ([ self.phoneNumber respondsToSelector:@selector(setAttributedText:)]) {
        
        // Define general attributes for the entire text
        NSDictionary *attribs = @{
                                  NSForegroundColorAttributeName:  self.phoneNumber.textColor,
                                  NSFontAttributeName:  self.phoneNumber.font
                                  };
        NSMutableAttributedString *attributedText =
        [[NSMutableAttributedString alloc] initWithString:newtext
                                               attributes:attribs];
        
        
        UIColor *purpleColor = [UIColor purpleColor];
        UIFont *boldFont = [UIFont boldSystemFontOfSize: self.phoneNumber.font.pointSize];
        NSRange purpleBoldTextRange = [newtext rangeOfString: self.data.phoneNumber];// * Notice that usage of rangeOfString in this case may cause some bugs - I use it here only for demonstration
        [attributedText setAttributes:@{NSForegroundColorAttributeName:purpleColor,
                                        NSFontAttributeName:boldFont}
                                range:purpleBoldTextRange];
        
        self.phoneNumber.attributedText = attributedText;
    }else{
        self.phoneNumber.text = [NSString stringWithFormat:@"Phone Number: %@",self.data.phoneNumber];
    }
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(webLabelTapped)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    [self.website addGestureRecognizer:tapGestureRecognizer];
    self.website.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *teltapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(telLabelTapped)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    [self.phoneNumber addGestureRecognizer:teltapGestureRecognizer];
    self.phoneNumber.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *mapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mapLabelTapped)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    [self.location addGestureRecognizer:mapGestureRecognizer];
    self.location.userInteractionEnabled = YES;
    
}

-(void) webLabelTapped{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.data.website]];
}
-(void)telLabelTapped{
    NSLog(@"tel : %@",self.data.phoneNumber);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",self.data.phoneNumber]]];
}
-(void) mapLabelTapped{
    [self performSegueWithIdentifier:@"showmap" sender:self];
}
-(void)changeState
{
//    self.companyName.hidden = (self.state == 0)? false:true;
//    self.phoneNumber.hidden = (self.state == 0)? false:true;
//    self.price.hidden = (self.state == 0)? false:true;
//    self.discount.hidden = (self.state == 0)? false:true;
//    self.companyTypeLabel.hidden = (self.state == 0)? false:true;
//    self.website.hidden = (self.state == 0)? false:true;
//    self.descriptionValue.hidden = (self.state == 0)? false:true;
//    
//    self.location.hidden = (self.state == 1)? false:true;
//    self.additionalLabel.hidden = (self.state == 1)? false:true;
//    self.aboutCompanyLabel.hidden =  (self.state == 2)? false:true;
//    self.closingtime.hidden = (self.state == 2)? false:true;
//    self.openingtime.hidden = (self.state == 2)? false:true;
    if(self.state == 0){
        self.basicViewContainer.hidden = false;
        self.addressViewContainer.hidden = true;
        self.onlineViewContainer.hidden = true;
    }
    else if(self.state == 1){
        self.basicViewContainer.hidden = true;
        self.addressViewContainer.hidden = false;
        self.onlineViewContainer.hidden = true;
    }else if(self.state == 2){
        self.basicViewContainer.hidden = true;
        self.addressViewContainer.hidden = true;
        self.onlineViewContainer.hidden = false;
    }
    [self.basic setTitleColor:(self.state == 0)?[UIColor blueColor]:[UIColor blackColor] forState:UIControlStateNormal];
    [self.address setTitleColor:(self.state == 1)?[UIColor blueColor]:[UIColor blackColor] forState:UIControlStateNormal];
    [self.others setTitleColor:(self.state == 2)?[UIColor blueColor]:[UIColor blackColor] forState:UIControlStateNormal];
    
}
-(void)viewDidLayoutSubviews
{
    // The scrollview needs to know the content size for it to work correctly
    self.scrollView.contentSize = CGSizeMake(
                                             self.scrollView.contentSize.width,
                                             self.scrollView.contentSize.height + 300
                                             );
}

- (IBAction)basic:(id)sender {
    
    self.state = 0;
    [self changeState];
    
}

- (IBAction)address:(id)sender {
    
    self.state = 1;
    [self changeState];
    
}

- (IBAction)others:(id)sender {
    
    self.state = 2;
    [self changeState];
}


- (IBAction)edit:(id)sender {
    NSLog(@"state %d",self.state);
    
    if (self.state ==0) {
        [self performSegueWithIdentifier:@"editBasic" sender:self];

    }
    
    if (self.state ==1) {
        [self performSegueWithIdentifier:@"editAddress" sender:self];
        
    }
    
    if (self.state ==2) {
        [self performSegueWithIdentifier:@"editOther" sender:self];
        
    }
    
    
    
}


- (IBAction)sayHello:(id)sender {
    
    NSDictionary *inventory = @{
                                @"to" :self.data.creator.email,
                            };
    
    [JSONHTTPClient postJSONFromURLWithString:[NSString stringWithFormat:@"%@api/advertmail/sayhi",baseurl] params:inventory
                                   completion:^(NSDictionary *json, JSONModelError *err) {
                                       
                                       NSError* error = nil;
                                       self.response = [[Response alloc] initWithDictionary:json error:&error];
                                       NSLog(@"json :%@",self.response);
                                       NSLog(@"%@",error);
                                       
                                       if(error)
                                       {
                                           [ToastView showToastInParentView:self.view withText:@"Server Unreachable" withDuaration:2.0];
                                       }
                                       else
                                       {
                                           [ToastView showToastInParentView:self.view withText:self.response.responseStat.msg withDuaration:2.0];
                                       }
                                       
                                       
        
                                       
                                   }];

    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)editImageAction:(id)sender {
    [self performSegueWithIdentifier:@"editImage" sender:nil];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"editBasic"])
    {
        PostAdvertOneViewController *data= segue.destinationViewController;
        data.id = [NSString stringWithFormat:@"%d",self.data.id];
        data.discountCurrency = self.data.discountCurrency;
        data.currency=self.data.currency;
        data.companyType=self.data.companyType;
        data.companyName=self.data.companyName;
        data.phoneNumber=self.data.phoneNumber;
        data.website=self.data.website;
        data.image = self.image.image;
        data.discount = [NSString stringWithFormat:@"%f",self.data.discount];
        data.price= [NSString stringWithFormat:@"%f",self.data.price];
        data.descriptn=self.data.offer;
        data.city=self.data.advertAddress.location;
        data.postcode=self.data.advertAddress.postCode;
        data.address=self.data.advertAddress.address;
        data.customId = self.data.customId;
        data.ref = self.data.ref;
        data.info = self.data.nb;
        data.misc = self.data.misc;
        data.openingDayFisrt=[NSString stringWithFormat:@"%d",self.data.advertOpening.openingStartDay];
        data.openingDayLast=[NSString stringWithFormat:@"%d",self.data.advertOpening.openingEndDay];
        data.openTime= [NSString stringWithFormat:@"%f",self.data.advertOpening.openingTime];
        data.closeTime=[NSString stringWithFormat:@"%f",self.data.advertOpening.closingTime];
        data.closingDayFirstStr= [NSString stringWithFormat:@"%d",self.data.advertOpening.closingStartDay];
        data.closingDayLastStr=[NSString stringWithFormat:@"%d",self.data.advertOpening.closingEndDay];
        data.always_open = self.data.alwaysOpen;
        data.limitationStr=self.data.limitation;
        data.country = [NSString stringWithFormat:@"%d",self.data.advertAddress.country.id];
        data.advertData = self.data;
        data.edit=true;
       
    }
    
    if ([segue.identifier isEqualToString:@"editAddress"])
    {
        PostAdvertTwoViewController *data= segue.destinationViewController;
        data.id = [NSString stringWithFormat:@"%d",self.data.id];
        data.discountCurrency = self.data.discountCurrency;
        data.currency=self.data.currency;
        data.companyType=self.data.companyType;
        data.companyName=self.data.companyName;
        data.phoneNumber=self.data.phoneNumber;
        data.website=self.data.website;
        data.discount = [NSString stringWithFormat:@"%f",self.data.discount];
        data.price= [NSString stringWithFormat:@"%f",self.data.price];
        data.descriptn=self.data.offer;
        data.city=self.data.advertAddress.location;
        data.postcode=self.data.advertAddress.postCode;
        data.address=self.data.advertAddress.address;
        data.custom = self.data.customId;
        data.ref = self.data.ref;
        data.info = self.data.nb;
        data.misc = self.data.misc;
        data.aboutCompany = self.data.aboutCompany;
        data.openingDayFisrt=[NSString stringWithFormat:@"%d",self.data.advertOpening.openingStartDay];
        data.openingDayLast=[NSString stringWithFormat:@"%d",self.data.advertOpening.openingEndDay];
        data.openTime= [NSString stringWithFormat:@"%f",self.data.advertOpening.openingTime];
        data.closeTime=[NSString stringWithFormat:@"%f",self.data.advertOpening.closingTime];
        data.closingDayFirstStr= [NSString stringWithFormat:@"%d",self.data.advertOpening.closingStartDay];
        data.closingDayLastStr=[NSString stringWithFormat:@"%d",self.data.advertOpening.closingEndDay];
      //  data.always_open = self.data.advertOpening.alwaysOn;
        data.limitationStr=self.data.limitation;
        data.image = self.image.image;
        data.advertData = self.data;
        data.edit=true;
    }
    
    if ([segue.identifier isEqualToString:@"editOther"])
    {
        PostAdvertThreeViewController *data= segue.destinationViewController;
        data.id = [NSString stringWithFormat:@"%d",self.data.id];
        data.discountCurrency = self.data.discountCurrency;
        data.currency=self.data.currency;
        data.companyType=self.data.companyType;
        data.companyName=self.data.companyName;
        data.website=self.data.website;
        data.phoneNumber=self.data.phoneNumber;
        data.discount = [NSString stringWithFormat:@"%f",self.data.discount];
        data.price= [NSString stringWithFormat:@"%f",self.data.price];
        data.descriptn=self.data.offer;
        data.city=self.data.advertAddress.location;
        data.postcode=self.data.advertAddress.postCode;
        data.address=self.data.advertAddress.address;
        data.customId = self.data.customId;
        data.ref = self.data.ref;
        data.info = self.data.nb;
        data.misc = self.data.misc;
        data.openingDayFisrt=[NSString stringWithFormat:@"%d",self.data.advertOpening.openingStartDay];
        data.openingDayLast=[NSString stringWithFormat:@"%d",self.data.advertOpening.openingEndDay];
        data.openTime= [NSString stringWithFormat:@"%f",self.data.advertOpening.openingTime];
        data.closeTime=[NSString stringWithFormat:@"%f",self.data.advertOpening.closingTime];
        data.closingDayFirstStr= [NSString stringWithFormat:@"%d",self.data.advertOpening.closingStartDay];
        data.closingDayLastStr=[NSString stringWithFormat:@"%d",self.data.advertOpening.closingEndDay];
        data.always_open = self.isAlwaysOpen;
        data.limitationStr=self.data.limitation;
        data.image = self.image.image;
        data.onlineStoreAddress = self.data.onlineStoreAddress;
        data.sales = self.data.salesLine;
        data.enquiry = self.data.enquiries;
        data.advertData = self.data;
        data.edit=true;
    }
    if([segue.identifier isEqualToString:@"showmap"]){
        MapViewController *controller = segue.destinationViewController;
        controller.comapnyName = self.data.companyName;
        controller.address =  [NSString stringWithFormat:@"Location:  %@ ,%@ %@",self.data.advertAddress.address,self.data.advertAddress.location,self.data.advertAddress.postCode];
    }
    if ([segue.identifier isEqualToString:@"showFullImage"]) {
        SingleImageViewController *controller = segue.destinationViewController;
        controller.imagePath = [self.data.otherImages[self.selectedImage] objectForKey:@"image_path"];
    }
    if([segue.identifier isEqualToString:@"editImage"]){
        AdvertImagesViewController *controller = segue.destinationViewController;
        controller.editable = true;
        controller.bannerImagePath = [NSMutableString stringWithFormat:@"%@%@",fineurl,self.data.picture];
        controller.otherImagePaths = self.data.otherImages;
    }
    if([segue.identifier isEqualToString:@"business"]){
        BusinessViewController *controller = segue.destinationViewController;
        controller.advert = self.data;
    }
    if([segue.identifier isEqualToString:@"address"]){
        AdvertAddessViewController *controller = segue.destinationViewController;
        controller.advert = self.data;
    }
    if([segue.identifier isEqualToString:@"online"]){
        OnlineViewController *controller = segue.destinationViewController;
        controller.advert = self.data;
    }
}
#pragma mark - CollectionView
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:      (NSInteger)section
{
   
    return [self.data.otherImages count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    UIImageView *dot =[[UIImageView alloc] initWithFrame:CGRectMake(0,0,CGRectGetWidth(collectionView.frame)/2.25,CGRectGetWidth(collectionView.frame)/2.25)];
   // dot.image = [UIImage imageNamed:@"main-screen"];
    NSLog(@"%@",[self.data.otherImages[indexPath.row] objectForKey:@"image_path"]);
    NSLog(@"http://advertising.cabguardpro.com/images/%@",[self.data.otherImages[indexPath.row] objectForKey:@"image_path"]);
    [dot sd_setImageWithURL:[NSURL URLWithString:[NSMutableString stringWithFormat:@"%@images/%@",baseurl,[self.data.otherImages[indexPath.row] objectForKey:@"image_path"]]]
                  placeholderImage:nil];
    [cell.contentView addSubview:dot];
    
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Called");
    return CGSizeMake(CGRectGetWidth(collectionView.frame)/2.25, CGRectGetWidth(collectionView.frame)/2.25);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    self.selectedImage = indexPath.row;
    [self performSegueWithIdentifier:@"showFullImage" sender:self];
}

@end
