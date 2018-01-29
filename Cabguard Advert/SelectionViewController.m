//
//  SelectionViewController.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/10/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "SelectionViewController.h"
#import "PostAdvertOneViewController.h"
#import "JSONHTTPClient.h"
#import "JSONModelLib.h"
#import "AdverListViewController.h"
#import "Country.h"
#import "PostAdvertTwoViewController.h"
@interface SelectionViewController ()

@end

@implementation SelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    defaults = [NSUserDefaults standardUserDefaults];
    baseurl = [defaults objectForKey:@"baseurl"];
    
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    if (self.type == 0 || self.type == 3)
    {
        self.title = @"Select Type";
        [self setCompanyTypeData];
    }
    else if(self.type == 1)
    {
        self.title = @"Select Currency";
        [self setDiscountCurrencyData];
    }
    else if(self.type ==4 || self.type == 5){
        self.title = @"Select Country";
        [self setCountryData];
    }
    else
    {
        self.title = @"Select Currency";
        [self setPriceCurrencyData];
    }
   
    
}

#pragma mark - table methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.type == 0 || self.type == 3)
    {
      return self.typeData.responseData.count;
    }
    else if(self.type == 4 || self.type == 5){
        return self.countryData.responseData.count;
    }
    else
    {
      return self.currencyData.responseData.count;
    }
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    if (self.type == 0 || self.type == 3) {
        
        CompanyType *data = self.typeData.responseData[indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@",data.name];
        
    }else if(self.type == 4 || self.type == 5){
        Country *data = self.countryData.responseData[indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@",data.nickName];
    }
    else
    {
        Currency *data = self.currencyData.responseData[indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%@",data.currencyCode];
    }
    
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSInteger numberOfViewControllers = self.navigationController.viewControllers.count;
    
    if (self.type == 3)
    {
         AdverListViewController *data1 = [self.navigationController.viewControllers objectAtIndex:numberOfViewControllers - 2];
         CompanyType *data = self.typeData.responseData[indexPath.row];
         data1.companyType = data;
    }
    else if(self.type == 4 || self.type == 5 ){
          PostAdvertTwoViewController *data2 = [self.navigationController.viewControllers objectAtIndex:numberOfViewControllers - 2];
          data2.country = self.countryData.responseData[indexPath.row];
    }
   
    else
    {
        PostAdvertOneViewController *data1 = [self.navigationController.viewControllers objectAtIndex:numberOfViewControllers - 2];
        
        
        if (self.type == 0)
        {
            CompanyType *data = self.typeData.responseData[indexPath.row];
            data1.companyType = data;
        }
        else if(self.type == 1)
        {
            Currency *data = self.currencyData.responseData[indexPath.row];
            data1.discountCurrency = data;
        }
        else
        {
            Currency *data = self.currencyData.responseData[indexPath.row];
            data1.currency = data;
        }
        
        
        data1.typeChange = YES;
    }
  
    
   
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void) setDiscountCurrencyData{
    
    
    self.currencyData = [[CurrencyResponse alloc] initFromURLWithString:[NSString stringWithFormat:@"%@api/discount/currency/all",baseurl]
                                                             completion:^(JSONModel *model, JSONModelError *err) {
                                                                 
                                                                 
                                                                 if(self.currencyData.responseStat.status){
                                                    
                                                                     [self.tableData reloadData];
                                                                     
                                                                 }
                                                                 
                                                                 
                                                                 
                                                             }];
    
    
}

-(void) setPriceCurrencyData{
    
    
    self.currencyData = [[CurrencyResponse alloc] initFromURLWithString:[NSString stringWithFormat:@"%@api/currency/all",baseurl]
                                                             completion:^(JSONModel *model, JSONModelError *err) {
                                                                 
                                                                 
                                                                 if(self.currencyData.responseStat.status){
                                                                 
                                                                     [self.tableData reloadData];
                                                                     
                                                                 }
                                                                 
                                                                 
                                                                 
                                                             }];
    
    
}

-(void) setCompanyTypeData{
    
    
    self.typeData = [[CompanyTypeResponse alloc] initFromURLWithString:[NSString stringWithFormat:@"%@api/companyType/all",baseurl]
                                                             completion:^(JSONModel *model, JSONModelError *err) {
                                                                 
                                                                 
                                                                 if(self.typeData.responseStat.status){
                                                             
                                                                     [self.tableData reloadData];
                                                                     
                                                                 }
                                                                 
                                                                 
                                                                 
                                                             }];
    
    
}
-(void) setCountryData{
    self.countryData = [[CountryResponse alloc] initFromURLWithString:[NSString stringWithFormat:@"%@country/all",baseurl]
                                                            completion:^(JSONModel *model, JSONModelError *err) {
                                                                
                                                              
                                                                if(self.countryData.responseStat.status){
                                                                    NSLog(@"%@",self.countryData);
                                                                    [self.tableData reloadData];
                                                                    
                                                                }
                                                                
                                                                
                                                                
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
