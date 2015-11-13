//
//  SNUserProfile.h
//  FlyWithMe
//
//  Created by Luke on 11/7/15.
//  Copyright © 2015 Hung Do. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNUserProfile : NSObject

//@property (strong, nonatomic) UIImage  *profileImage;
@property (strong, nonatomic) NSString *userName;
@property BOOL showAttractions;
@property BOOL transfers;
@property BOOL priceCare;
@property BOOL loveIndex;
@property BOOL stability;

@end
