//
//  SNFlightInfo.h
//  FlyWithMe
//
//  Created by Luke on 11/8/15.
//  Copyright © 2015 Hung Do. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SNFlightInfo : NSObject

@property (strong, nonatomic) NSNumber *dining;
@property (strong, nonatomic) NSNumber *entertainment;
@property (strong, nonatomic) NSString *duration;
@property (strong, nonatomic) NSString *flightDateTime;
@property (strong, nonatomic) NSString *flightFare;
@property (strong, nonatomic) NSString *flightNo;
@property (strong, nonatomic) NSNumber *inflightCommunications;
@property (strong, nonatomic) NSString *sector;
@property (strong, nonatomic) NSDictionary *transitions;
@property (strong, nonatomic) NSNumber *wines;

@end
