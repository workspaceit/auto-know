//
//  BusinessViewController.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 10/30/17.
//  Copyright © 2017 Workspace Infotech. All rights reserved.
//

#import "BusinessViewController.h"

@interface BusinessViewController ()

@end

@implementation BusinessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.companyNameLabel.text = (self.advert.companyName)?self.advert.companyName:@"";
//    self.companyTypeLabel.text = [NSString stringWithFormat:@"Type : %@",self.advert.companyType.name];
//    self.websiteLabel.text = [NSString stringWithFormat:@"Website : %@",self.advert.website];
//    self.phoneNoLabel.text = [NSString stringWithFormat:@"Phone : %@",self.advert.phoneNumber];
    self.priceLabel.text = [NSString stringWithFormat:@"Price : %f %@ ",self.advert.price, self.advert.currency.currencyCode];
    NSNumberFormatter *doubleValueWithMaxTwoDecimalPlaces = [[NSNumberFormatter alloc] init];
    [doubleValueWithMaxTwoDecimalPlaces setNumberStyle:NSNumberFormatterDecimalStyle];
    [doubleValueWithMaxTwoDecimalPlaces setMaximumFractionDigits:2];
    NSNumber *newPrice = [NSNumber numberWithDouble:self.advert.price];
    NSNumber *newDiscount = [NSNumber numberWithDouble:self.advert.discount];
    
    
    
    self.priceLabel.text = [NSString stringWithFormat:@"Price : %@ %@ ",[doubleValueWithMaxTwoDecimalPlaces stringFromNumber:newPrice] , self.advert.currency.currencyCode];
    self.discountLabel.text = [NSString stringWithFormat:@"Discount : %@ %@",[doubleValueWithMaxTwoDecimalPlaces stringFromNumber:newDiscount] ,self.advert.discountCurrency.currencyCode];

    CGRect frame = self.offerText.frame;
    frame.size.height = self.offerText.contentSize.height;
    self.offerText.frame = frame;
    
    // If attributed text is supported (iOS6+)
    if ([ self.websiteLabel respondsToSelector:@selector(setAttributedText:)]) {
        NSString  *text = [NSString stringWithFormat:@"Website : %@",self.advert.website];
        // Define general attributes for the entire text
        NSDictionary *attribs = @{
                                  NSForegroundColorAttributeName:  self.websiteLabel.textColor,
                                  NSFontAttributeName:  self.websiteLabel.font
                                  };
        NSMutableAttributedString *attributedText =
        [[NSMutableAttributedString alloc] initWithString:text
                                               attributes:attribs];
        
        
        UIColor *purpleColor = [UIColor purpleColor];
        UIFont *boldFont = [UIFont boldSystemFontOfSize: self.websiteLabel.font.pointSize];
        NSRange purpleBoldTextRange = [text rangeOfString: self.advert.website];// * Notice that usage of rangeOfString in this case may cause some bugs - I use it here only for demonstration
        [attributedText setAttributes:@{NSForegroundColorAttributeName:purpleColor,
                                        NSFontAttributeName:boldFont}
                                range:purpleBoldTextRange];
        
        self.websiteLabel.attributedText = attributedText;
    }else{
        self.websiteLabel.text = [NSString stringWithFormat:@"Website : %@",self.advert.website];
    }
    
    
    if ([ self.phoneNoLabel respondsToSelector:@selector(setAttributedText:)]) {
        NSString  *text = [NSString stringWithFormat:@"Phone : %@",self.advert.phoneNumber];
        // Define general attributes for the entire text
        NSDictionary *attribs = @{
                                  NSForegroundColorAttributeName:  self.phoneNoLabel.textColor,
                                  NSFontAttributeName:  self.phoneNoLabel.font
                                  };
        NSMutableAttributedString *attributedText =
        [[NSMutableAttributedString alloc] initWithString:text
                                               attributes:attribs];
        
        
        UIColor *purpleColor = [UIColor purpleColor];
        UIFont *boldFont = [UIFont boldSystemFontOfSize: self.phoneNoLabel.font.pointSize];
        NSRange purpleBoldTextRange = [text rangeOfString: self.advert.phoneNumber];// * Notice that usage of rangeOfString in this case may cause some bugs - I use it here only for demonstration
        [attributedText setAttributes:@{NSForegroundColorAttributeName:purpleColor,
                                        NSFontAttributeName:boldFont}
                                range:purpleBoldTextRange];
        
        self.phoneNoLabel.attributedText = attributedText;
    }else{
        self.phoneNoLabel.text = [NSString stringWithFormat:@"Phone : %@",self.advert.phoneNumber];
    }
    
    
    
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(webLabelTapped)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    [self.websiteLabel addGestureRecognizer:tapGestureRecognizer];
    self.websiteLabel.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *teltapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(telLabelTapped)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    [self.phoneNoLabel addGestureRecognizer:teltapGestureRecognizer];
    self.phoneNoLabel.userInteractionEnabled = YES;
}

-(void) webLabelTapped{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.advert.website]];
}
-(void)telLabelTapped{
    NSLog(@"tel : %@",self.advert.phoneNumber);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",self.advert.phoneNumber]]];
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
