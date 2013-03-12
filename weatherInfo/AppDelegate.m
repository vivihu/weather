//
//  AppDelegate.m
//  weatherInfo
//
//  Created by icreative-mini on 13-3-8.
//  Copyright (c) 2013年 icreative-mini. All rights reserved.
//

#import "AppDelegate.h"
#import <RestKit/RestKit.h>
#import "ViewController.h"
#import "detail.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    [RKMIMETypeSerialization registerClass:[detail class] forMIMEType:@"text/html"];
    
    RKObjectMapping *mapping = [[RKObjectMapping alloc]initWithClass:[detail class]];
    [mapping addAttributeMappingsFromDictionary:@{
     @"temp1":@"temp1",
     @"wind1":@"wind1",
     @"index_uv":@"index_uv",
     @"index_d":@"index_d",
     @"weather1":@"weather1",
     
     @"temp2":@"temp2",
     @"wind2":@"wind2",
     @"weather2":@"weather2",
     
     @"temp3":@"temp3",
     @"wind3":@"wind3",
     @"weather3":@"weather3",
     
     @"temp4":@"temp4",
     @"wind4":@"wind4",
     @"weather4":@"weather4",
     
     @"temp5":@"temp5",
     @"wind5":@"wind5",
     @"weather5":@"weather5",
     
     @"temp6":@"temp6",
     @"wind6":@"wind6",
     @"weather6":@"weather6",
     }];
    RKResponseDescriptor *response = [RKResponseDescriptor responseDescriptorWithMapping:mapping
                                                                             pathPattern:nil
                                                                                 keyPath:@"weatherinfo"
                                                                             statusCodes:[NSIndexSet indexSetWithIndex:200]];
    AFHTTPClient *client = [[AFHTTPClient alloc]initWithBaseURL:[NSURL URLWithString:@"http://m.weather.com.cn"]];
//    [client setDefaultHeader:@"Accept" value:@"text/html"];
    RKObjectManager *objectManager = [[RKObjectManager alloc]initWithHTTPClient:client];
    [objectManager addResponseDescriptor:response]; 
    
    
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/********************页面旋转*************************/
-(NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskLandscape;
    //     UIInterfaceOrientationMaskAll
    //     UIInterfaceOrientationMaskAllButUpsideDown
}
-(BOOL)shouldAutorotate{
    return YES;
}
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
    return YES;
}
/********************页面旋转*************************/


@end
