//
//  AppDelegate.h
//  FlyWithMe
//
//  Created by Hung Do on 11/7/15.
//  Copyright © 2015 Hung Do. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SNUserProfile.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) SNUserProfile *userProfile;

-(void) saveUserProfile:(SNUserProfile *) profile;

@end

