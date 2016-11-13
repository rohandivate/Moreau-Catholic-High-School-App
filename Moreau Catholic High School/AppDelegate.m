//
//  AppDelegate.m
//  Moreau Catholic High School
//
//  Created by Rohan Divate on 6/24/15.
//  Copyright (c) 2015 Rohan Divate. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)]){
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil]];
    }
    // Override point for customization after application launch.
    return YES;
}

- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:@"FirstTimeBool"]==nil) {
        [defaults setObject:@"YES" forKey:@"FirstTimeBool"];
        NSDate *today = [NSDate date];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MMMM dd, yyyy"];
        
        NSString* path = [[NSBundle mainBundle] pathForResource:@"example"
                                                         ofType:@"txt"];
        NSString* content = [NSString stringWithContentsOfFile:path
                                                      encoding:NSUTF8StringEncoding
                                                         error:NULL];
        NSArray* allLinedStrings = [content componentsSeparatedByCharactersInSet:
                                    [NSCharacterSet newlineCharacterSet]];
        for (int i = 0; i < allLinedStrings.count; i++) {
            NSString* strsInOneLine = [allLinedStrings objectAtIndex:i];
            NSArray* singleStrs = [strsInOneLine componentsSeparatedByCharactersInSet:
                                   [NSCharacterSet characterSetWithCharactersInString:@";"]];
            NSString *date = [singleStrs objectAtIndex:0];
            NSDate *eventDate = [dateFormatter dateFromString:date];
            if ([today compare:eventDate] == NSOrderedAscending) {
                for (int j = 1; j < singleStrs.count; j+=2) {
                    UILocalNotification *notification = [[UILocalNotification alloc]init];
                    notification.fireDate = [NSDate dateWithTimeInterval:0 sinceDate:eventDate];
                    NSString *body = [[singleStrs objectAtIndex:j] stringByAppendingString:@"\n"];
                    NSString *body2 = [body stringByAppendingString:[singleStrs objectAtIndex:j+1]];
                    [notification setAlertBody:body2];
                    notification.timeZone = [NSTimeZone defaultTimeZone];
                    [[UIApplication sharedApplication]scheduleLocalNotification:notification];
                }
            }
        }
    }

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
