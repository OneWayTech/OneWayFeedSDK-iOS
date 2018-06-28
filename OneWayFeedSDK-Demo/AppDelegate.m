//
//  AppDelegate.m
//  VideoFeedSDK
//
//  Created by lch on 2018/4/17.
//  Copyright © 2018年 ONEWAY. All rights reserved.
//

#import "AppDelegate.h"
#import "OneWayFeedSDK.h"

#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    [OneWayFeedSDK configureWithAppkey:@"d047bee2fbd54c7ca7517fd6663f7802" appSecret:@"d9ea9519071e4494a5ce17dc3354d4a8"];


    UITabBarController *tabbar = [[UITabBarController alloc] init];
    
    ViewController *home = [[ViewController alloc] init];
    home.tabBarItem.title = @"Home";
    home.tabBarItem.image = [UIImage imageNamed:@"home"];    
    [tabbar addChildViewController:home];
    
    UINavigationController *navigation = [OneWayFeedSDK nativeWithTabBarTitle:@"原生"
               tabBarImage:[UIImage imageNamed:@"safari"]];
    [tabbar addChildViewController:navigation];
    
    UIViewController *h5 = [OneWayFeedSDK HTML5WithTabBarTitle:@"HTML 5" tabBarImage:[UIImage imageNamed:@"OneWaySDK.bundle/ow_tabbarIcon.png"]];
    [tabbar addChildViewController:h5];

    
    
  
    

   

    
    
    
    self.window.rootViewController = tabbar;
    
    [self.window makeKeyAndVisible];
     NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    NSLog( @"  %@  ", documentDirectory);

    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
