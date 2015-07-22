//
//  AppDelegate.m
//  Roast Me!
//
//  Created by Seyun Kim on 7/16/15.
//  Copyright (c) 2015 Zack S Kim. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <ParseFacebookUtilsV4/PFFacebookUtils.h>
@interface AppDelegate ()
@property PFUser* currentUser;
@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	// [Optional] Power your app with Local Datastore. For more info, go to
	// https://parse.com/docs/ios_guide#localdatastore/iOS
	[Parse enableLocalDatastore];
 
	// Initialize Parse.
	[Parse setApplicationId:@"BebgUZpgcf3rF8RexuEr42vesjKZQzQlx2yRhq7C"
								clientKey:@"2nSP0zf3b2RB5MrfUFzt1aMNVXLSNdNnZmewN6Ee"];
	
	
	[PFFacebookUtils initializeFacebookWithApplicationLaunchOptions:launchOptions];

	[PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
	
	return [[FBSDKApplicationDelegate sharedInstance] application:application
																	didFinishLaunchingWithOptions:launchOptions];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
	[FBSDKAppEvents activateApp];
	[[NSNotificationCenter defaultCenter] postNotificationName:@"ResumeBgVideo"object:self];
}




- (BOOL)application:(UIApplication *)application
						openURL:(NSURL *)url
	sourceApplication:(NSString *)sourceApplication
				 annotation:(id)annotation {
	return [[FBSDKApplicationDelegate sharedInstance] application:application
																												openURL:url
																							sourceApplication:sourceApplication
																										 annotation:annotation];
}


- (void)applicationWillResignActive:(UIApplication *)application {
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	
	[[NSNotificationCenter defaultCenter] postNotificationName:@"PauseBgVideo"object:self];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end