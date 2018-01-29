//
//  SelectTitleViewController.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/7/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "SelectTitleViewController.h"
#import "JSONModelLib.h"
#import "JSONModelNetworking/JSONHTTPClient.h"
#import "SignUpFirstViewController.h"

@implementation SelectTitleViewController

-(void) viewDidLoad
{
    [super viewDidLoad];
    
    defaults = [NSUserDefaults standardUserDefaults];
    baseurl = [defaults objectForKey:@"baseurl"];
    
    
    //self.singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    //[self.view addGestureRecognizer:self.singleTap];
    
    [self setPickerData];
   
    
}

- (IBAction)close:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - table methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.responseData.count;
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    PersonTitle *data = self.data.responseData[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",data.name];

    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PersonTitle *data = self.data.responseData[indexPath.row];
    NSInteger numberOfViewControllers = self.navigationController.viewControllers.count;
    SignUpFirstViewController *data1 = [self.navigationController.viewControllers objectAtIndex:numberOfViewControllers - 2];
    data1.personTitle = data;
    
    [self.navigationController popViewControllerAnimated:YES];
 
}

-(void) setPickerData{
    
    
    self.data = [[PersonTitleResponse alloc] initFromURLWithString:[NSString stringWithFormat:@"%@personTitle/all",baseurl]
                                                         completion:^(JSONModel *model, JSONModelError *err) {

                                                             
                                                             if(self.data.responseStat.status){
                                                                 NSLog(@"%@",self.data);
                                                                 [self.tableData reloadData];
                                                                 
                                                             }
                                                             
                                    
                                                             
                                                         }];

    
}





- (void)handleSingleTap:(UITapGestureRecognizer *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
