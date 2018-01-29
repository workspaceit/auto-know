//
//  TimingViewController.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 10/26/17.
//  Copyright © 2017 Workspace Infotech. All rights reserved.
//

#import "TimingViewController.h"
#import "AdvertTiming.h"
#import "PostAdvertThreeViewController.h"
#import "ToastView.h"
@interface TimingViewController ()
@property (strong,nonatomic) NSMutableArray *weekDays;
@property (strong,nonatomic) UIDatePicker *startTimePicker;
@property (strong,nonatomic) UIDatePicker *endTimePicker;
@property (strong,nonatomic)  UIAlertView *timePicker;
@property (assign,nonatomic) int seletedIndex;
@property (assign,nonatomic) BOOL isAlwaysSame;
@end

@implementation TimingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dayTable.delegate = self;
    self.dayTable.dataSource = self;
    self.startTimePicker = [[UIDatePicker alloc]init];
    self.endTimePicker   = [[UIDatePicker alloc]init];
    self.timePicker = [[UIAlertView alloc] initWithTitle:@"Choose Opening & Closing Time" message:nil delegate:self cancelButtonTitle:@"Cancel"
                                       otherButtonTitles:@"Done",@"Clear", nil];
    
    
    
    _weekDays = [[NSMutableArray alloc]init];
    
    
    AdvertTiming *monday = [[AdvertTiming alloc]init];
    monday.day = @"Monday";
    monday.alwaysOpen = false;
    monday.openingTime = @"";
    monday.closingTime = @"";
    monday.open = false;
    [_weekDays addObject: monday];
    
    AdvertTiming *tuesday = [[AdvertTiming alloc]init];
    tuesday.day = @"Tuesday";
    tuesday.alwaysOpen = false;
    tuesday.openingTime = @"";
    tuesday.closingTime = @"";
    tuesday.open = false;
    [_weekDays addObject: tuesday];
    
    AdvertTiming *wednesday = [[AdvertTiming alloc]init];
    wednesday.day = @"Wednesday";
    wednesday.alwaysOpen = false;
    wednesday.openingTime = @"";
    wednesday.closingTime = @"";
    wednesday.open = false;
    [_weekDays addObject: wednesday];
    
    AdvertTiming *thursday = [[AdvertTiming alloc]init];
    thursday.day = @"Thursday";
    thursday.alwaysOpen = false;
    thursday.openingTime = @"";
    thursday.closingTime = @"";
    thursday.open = false;
    [_weekDays addObject: thursday];
    
    AdvertTiming *friday = [[AdvertTiming alloc]init];
    friday.day = @"Friday";
    friday.alwaysOpen = false;
    friday.openingTime = @"";
    friday.closingTime = @"";
    friday.open = false;
    [_weekDays addObject: friday];
    
    AdvertTiming *saturday = [[AdvertTiming alloc]init];
    saturday.day = @"Saturday";
    saturday.alwaysOpen = false;
    saturday.openingTime = @"";
    saturday.closingTime = @"";
    saturday.open = false;
    [_weekDays addObject: saturday];
    
    AdvertTiming *sunday = [[AdvertTiming alloc]init];
    sunday.day = @"Sunday";
    sunday.alwaysOpen = false;
    sunday.openingTime = @"";
    sunday.closingTime = @"";
    sunday.open = false;
    [_weekDays addObject: sunday];
    
    
    UIBarButtonItem *flipButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Next"
                                   style:UIBarButtonItemStylePlain
                                   target:self
                                   action:@selector(nextAction:)];
    self.navigationItem.rightBarButtonItem = flipButton;
    
    self.isAlwaysSame = false;
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (buttonIndex) {
        case 0:
            break;
        case 1:
        {
            if(!_isAlwaysSame){
                AdvertTiming *day = [_weekDays objectAtIndex:_seletedIndex];
                day.open = true;
                
            }else{
                for (AdvertTiming *day in _weekDays){
                    day.open = true;
                }
            }
            [self.dayTable reloadData];
            break;
        }
        case 2:
        {
            AdvertTiming *day = [_weekDays objectAtIndex:_seletedIndex];
            day.closingTime = @"";
            day.openingTime = @"";
            day.open = false;
            [self.dayTable reloadData];
            break;
        }
            
        default:
            break;
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)alwaysOnChange:(id)sender {
    if(self.alwaysOn.isOn){
        for(AdvertTiming *day in self.weekDays){
            day.openingTime = @"00:00";
            day.closingTime =@"23:59";
            day.open = true;
        }
    }else{
        for(AdvertTiming *day in self.weekDays){
            day.openingTime = @"";
            day.closingTime =@"";
            day.open = false;
        }
    }
   
    [self.dayTable reloadData];
}
- (IBAction)alwaysSamechanged:(id)sender {
    self.isAlwaysSame = true;
    [self showPickerView];
}



