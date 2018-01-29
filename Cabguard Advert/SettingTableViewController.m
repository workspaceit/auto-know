//
//  SettingTableViewController.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 10/6/17.
//  Copyright © 2017 Workspace Infotech. All rights reserved.
//

#import "SettingTableViewController.h"

@interface SettingTableViewController ()

@end

@implementation SettingTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *flipButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Back"
                                   style:UIBarButtonItemStylePlain
                                   target:self
                                   action:@selector(flipView:)];
    self.navigationItem.leftBarButtonItem = flipButton;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
-(IBAction)flipView:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Advertise";
            break;
        case 1:
            cell.textLabel.text = @"About Us";
            break;
        case 2:
            cell.textLabel.text = @"Terms";
            break;
        case 3:
            cell.textLabel.text = @"Privacy";
            break;
        case 4:
            cell.textLabel.text = @"Copyright © Powered by Etuitive";
            break;
        default:
            break;
    }
    
    
    return cell;
}
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0)
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://advertising.cabguardpro.com/advertising/enquiry"]];
    }
    else if(indexPath.section ==0 && indexPath.row == 1){
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://advertising.cabguardpro.com/advertising/enquiry"]];
    }
    else if(indexPath.section == 0 && indexPath.row == 2){
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.cabguardpro.com/terms"]];
    }
    else if(indexPath.section == 0 && indexPath.row == 3){
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.cabguardpro.com/privacy"]];
    }
    else if(indexPath.section ==0 && indexPath.row == 4){
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.etuitive.co.uk"]];
    }
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
