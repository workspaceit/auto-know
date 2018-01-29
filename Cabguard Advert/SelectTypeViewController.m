//
//  SelectTypeViewController.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/9/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "SelectTypeViewController.h"
#import "BussinessDataOneViewController.h"
#import "JSONHTTPClient.h"
#import "JSONModelLib.h"

@interface SelectTypeViewController ()

@end

@implementation SelectTypeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    defaults = [NSUserDefaults standardUserDefaults];
    baseurl = [defaults objectForKey:@"baseurl"];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    [self setPickerData];
    
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
    BusinessCategory *data = self.data.responseData[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@",data.categoryDisplayValue];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BusinessCategory *data = self.data.responseData[indexPath.row];
    NSInteger numberOfViewControllers = self.navigationController.viewControllers.count;
    BussinessDataOneViewController *data1 = [self.navigationController.viewControllers objectAtIndex:numberOfViewControllers - 2];
    data1.type = data;
    data1.typeChange = YES;
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void) setPickerData{
    
    
    self.data = [[BusinessCategoryResponse alloc] initFromURLWithString:[NSString stringWithFormat:@"%@businessCategory/all",baseurl]
                                                    completion:^(JSONModel *model, JSONModelError *err) {
                                                        
                                                        
                                                        if(self.data.responseStat.status){
                                                            NSLog(@"%@",self.data);
                                                            [self.tableData reloadData];
                                                            
                                                        }
                                                        
                                                        
                                                        
                                                    }];
    
    
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
