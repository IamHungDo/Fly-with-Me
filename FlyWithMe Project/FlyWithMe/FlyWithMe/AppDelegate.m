//
//  AppDelegate.m
//  FlyWithMe
//
//  Created by Hung Do on 11/7/15.
//  Copyright © 2015 Hung Do. All rights reserved.
//

#import "AppDelegate.h"
#import "SNStartVC.h"
#import "SNUserProfile.h"
#import <Fabric/Fabric.h>
#import <TwitterKit/TwitterKit.h>


@interface AppDelegate () <UISplitViewControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [Fabric with:@[[Twitter class]]];
    NSLog(@"application didFinishLaunchingWithOptions");
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    if (!self.userProfile) {
        self.userProfile = [self loadUserProfile];
    }
    SNStartVC *startVC = [[SNStartVC alloc]init];
    startVC.userProfile = self.userProfile;
    self.window.rootViewController =[[UINavigationController alloc] initWithRootViewController:startVC];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    NSLog(@"applicationWillResignActive called.");
    if (self.userProfile) {
        [self saveUserProfile:self.userProfile];
    }
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"applicationDidEnterBackground");
    if (self.userProfile) {
        [self saveUserProfile:self.userProfile];
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    NSLog(@"applicationWillEnterForegfround called.");
    if (!self.userProfile) {
        self.userProfile = [self loadUserProfile];
    }
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"applicationDidBecomeActive called.");
    if (!self.userProfile) {
        self.userProfile = [self loadUserProfile];
    }
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(NSData *) NSDataFromProfile:(SNUserProfile *)profile
{
    NSMutableData *profileData = [[NSMutableData alloc]init];
    NSKeyedArchiver *coder = [[NSKeyedArchiver alloc] initForWritingWithMutableData:profileData];
    
    [coder encodeObject:profile.userName forKey:@"userName"];
    NSNumber *showAttractions = profile.showAttractions ? @1 : @0;
    NSNumber *transfers       = profile.transfers ? @1 : @0;
    NSNumber *priceCare       = profile.priceCare ? @1 : @0;
    NSNumber *loveIndex       = profile.loveIndex ? @1 : @0;
    NSNumber *stability       = profile.stability ? @1 : @0;
    [coder encodeObject:showAttractions forKey:@"showAttractions"];
    [coder encodeObject:transfers forKey:@"transfers"];
    [coder encodeObject:priceCare forKey:@"priceCare"];
    [coder encodeObject:loveIndex forKey:@"loveIndex"];
    [coder encodeObject:stability forKey:@"stability"];
    [coder finishEncoding];
    
    NSData *output = [[NSData alloc] initWithData:profileData];
    return output;
}

-(SNUserProfile *) userProfileFromNSData:(NSData *) data
{
    SNUserProfile *profile = [[SNUserProfile alloc]init];
    
    NSKeyedUnarchiver *coder = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
    
    profile.userName        = [coder decodeObjectForKey:@"userName"];
    profile.showAttractions = [[coder decodeObjectForKey:@"showAttractions"] isEqualToNumber:@1] ? YES : NO;
    profile.transfers       = [[coder decodeObjectForKey:@"transfers"] isEqualToNumber:@1] ? YES : NO;
    profile.priceCare       = [[coder decodeObjectForKey:@"priceCare"] isEqualToNumber:@1] ? YES : NO;
    profile.loveIndex       = [[coder decodeObjectForKey:@"loveIndex"] isEqualToNumber:@1] ? YES : NO;
    profile.stability       = [[coder decodeObjectForKey:@"stability"] isEqualToNumber:@1] ? YES : NO;
    
    return profile;
}

-(void) saveUserProfile:(SNUserProfile *) profile
{
    NSLog(@"saveUserProfile tapped!!");
    if (!profile.userName) {
        NSLog(@"profile.userName is null, cannot save to disk");
        return;
    }
    if ([profile.userName isEqualToString:@""]) {
        NSLog(@"profile.userName is the empty string, cannot save...");
        return;
    }
    NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [NSString stringWithFormat:@"%@/profile.file",documentsDirectory];
    NSData   *fileData = [self NSDataFromProfile:profile];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        [[NSFileManager defaultManager] removeItemAtPath:filePath error:NULL];
    }
    [[NSFileManager defaultManager] createFileAtPath:filePath contents:fileData attributes:NULL];
    NSLog(@"saved userProfile: %@ to path: %@",profile, filePath);
}
-(SNUserProfile *) loadUserProfile
{
    NSLog(@"loadUserProfile tapped!!");
    
    NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [NSString stringWithFormat:@"%@/profile.file",documentsDirectory];
    NSData   *fileData = [[NSFileManager defaultManager] contentsAtPath:filePath];
    if (!fileData) {
        NSLog(@"fileData was null!! couldn't restore a userProfile object");
        return nil;
    }
    SNUserProfile *profile = [self userProfileFromNSData:fileData];
    
    NSLog(@"loaded profile: %@ from path: %@",profile, filePath);
    
    return profile;
}

@end