#pragma - TableView
-(IBAction) nextAction:(id)sender{
    BOOL check = false;
    for (AdvertTiming *day in self.weekDays){
        if(day.open){
            check = true;
            break;
        }
    }
    
    if(!self.alwaysOn.isOn && !check){
        [ToastView showToastInParentView:self.view withText:@"Set Bussiness Timing" withDuaration:2.0];
    }else{
        [self performSegueWithIdentifier:@"next" sender:nil];
    }
    
    
}
#pragma - TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 7;    //count number of row from counting array hear cataGorry is An Array
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"Cell";
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:MyIdentifier] ;
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:MyIdentifier] ;
    }
    AdvertTiming *weekday = [_weekDays objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",weekday.day];
    [cell.textLabel setFont:[UIFont boldSystemFontOfSize:16]];
    cell.detailTextLabel.text =[NSString stringWithFormat:@"Open: %@ Close:%@",weekday.openingTime,weekday.closingTime];
    [cell.textLabel setFont:[UIFont boldSystemFontOfSize:12]];
    if(weekday.open){
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    return cell;
}
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.seletedIndex = (int)indexPath.row;
    [self showPickerView];
}
-(void) showPickerView{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 500, 800)];
    
    [_startTimePicker setFrame: CGRectMake(10, 0, 250, 50)];
    [_startTimePicker setDate:[NSDate date]];
    [_startTimePicker setDatePickerMode:UIDatePickerModeTime];
    [_startTimePicker addTarget:self action:@selector(updateStartTime:) forControlEvents:UIControlEventValueChanged];
    
    [_endTimePicker setFrame:CGRectMake(10, 55, 250, 50)];
    [_endTimePicker setDate:[NSDate date]];
    [_endTimePicker setDatePickerMode:UIDatePickerModeTime];
    [_endTimePicker addTarget:self action:@selector(updateClosingTime:) forControlEvents:UIControlEventValueChanged];
    [view addSubview:_startTimePicker];
    [view addSubview:_endTimePicker];
    [self.timePicker setValue:view forKey:@"accessoryView"];
    [self.timePicker show];
}

-(void)updateStartTime:(id)sender
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm";
    NSString *startTimeprettyVersion = [formatter stringFromDate:_startTimePicker.date];
    if(!_isAlwaysSame){
        AdvertTiming *day = [_weekDays objectAtIndex:_seletedIndex];
        day.openingTime = startTimeprettyVersion;
    }else{
        for (AdvertTiming *day in _weekDays){
            day.openingTime = startTimeprettyVersion;
        }
    }
    
    
    
}
-(void)updateClosingTime:(id)sender
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm";
    NSString *endTimeprettyVersion = [formatter stringFromDate:_endTimePicker.date];
    if(!_isAlwaysSame){
        AdvertTiming *day = [_weekDays objectAtIndex:_seletedIndex];
        day.closingTime = endTimeprettyVersion;
    }else{
        for (AdvertTiming *day in _weekDays){
            day.closingTime = endTimeprettyVersion;
        }
    }
    
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"next"])
    {
        NSMutableArray *delayedJsonObjectList = [NSMutableArray new];
        for (AdvertTiming *day in _weekDays) {
            NSMutableDictionary *delayedJsonObject = [[NSMutableDictionary alloc]init];
            [delayedJsonObject setValue:[day.day lowercaseString ] forKey:@"day"];
            [delayedJsonObject setValue:day.openingTime forKey:@"opening_time"];
            [delayedJsonObject setValue:day.closingTime forKey:@"closing_time"];
            [delayedJsonObject setValue:day.open?@"1":@"0" forKey:@"open"];
            [delayedJsonObjectList addObject:delayedJsonObject];
        }
        NSError *error = nil;
        NSData *delayedJsonData = [NSJSONSerialization dataWithJSONObject:delayedJsonObjectList options:NSJSONWritingPrettyPrinted error:&error];
        NSString *jsonString = [[NSString alloc] initWithData:delayedJsonData encoding:NSUTF8StringEncoding];
        NSLog(@"%@",jsonString);
        
        PostAdvertThreeViewController *data= segue.destinationViewController;
        data.image = self.image;
        data.otherImg = self.otherImg;
        data.bannerImage = self.bannerImage;
        data.discount = self.discount;
        data.price = self.price;
        data.descriptn = self.descriptn;
        data.city = self.city;
        data.postcode = self.postcode;
        data.address = self.address;
        data.aboutCompany = self.aboutCompany;
        data.website = self.website;
        data.companyName = self.companyName;
        data.phoneNumber = self.phoneNumber;
        data.currency = self.currency;
        data.discountCurrency = self.discountCurrency;
        data.companyType = self.companyType;
        data.customId = self.customId;
        data.ref = self.ref;
        data.info = self.info;
        data.misc = self.misc;
        data.country = self.country;
        data.companyTypeOther = self.companyTypeOther;
        data.timings = jsonString;
        data.serviceAlwaysOn = self.alwaysOn.isOn?1:0;
        data.lat = self.lat;
        data.lng = self.lng;
        
    }
}



@end
