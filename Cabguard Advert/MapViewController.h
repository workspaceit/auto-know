//
//  MapViewController.h
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/7/16.
//  Copyright © 2016 Workspace Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
@interface MapViewController : UIViewController{
    GMSMapView *mapView;
    CLLocationCoordinate2D coordinate;
    
}
@property  NSString *address;
@property NSString *comapnyName;
@property double lat;
@property double lng;
@end
