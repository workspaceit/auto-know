//
//  AdverListViewController.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/7/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "AdverListViewController.h"
#import "JSONHTTPClient.h"
#import "JSONModelLib.h"
#import "ToastView.h"
#import "AdvertTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "SelectionViewController.h"
#import "AdvertDetailsViewController.h"

@interface AdverListViewController ()

@end

@implementation AdverListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSLog(@"%@",self.data);
    defaults = [NSUserDefaults standardUserDefaults];
    baseurl = [defaults objectForKey:@"baseurl"];
    fineurl = [defaults objectForKey:@"fineurl"];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];

    self.myObject = [[NSMutableArray alloc] init];
    
    self.offset = 0;
    self.loaded = false;
    [self getDataWithOffset:self.offset type:@"" city:@"" postcode:@"" country:@""];
    
    self.search = false;
    self.searchHeight.constant = 1;
    self.tableDistance.constant = 1;
    self.searchView.hidden = true;
    
    self.companyTypeView.layer.cornerRadius = 10.0;
    [self.companyTypeView.layer setMasksToBounds:YES];
    
    self.companyTypeView.frame = CGRectInset(self.companyTypeView.frame, -0.5f, -0.5f);
    self.companyTypeView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.companyTypeView.layer.borderWidth = 0.5f;
    
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
    
    self.companyTypeCloseBtn.layer.cornerRadius = 13;
    [self.companyTypeCloseBtn.layer setMasksToBounds:YES];
    
    self.companyTypeCloseBtn.frame = CGRectInset(self.companyTypeCloseBtn.frame, -0.5f, -0.5f);
    self.companyTypeCloseBtn.layer.borderColor = [UIColor blackColor].CGColor;
    self.companyTypeCloseBtn.layer.borderWidth = 0.5f;
    
    self.countryView.layer.cornerRadius = 10.0;
    [self.countryView.layer setMasksToBounds:YES];
    
    self.countryView.frame = CGRectInset(self.cityView.frame, -0.5f, -0.5f);
    self.countryView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.countryView.layer.borderWidth = 0.5f;
    
    
    self.searchBtn.layer.cornerRadius = 10.0;
    [self.searchBtn.layer setMasksToBounds:YES];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFrom:)];
    self.countyLbl.userInteractionEnabled = YES;
    [self.countyLbl addGestureRecognizer:tapGestureRecognizer];
    
}

- (IBAction)typeClear:(id)sender {
    
    self.companyType = nil;
    self.companyTypeLabel.text = @"Select company type";
    self.companyTypeCloseBtn.hidden = true;
}

- (IBAction)searchShowHide:(id)sender {
    
    self.search = !self.search;
    self.searchHeight.constant = (self.search)? 160 : 1;
    self.tableDistance.constant = (self.search)? 160 : 1;
    self.searchView.hidden = !self.search;
    
}


- (IBAction)search:(id)sender {
    
    [self.view endEditing:YES];
    NSLog(@"search clicked");
    
    self.myObject = nil;
    self.myObject = [[NSMutableArray alloc] init];
    self.offset = 0;
    self.loaded = false;
    NSString *companyType = (self.companyType) ? [NSString stringWithFormat:@"%d",self.companyType.id] : @"";
    NSLog(@"companyType %@",companyType);
    [self getDataWithOffset:self.offset type:companyType city:self.cityText.text postcode:self.postcodeText.text country:[NSString stringWithFormat:@"%d",self.country.id]];
    [self.tableData reloadData];
    
}
-(void) handleTapFrom : (UITapGestureRecognizer *)recognizer{
    [self performSegueWithIdentifier:@"country" sender:recognizer];
}
-(void) viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    
    if (self.edited) {
        
        self.myObject = nil;
        self.myObject = [[NSMutableArray alloc] init];
        self.offset = 0;
        self.loaded = false;
        NSString *companyType = (self.companyType) ? [NSString stringWithFormat:@"%d",self.companyType.id] : @"";
        NSString *countryid = (self.country) ? [NSString stringWithFormat:@"%d",self.country.id] : @"";
        [self getDataWithOffset:self.offset type:companyType city:self.cityText.text postcode:self.postcodeText.text country:countryid];
        [self.tableData reloadData];
        
    }
    
    self.companyTypeLabel.text = (self.companyType)?self.companyType.name:@"Select company type";
    self.companyTypeCloseBtn.hidden = (self.companyType)?false:true;
    self.countyLbl.text = (self.country)?self.country.nickName:@"Select Country";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - table methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.myObject.count;
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AdvertTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    Advert *data = self.myObject[indexPath.row];
    NSLog(@"%@",self.myObject);
    cell.discount.text = [NSString stringWithFormat:@"%d%%",(int)data.discount];
    cell.price.text = [NSString stringWithFormat:@"%d %@",(int)data.price,data.currency.currencyCode];
    cell.descriptionValue.text = data.offer;
    cell.location.text = [NSString stringWithFormat:@"%@ ,%@ %@",data.advertAddress.address,data.advertAddress.location,data.advertAddress.postCode];
    cell.companyName.text = data.companyName;
    
    NSNumberFormatter *fmt = [[NSNumberFormatter alloc] init];
    [fmt setPositiveFormat:@"0.##"];
    
    //cell.openingtime.text = [NSString stringWithFormat:@"%@ to %@, %@-%@",[self dayName:data.advertOpening.openingStartDay],[self dayName:data.advertOpening.openingEndDay],[fmt stringFromNumber:[NSNumber numberWithFloat:data.advertOpening.openingTime]],[fmt stringFromNumber:[NSNumber numberWithFloat:data.advertOpening.closingTime]]];
    NSMutableArray *Opendata = [[NSMutableArray alloc]init];
    
    for(int i= 0;i< data.advertOpenings.count;i++){
        
        if([[data.advertOpenings[i] objectForKey:@"open"] boolValue] == YES ){
            [Opendata addObject: [data.advertOpenings[i] objectForKey:@"day"]];
            
        }
    }
    if(data.alwaysOpen){
        cell.openingtime.text = @"24/7 Service";
    }else{
        cell.openingtime.text = [NSString stringWithFormat:@"%@- %@",[Opendata[0] capitalizedString],[Opendata[Opendata.count-1] capitalizedString]];
    }
    
    
    [cell.image sd_setImageWithURL:[NSURL URLWithString:[NSMutableString stringWithFormat:@"%@%@",fineurl,data.picture]]
                  placeholderImage:nil];
    
    return cell;
    
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

