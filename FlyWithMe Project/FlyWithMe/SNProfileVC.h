//
//  SNProfileVC.h
//  FlyWithMe
//
//  Created by Luke on 11/7/15.
//  Copyright © 2015 Hung Do. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SNUserProfile.h"
#import "PMCalendar.h"

@interface SNProfileVC : UIViewController<UISearchBarDelegate,PMCalendarControllerDelegate, UIGestureRecognizerDelegate>

@property (strong, nonatomic) UIImage  *profileImage;
@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) SNUserProfile *userProfile;
@property BOOL showAttractions;
@property BOOL transfers;
@property BOOL priceCare;
@property BOOL loveIndex;
@property BOOL stability;
@property (strong, nonatomic) NSString *fullName;

- (IBAction)showCalendar:(id)sender;

@end
