//
//  AdvertAddessViewController.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 10/30/17.
//  Copyright © 2017 Workspace Infotech. All rights reserved.
//

#import "AdvertAddessViewController.h"
#import "MapViewController.h"
@interface AdvertAddessViewController ()

@end

@implementation AdvertAddessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *text =  [NSString stringWithFormat:@"Location:  %@ ,%@,%@ ,%@",self.advert.advertAddress.address?self.advert.advertAddress.address:@"",self.advert.advertAddress.location?self.advert.advertAddress.location:@"",self.advert.advertAddress.country?self.advert.advertAddress.country.nickName:@"",self.advert.advertAddress.postCode?self.advert.advertAddress.postCode:@""];
   
    
    if ([ self.addressLabel respondsToSelector:@selector(setAttributedText:)]) {
        
        // Define general attributes for the entire text
        NSDictionary *attribs = @{
                                  NSForegroundColorAttributeName:  self.addressLabel.textColor,
                                  NSFontAttributeName:  self.addressLabel.font
                                  };
        NSMutableAttributedString *attributedText =
        [[NSMutableAttributedString alloc] initWithString:text
                                               attributes:attribs];
        
        
        UIColor *blueColor = [UIColor blueColor];
        UIFont *boldFont = [UIFont boldSystemFontOfSize: self.addressLabel.font.pointSize];
        NSRange purpleBoldTextRange = [text rangeOfString: text];// * Notice that usage of rangeOfString in this case may cause some bugs - I use it here only for demonstration
        [attributedText setAttributes:@{NSForegroundColorAttributeName:blueColor,
                                        NSFontAttributeName:boldFont}
                                range:purpleBoldTextRange];
        
        self.addressLabel.attributedText = attributedText;
    }else{
        self.addressLabel.text = [NSString stringWithFormat:@"%@",text];
    }
    self.addressLabel.adjustsFontSizeToFitWidth = YES;
    self.addressLabel.minimumFontSize      =  0.5;
    self.addressLabel.numberOfLines = 0;
    [self.addressLabel sizeToFit];
    
    
    
    
    
    self.additionalInfoLabel.text = [NSString stringWithFormat:@"Additional Info : Custom id:%@ ,Ref :%@,NB: %@, MISC : %@",self.advert.customId?self.advert.customId:@"",self.advert.ref?self.advert.ref:@"",self.advert.nb?self.advert.nb:@"",self.advert.misc?self.advert.misc:@""];
    self.specialInfoLabel.text = [NSString stringWithFormat:@"%@",self.advert.limitation];
    self.specialInfoLabel.numberOfLines = 0 ;
    [self.specialInfoLabel sizeToFit];
    UITapGestureRecognizer *mapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mapLabelTapped)];
    mapGestureRecognizer.numberOfTapsRequired = 1;
    [self.addressLabel addGestureRecognizer:mapGestureRecognizer];
    self.addressLabel.userInteractionEnabled = YES;
    
    
    
    
    
}
-(void) mapLabelTapped{
    [self performSegueWithIdentifier:@"showmap" sender:self];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"showmap"]){
        MapViewController *controller = segue.destinationViewController;
        controller.comapnyName = self.advert.companyName;
        controller.address =  [NSString stringWithFormat:@"Location:  %@ ,%@ %@",self.advert.advertAddress.address,self.advert.advertAddress.location,self.advert.advertAddress.postCode];
        controller.lat = self.advert.advertAddress.lat ? [ self.advert.advertAddress.lat doubleValue] : 0.0;
        controller.lng = self.advert.advertAddress.lng ? [ self.advert.advertAddress.lng doubleValue] : 0.0;
    }
}

@end
