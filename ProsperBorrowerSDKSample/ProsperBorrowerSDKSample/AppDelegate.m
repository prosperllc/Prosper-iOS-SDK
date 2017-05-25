//
//  AppDelegate.m
//  ProsperBorrowerSDKSample
//
//  Copyright © 2015 Prosper Funding, LLC, All rights reserved.
//

#import "AppDelegate.h"
#import "WelcomeViewController.h"
#import "OfferViewController.h"
#import <ProsperBorrowerSDK/ProsperBorrowerSDK.h>


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [PMIProsperConfig initWithClientId:@"dab5ff015d5f4e9bb6913953b859a1e0"
                          clientSecret:@"844a1e14ec4f4ea68cd9bb3ac9649a78"
                                 refMC:@"meetalbert"
                                 refAC:@"meetalbert"
                       prodCredentials:NO];


    UIStoryboard *thankyouStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    WelcomeViewController *mvc = [thankyouStoryBoard instantiateViewControllerWithIdentifier:@"WelcomeViewController"];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:mvc];
    self.window.rootViewController = navController;
    
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
