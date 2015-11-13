//
//  SNStartVC.h
//  FlyWithMe
//
//  Created by Luke on 11/7/15.
//  Copyright © 2015 Hung Do. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SNUserProfile.h"

@interface SNStartVC : UIViewController<UITextViewDelegate>

@property (strong, nonatomic) UIImage  *profileImage;
@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSString *fullName;
@property (strong, nonatomic) SNUserProfile *userProfile;

@end
