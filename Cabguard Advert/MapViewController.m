//
//  MapViewController.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/7/16.
//  Copyright © 2016 Workspace Infotech. All rights reserved.
//

#import "MapViewController.h"

#import <GoogleMaps/GoogleMaps.h>
@interface MapViewController ()

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.comapnyName;
    NSLog(@"address : %@",self.address);
    double  latFrom ;
    double  lonFrom;
    CLLocationCoordinate2D center;
    if (self.lat != 0.0 && self.lng != 0.0) {
        latFrom = self.lat;
        lonFrom = self.lng;
    }else{
        center=[self getLocationFromAddressString:self.address];
        latFrom = center.latitude;
        lonFrom = center.longitude;
    }
    
    NSLog(@"View Controller get Location Logitute : %f",latFrom);
    NSLog(@"View Controller get Location Latitute : %f",lonFrom);
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:latFrom longitude:lonFrom zoom:8];
    mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    mapView.myLocationEnabled = YES;
    self.view = mapView;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(latFrom,lonFrom);
    marker.title =  self.comapnyName;
    marker.snippet = self.address;
    marker.map = mapView;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(CLLocationCoordinate2D) getLocationFromAddressString: (NSString*) addressStr {
    double latitude = 0, longitude = 0;
    NSString *esc_addr =  [addressStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *req = [NSString stringWithFormat:@"http://maps.google.com/maps/api/geocode/json?sensor=false&address=%@", esc_addr];
    NSString *result = [NSString stringWithContentsOfURL:[NSURL URLWithString:req] encoding:NSUTF8StringEncoding error:NULL];
    if (result) {
        NSScanner *scanner = [NSScanner scannerWithString:result];
        if ([scanner scanUpToString:@"\"lat\" :" intoString:nil] && [scanner scanString:@"\"lat\" :" intoString:nil]) {
            [scanner scanDouble:&latitude];
            if ([scanner scanUpToString:@"\"lng\" :" intoString:nil] && [scanner scanString:@"\"lng\" :" intoString:nil]) {
                [scanner scanDouble:&longitude];
            }
        }
    }
    CLLocationCoordinate2D center;
    center.latitude=latitude;
    center.longitude = longitude;
    NSLog(@"View Controller get Location Logitute : %f",center.latitude);
    NSLog(@"View Controller get Location Latitute : %f",center.longitude);
    return center;
    
}
@end
