//
//  AppDelegate.m
//  Cabguard Advert
//
//  Created by Workspace Infotech on 12/7/15.
//  Copyright © 2015 Workspace Infotech. All rights reserved.
//

#import "AppDelegate.h"
#import "PayPalMobile.h"
#import <GoogleMaps/GoogleMaps.h>
#import <GooglePlaces/GooglePlaces.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [PayPalMobile initializeWithClientIdsForEnvironments:@{PayPalEnvironmentProduction : @"Adlb_rW3rKJbs3QYaWr4fOlOt17TKk_l5OQ2S3NzWoJFeOz4U8rJ5xfavoVpAgQYGNxlUjulXqrb_z1e",
                                                           PayPalEnvironmentSandbox : @"Ac4igx3caH3qGhEDmSJRzng_DPNFOV9lZTE9gfY6adYd0qjU4O6BsyQ8m5-24NUzgP-eoliQPv3glZ0r"}];
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:63.00/255.00 green:132.00/255.00 blue:194.00/255.00 alpha:1]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    NSShadow *shadow = [[NSShadow alloc] init];
    
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{
                                                           NSForegroundColorAttributeName: [UIColor whiteColor],
                                                           NSShadowAttributeName: shadow,
                                                           NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:25.0]
                                                           }];
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
  //  [defaults setValue:@"http://27.147.149.178:9030/cabgurdadvert/public/index.php/" forKey:@"baseurl"];
  //  [defaults setValue:@"http://27.147.149.178:9030/cabgurdadvert/public/" forKey:@"fineurl"];
    
    [defaults setValue:@"http://advert.cabguardpro.com/" forKey:@"baseurl"];
    [defaults setValue:@"http://advert.cabguardpro.com/" forKey:@"fineurl"];
    
//    [defaults setValue:@"http://163.53.151.3/cabguardadvert/public/" forKey:@"baseurl"];
//    [defaults setValue:@"http://163.53.151.3/cabguardadvert/public/" forKey:@"fineurl"];
    
    [GMSServices provideAPIKey:@"AIzaSyA9rs93zIUJpOVuB2cBlbXLZUfW7ExMtMQ"];
    [GMSPlacesClient provideAPIKey:@"AIzaSyACcPNDLSEeKqeDBkRTbMwRcZd0ibfwxDU"];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
