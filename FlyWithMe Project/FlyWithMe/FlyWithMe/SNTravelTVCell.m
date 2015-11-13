//
//  SNTravelTVCell.m
//  HotelBuddy
//
//  Created by Yuyu Peng on 4/8/15.
//  Copyright (c) 2015 Snap Group, LLC. All rights reserved.
//


#import "SNTravelTVCell.h"
#import "UIView+AutoLayoutView.h"

@implementation SNTravelTVCell

//Destination
@synthesize destinationIV = _destinationIV;
@synthesize destinationName = _destinationName;
@synthesize destinationLocation = _destinationLocation;
@synthesize startDate = _startDate;
@synthesize endDate = _endDate;
@synthesize favoriteButton = _favoriteButton;
@synthesize goButton = _goButton;
@synthesize favoriteActivityIndicator = _favoriteActivityIndicator;
@synthesize goActivityIndicator = _goActivityIndicator;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.destinationIV = [UIImageView newAutoLayoutView];
        self.destinationIV.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.destinationIV];
        
        self.destinationName = [UILabel newAutoLayoutView];
        self.destinationName.backgroundColor = [UIColor whiteColor];
        self.destinationName.textAlignment = NSTextAlignmentCenter;
        self.destinationName.textColor = [UIColor blackColor];
        self.destinationName.font = [UIFont boldSystemFontOfSize:18];
        [self addSubview:self.destinationName];
        
        self.destinationLocation = [UILabel newAutoLayoutView];
        self.destinationLocation.backgroundColor = [UIColor colorWithRed:(38.0/255.0) green:(8.0/255.0) blue:(2.0/255.0) alpha:(200/255.0)];
        self.destinationLocation.alpha = 0.8;
        self.destinationLocation.textColor = [UIColor whiteColor];
        self.destinationLocation.textAlignment = NSTextAlignmentCenter;
        self.destinationLocation.shadowColor = [UIColor darkGrayColor];
        //self.destinationLocation.font = [UIFont boldSystemFontOfSize:18];
        self.destinationLocation.shadowOffset = CGSizeMake(-1.0,-1.0);
        [self addSubview:self.destinationLocation];
        
        self.startDate = [UILabel newAutoLayoutView];
        self.startDate.textColor = [UIColor blackColor];
        self.startDate.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.startDate];
        
        self.endDate = [UILabel newAutoLayoutView];
        self.endDate.textColor = [UIColor blackColor];
        self.endDate.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.endDate];
        
        self.favoriteButton = [UIButton newAutoLayoutView];
        [self.favoriteButton setBackgroundImage:[UIImage imageNamed:@"heart-before.png"] forState:UIControlStateNormal];
        [self.favoriteButton setBackgroundImage:[UIImage imageNamed:@"heart-after.png"] forState:UIControlStateSelected];
        [self.favoriteButton setBackgroundImage:[UIImage imageNamed:@"heart-after.png"] forState:UIControlStateHighlighted];
        [self addSubview:self.favoriteButton];
        
        self.favoriteActivityIndicator = [UIActivityIndicatorView newAutoLayoutView];
        [self.favoriteActivityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
        [self addSubview:self.favoriteActivityIndicator];
        
        self.goButton = [UIButton newAutoLayoutView];
        [self.goButton setBackgroundImage:[UIImage imageNamed:@"go_before-100.png"] forState:UIControlStateNormal];
        [self.goButton setBackgroundImage:[UIImage imageNamed:@"go_after-100.png"] forState:UIControlStateSelected];
        [self.goButton setBackgroundImage:[UIImage imageNamed:@"go_after-100.png"] forState:UIControlStateHighlighted];
        [self addSubview:self.goButton];
        
        self.goActivityIndicator = [UIActivityIndicatorView newAutoLayoutView];
        [self.goActivityIndicator setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
        [self addSubview:self.goActivityIndicator];
        
        //Views Auto Layout
        NSDictionary *viewsDictionary = @{@"destinationIV":self.destinationIV, @"destinationName":self.destinationName, @"startDate":self.startDate, @"endDate":self.endDate, @"goButton":self.goButton, @"destinationLocation":self.destinationLocation, @"favoriteButton":self.favoriteButton, @"goButton":self.goButton};
        
        NSDictionary *metrics = @{@"vSpace":@0, @"lSpace":@0, @"hSpace":@0};
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-vSpace-[destinationIV]-lSpace-[destinationName]-lSpace-[startDate]-vSpace-|"
                                                                     options:NSLayoutFormatAlignAllLeft
                                                                     metrics:metrics
                                                                       views:viewsDictionary]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-vSpace-[destinationIV]-lSpace-[destinationName]-lSpace-[endDate]-vSpace-|"
                                                                     options:NSLayoutFormatAlignAllRight
                                                                     metrics:metrics
                                                                       views:viewsDictionary]];
        
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpace-[destinationIV(destinationName)]-hSpace-|" options:0 metrics:metrics views:viewsDictionary]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpace-[startDate]-lSpace-[endDate]-hSpace-|" options:0 metrics:metrics views:viewsDictionary]];
        
        
        //Height
        
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.destinationIV
                             attribute:NSLayoutAttributeHeight
                             relatedBy:NSLayoutRelationEqual
                             toItem:self
                             attribute:NSLayoutAttributeHeight
                             multiplier:0.8
                             constant:0.0]];
        
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.destinationName
                             attribute:NSLayoutAttributeHeight
                             relatedBy:NSLayoutRelationEqual
                             toItem:self
                             attribute:NSLayoutAttributeHeight
                             multiplier:0.1
                             constant:0.0]];
        
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.startDate
                             attribute:NSLayoutAttributeHeight
                             relatedBy:NSLayoutRelationEqual
                             toItem:self
                             attribute:NSLayoutAttributeHeight
                             multiplier:0.1
                             constant:0.0]];
        
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.endDate
                             attribute:NSLayoutAttributeHeight
                             relatedBy:NSLayoutRelationEqual
                             toItem:self
                             attribute:NSLayoutAttributeHeight
                             multiplier:0.1
                             constant:0.0]];
        
        //Width
        
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.destinationIV
                             attribute:NSLayoutAttributeWidth
                             relatedBy:NSLayoutRelationEqual
                             toItem:self
                             attribute:NSLayoutAttributeWidth
                             multiplier:1
                             constant:0.0]];
        
        
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.destinationName
                             attribute:NSLayoutAttributeWidth
                             relatedBy:NSLayoutRelationEqual
                             toItem:self
                             attribute:NSLayoutAttributeWidth
                             multiplier:1
                             constant:0.0]];
        
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.startDate
                             attribute:NSLayoutAttributeWidth
                             relatedBy:NSLayoutRelationEqual
                             toItem:self
                             attribute:NSLayoutAttributeWidth
                             multiplier:0.5
                             constant:0.0]];
        
        
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.endDate
                             attribute:NSLayoutAttributeWidth
                             relatedBy:NSLayoutRelationEqual
                             toItem:self
                             attribute:NSLayoutAttributeWidth
                             multiplier:0.5
                             constant:0.0]];
        
        
        // Location Label Size
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.destinationLocation
                             attribute:NSLayoutAttributeWidth
                             relatedBy:NSLayoutRelationEqual
                             toItem:self.destinationIV
                             attribute:NSLayoutAttributeWidth
                             multiplier:0.4
                             constant:0.0]];
        
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.destinationLocation
                             attribute:NSLayoutAttributeHeight
                             relatedBy:NSLayoutRelationEqual
                             toItem:self.destinationIV
                             attribute:NSLayoutAttributeHeight
                             multiplier:0.15
                             constant:0.0]];
        
        // Location Label Position: Bottom left corner
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.destinationLocation
                             attribute:NSLayoutAttributeLeft
                             relatedBy:NSLayoutRelationEqual
                             toItem:self.destinationIV
                             attribute:NSLayoutAttributeLeft
                             multiplier:1.0
                             constant:5.0]];
        
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.destinationLocation
                             attribute:NSLayoutAttributeBottom
                             relatedBy:NSLayoutRelationEqual
                             toItem:self.destinationIV
                             attribute:NSLayoutAttributeBottom
                             multiplier:1.0
                             constant:-5.0]];
        
        
        // Favorite Button Size
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.favoriteButton
                             attribute:NSLayoutAttributeWidth
                             relatedBy:NSLayoutRelationEqual
                             toItem:self.destinationIV
                             attribute:NSLayoutAttributeWidth
                             multiplier:0.15
                             constant:0.0]];
        
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.favoriteButton
                             attribute:NSLayoutAttributeHeight
                             relatedBy:NSLayoutRelationEqual
                             toItem:self.destinationIV
                             attribute:NSLayoutAttributeHeight
                             multiplier:0.2
                             constant:0.0]];
        
        // Favorite Button Position: Top right corner
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.favoriteButton
                             attribute:NSLayoutAttributeRight
                             relatedBy:NSLayoutRelationEqual
                             toItem:self.destinationIV
                             attribute:NSLayoutAttributeRight
                             multiplier:1.0
                             constant:-10.0]];
        
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.favoriteButton
                             attribute:NSLayoutAttributeTop
                             relatedBy:NSLayoutRelationEqual
                             toItem:self.destinationIV
                             attribute:NSLayoutAttributeTop
                             multiplier:1.0
                             constant:10.0]];
        
        // Acitivity Indictor Size
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.favoriteActivityIndicator
                             attribute:NSLayoutAttributeWidth
                             relatedBy:NSLayoutRelationEqual
                             toItem:self.destinationIV
                             attribute:NSLayoutAttributeWidth
                             multiplier:0.15
                             constant:0.0]];
        
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.favoriteActivityIndicator
                             attribute:NSLayoutAttributeHeight
                             relatedBy:NSLayoutRelationEqual
                             toItem:self.destinationIV
                             attribute:NSLayoutAttributeHeight
                             multiplier:0.2
                             constant:0.0]];
        
        // Favorite AI Position: Top right corner
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.favoriteActivityIndicator
                             attribute:NSLayoutAttributeRight
                             relatedBy:NSLayoutRelationEqual
                             toItem:self.destinationIV
                             attribute:NSLayoutAttributeRight
                             multiplier:1.0
                             constant:-10.0]];
        
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.favoriteActivityIndicator
                             attribute:NSLayoutAttributeTop
                             relatedBy:NSLayoutRelationEqual
                             toItem:self.destinationIV
                             attribute:NSLayoutAttributeTop
                             multiplier:1.0
                             constant:10.0]];
        
        
        // Go Button Size
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.goButton
                             attribute:NSLayoutAttributeWidth
                             relatedBy:NSLayoutRelationEqual
                             toItem:self.destinationIV
                             attribute:NSLayoutAttributeWidth
                             multiplier:0.15
                             constant:0.0]];
        
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.goButton
                             attribute:NSLayoutAttributeHeight
                             relatedBy:NSLayoutRelationEqual
                             toItem:self.destinationIV
                             attribute:NSLayoutAttributeHeight
                             multiplier:0.2
                             constant:0.0]];
        
        // Go Button Position: Bottom right corner
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.goButton
                             attribute:NSLayoutAttributeRight
                             relatedBy:NSLayoutRelationEqual
                             toItem:self.destinationIV
                             attribute:NSLayoutAttributeRight
                             multiplier:1.0
                             constant:-10.0]];
        
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.goButton
                             attribute:NSLayoutAttributeBottom
                             relatedBy:NSLayoutRelationEqual
                             toItem:self.destinationIV
                             attribute:NSLayoutAttributeBottom
                             multiplier:1.0
                             constant:-5.0]];
        
        // Go AI Size
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.goActivityIndicator
                             attribute:NSLayoutAttributeWidth
                             relatedBy:NSLayoutRelationEqual
                             toItem:self.destinationIV
                             attribute:NSLayoutAttributeWidth
                             multiplier:0.15
                             constant:0.0]];
        
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.goActivityIndicator
                             attribute:NSLayoutAttributeHeight
                             relatedBy:NSLayoutRelationEqual
                             toItem:self.destinationIV
                             attribute:NSLayoutAttributeHeight
                             multiplier:0.2
                             constant:0.0]];
        
        // Go AI Position: Bottom right corner
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.goActivityIndicator
                             attribute:NSLayoutAttributeRight
                             relatedBy:NSLayoutRelationEqual
                             toItem:self.destinationIV
                             attribute:NSLayoutAttributeRight
                             multiplier:1.0
                             constant:-10.0]];
        
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.goActivityIndicator
                             attribute:NSLayoutAttributeBottom
                             relatedBy:NSLayoutRelationEqual
                             toItem:self.destinationIV
                             attribute:NSLayoutAttributeBottom
                             multiplier:1.0
                             constant:-5.0]];
        
    }
    return self;
}


@end