-(void) getDataWithOffset:(int) offset type:(NSString*) type city:(NSString*) city postcode:(NSString*) postcode country:(NSString*) countryid {
    
    
    NSLog(@" url %@",[NSString stringWithFormat:@"%@api/advertpost/recent?offset=%d&company_type=%@&city=%@&postcode=%@&company_country=%@",baseurl,offset,type,city,postcode,countryid]);
    
    self.data = [[AdvertResponse alloc] initFromURLWithString:[NSString stringWithFormat:@"%@api/advertpost/recent?offset=%d&company_type=%@&city=%@&postcode=%@&company_country=%@",baseurl,offset,type,city,postcode,countryid]
                                                        completion:^(JSONModel *model, JSONModelError *err) {
                                                            
                                                            NSLog(@"%@",err);
                                                            NSLog(@"from here");
                                                            NSLog(@"%@",model);
                                                            if(self.data.responseStat.status){
                                                                NSLog(@"%@",self.data.responseStat);
                                                                
                                                                for(int i=0;i<self.data.responseData.count;i++)
                                                                {
                                                                    [self.myObject addObject:self.data.responseData[i]];
                                                                }
                                                                
                                                                [self.tableData reloadData];
                                                                
                                                                
                                                                self.isData = true;
                                                                self.loaded = true;
                                                                self.offset++;
                                                                
                                                            }
                                                            else
                                                            {
                                                                self.isData = false;
                                                                self.loaded = false;
                                                            }
                                                            
                                                            
                                                            
                                                        }];
    
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.bounds;
    CGSize size = scrollView.contentSize;
    UIEdgeInsets inset = scrollView.contentInset;
    float y = offset.y + bounds.size.height - inset.bottom;
    float h = size.height;
    float reload_distance = 10;
    if(y > h + reload_distance) {
        
        
        if(self.isData && self.loaded)
        {
            
            self.loaded = false;
            
            NSString *companyType = (self.companyType) ? [NSString stringWithFormat:@"%d",self.companyType.id] : @"";
            NSString *countryid = (self.country) ? [NSString stringWithFormat:@"%d",self.country.id] : @"";
            [self getDataWithOffset:self.offset type:companyType city:self.cityText.text postcode:self.postcodeText.text country:countryid];
           
            
            
            NSLog(@"load more rows");
        }
        
        
    }
    
}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"companyType"])
    {
        SelectionViewController *data= segue.destinationViewController;
        data.type = 3;
        
    }
    if ([segue.identifier isEqualToString:@"country"])
    {
        SelectionViewController *data= segue.destinationViewController;
        data.type = 5;
        
    }
    
    
    if ([segue.identifier isEqualToString:@"showDetails"])
    {
        NSIndexPath *indexPath = [self.tableData indexPathForSelectedRow];
        AdvertDetailsViewController *data= segue.destinationViewController;
        data.data = self.myObject[indexPath.row];
        
        
    }
    
   

}


@end
