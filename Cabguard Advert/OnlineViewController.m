//
//  OnlineViewController.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 10/30/17.
//  Copyright © 2017 Workspace Infotech. All rights reserved.
//

#import "OnlineViewController.h"

@interface OnlineViewController ()

@end

@implementation OnlineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.aboutComapnyLabel.text = self.advert.aboutCompany?[NSString stringWithFormat:@"%@",self.advert.aboutCompany]:@"";
    self.aboutComapnyLabel.numberOfLines = 0;
    [self.aboutComapnyLabel sizeToFit];
    
    self.openingtimeLabel.numberOfLines = 0;
    [self.openingtimeLabel sizeToFit];
    self.closingTimeLabel.numberOfLines = 0;
    [self.closingTimeLabel sizeToFit];
    NSString *open =@"";
    NSString *close = @"";
    
    
    NSString  *onlineText = self.advert.onlineStoreAddress?[NSString stringWithFormat:@"On-Store: %@",self.advert.onlineStoreAddress]:@"";
    NSString *salesText = self.advert.salesLine?[NSString stringWithFormat:@"Sales: %@",self.advert.salesLine]:@"";
    NSString *enquiryText = self.advert.enquiries?[NSString stringWithFormat:@"Enquiries: %@",self.advert.enquiries]:@"";
    // If attributed text is supported (iOS6+)
    if ( [ self.onStoreLabel respondsToSelector:@selector(setAttributedText:)] && ![onlineText isEqualToString:@""]) {
        
        // Define general attributes for the entire text
        NSDictionary *attribs = @{
                                  NSForegroundColorAttributeName:  self.onStoreLabel.textColor,
                                  NSFontAttributeName:  self.onStoreLabel.font
                                  };
        NSMutableAttributedString *attributedText =
        [[NSMutableAttributedString alloc] initWithString:onlineText
                                               attributes:attribs];
        
        
        UIColor *blueColor = [UIColor blueColor];
        UIFont *boldFont = [UIFont boldSystemFontOfSize: self.onStoreLabel.font.pointSize];
        NSRange purpleBoldTextRange = [onlineText rangeOfString: self.advert.onlineStoreAddress];
        NSRange normalTxtRange = [onlineText rangeOfString: @"On-Store:"];
        [attributedText setAttributes:@{NSForegroundColorAttributeName:blueColor,
                                        NSFontAttributeName:boldFont}
                                range:purpleBoldTextRange];
        [attributedText setAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor] ,
                                        NSFontAttributeName:boldFont}
                                range:normalTxtRange];
        
        self.onStoreLabel.attributedText = attributedText;
    }else{
        self.onStoreLabel.text = onlineText;
    }
    
    
    if ( [ self.salesLabel respondsToSelector:@selector(setAttributedText:)] && ![salesText isEqualToString:@""]) {
        
        // Define general attributes for the entire text
        NSDictionary *attribs = @{
                                  NSForegroundColorAttributeName:  self.salesLabel.textColor,
                                  NSFontAttributeName:  self.salesLabel.font
                                  };
        NSMutableAttributedString *attributedText =
        [[NSMutableAttributedString alloc] initWithString:salesText
                                               attributes:attribs];
        
        
        UIColor *purpleColor = [UIColor purpleColor];
        UIFont *boldFont = [UIFont boldSystemFontOfSize: self.salesLabel.font.pointSize];
        NSRange purpleBoldTextRange = [salesText rangeOfString: self.advert.salesLine];
        [attributedText setAttributes:@{NSForegroundColorAttributeName:purpleColor,
                                        NSFontAttributeName:boldFont}
                                range:purpleBoldTextRange];
        
        self.salesLabel.attributedText = attributedText;
    }else{
        self.salesLabel.text = salesText;
    }
    
    if ( [ self.enquiriesLabel respondsToSelector:@selector(setAttributedText:)] && ![enquiryText isEqualToString:@""]) {
        
        // Define general attributes for the entire text
        NSDictionary *attribs = @{
                                  NSForegroundColorAttributeName:  self.enquiriesLabel.textColor,
                                  NSFontAttributeName:  self.enquiriesLabel.font
                                  };
        NSMutableAttributedString *attributedText =
        [[NSMutableAttributedString alloc] initWithString:enquiryText
                                               attributes:attribs];
        
        
        UIColor *blueColor = [UIColor blueColor];
        UIFont *boldFont = [UIFont boldSystemFontOfSize: self.enquiriesLabel.font.pointSize];
        NSRange purpleBoldTextRange = [enquiryText rangeOfString: self.advert.enquiries];
        [attributedText setAttributes:@{NSForegroundColorAttributeName:blueColor,
                                        NSFontAttributeName:boldFont}
                                range:purpleBoldTextRange];
        
        self.enquiriesLabel.attributedText = attributedText;
    }else{
        self.enquiriesLabel.text = onlineText;
    }
    
    
    
    
    for(int i= 0;i< self.advert.advertOpenings.count;i++){
        NSLog(@"Open :%@",[self.advert.advertOpenings[i] objectForKey:@"open"]);
        if([[self.advert.advertOpenings[i] objectForKey:@"open"] boolValue] == YES ){
            open = [NSString stringWithFormat:@"%@ \n %@ [%@-%@]",open,[[self.advert.advertOpenings[i] objectForKey:@"day"]capitalizedString],[self.advert.advertOpenings[i] objectForKey:@"openingTime"],
                    [self.advert.advertOpenings[i] objectForKey:@"closingTime"]];
        }else{
            close = [NSString stringWithFormat:@"%@ %@",close,[self.advert.advertOpenings[i] objectForKey:@"day"]];
        }
    }
    self.openingtimeLabel.text = [NSString stringWithFormat:@"Opening Days\n,%@",open];
    self.closingTimeLabel.text = [NSString stringWithFormat:@"Closed Days\n%@",close];
    
    if(self.advert.onlineStoreAddress){
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(webLabelTapped)];
        tapGestureRecognizer.numberOfTapsRequired = 1;
        [self.onStoreLabel addGestureRecognizer:tapGestureRecognizer];
        self.onStoreLabel.userInteractionEnabled = YES;
    }
    
    if(self.advert.salesLine){
        UITapGestureRecognizer *teltapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(telLabelTapped)];
        teltapGestureRecognizer.numberOfTapsRequired = 1;
        [self.salesLabel addGestureRecognizer:teltapGestureRecognizer];
        self.salesLabel.userInteractionEnabled = YES;
    }
    
}

-(void) webLabelTapped{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.advert.onlineStoreAddress]];
}
-(void)telLabelTapped{
    NSLog(@"tel : %@",self.advert.phoneNumber);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",self.advert.salesLine]]];
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
