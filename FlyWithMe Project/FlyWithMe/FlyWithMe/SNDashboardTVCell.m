//
//  SNDashboardTVCell.m
//  FlyWithMe
//
//  Created by Luke on 11/7/15.
//  Copyright © 2015 Hung Do. All rights reserved.
//

#import "SNDashboardTVCell.h"
#import "UIView+AutoLayoutView.h"

@implementation SNDashboardTVCell

@synthesize departureTitle = _departureTitle;
@synthesize departureTime = _departureTime;
@synthesize arrivalTitle = _arrivalTitle;
@synthesize arrivalTime = _arrivalTime;
@synthesize middleLayover = _middleLayover;
@synthesize middleInfo = _middleInfo;
@synthesize iv1 = _iv1;
@synthesize iv2 = _iv2;
@synthesize iv3 = _iv3;
@synthesize iv4 = _iv4;
@synthesize timeInfo = _timeInfo;
@synthesize priceLabel = _priceLabel;
@synthesize infoLabel = _infoLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.middleLayover = [UILabel newAutoLayoutView];
        [self addSubview:self.middleLayover];
        
        self.middleInfo = [UILabel newAutoLayoutView];
        [self addSubview:self.middleInfo];
        
        self.infoLabel = [UILabel newAutoLayoutView];
        [self addSubview:self.infoLabel];
        
        self.timeInfo = [UILabel newAutoLayoutView];
        [self addSubview:self.timeInfo];
        
        self.priceLabel = [UILabel newAutoLayoutView];
        [self addSubview:self.priceLabel];
        
        self.departureTitle = [UILabel newAutoLayoutView];
        [self addSubview:self.departureTitle];
        
        self.departureTime = [UILabel newAutoLayoutView];
        [self addSubview:self.departureTime];
        
        self.arrivalTitle = [UILabel newAutoLayoutView];
        [self addSubview:self.arrivalTitle];
        
        self.arrivalTime = [UILabel newAutoLayoutView];
        [self addSubview:self.arrivalTime];
        
        self.iv1 = [UIImageView newAutoLayoutView];
        [self addSubview:self.iv1];
        
        self.iv2 = [UIImageView newAutoLayoutView];
        [self addSubview:self.iv2];
        
        self.iv3 = [UIImageView newAutoLayoutView];
        [self addSubview:self.iv3];
        
        self.iv4 = [UIImageView newAutoLayoutView];
        [self addSubview:self.iv4];
        
        //Views Auto Layout
        NSDictionary *viewsDictionary = @{@"middleInfo":self.middleInfo, @"middleLayover":self.middleLayover,  @"departureTitle":self.departureTitle,  @"arrivalTitle":self.arrivalTitle, @"departureTime":self.departureTime, @"arrivalTime":self.arrivalTime, @"iv1":self.iv1, @"iv2":self.iv2, @"iv3":self.iv3, @"iv4":self.iv4, @"priceLabel":self.priceLabel, @"timeInfo":self.timeInfo, @"infoLabel":self.infoLabel};
        
        NSDictionary *metrics = @{@"vSpace":@0, @"lSpace":@0, @"hSpace":@0};
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-vSpace-[departureTitle]-lSpace-[departureTime]-lSpace-[timeInfo]-lSpace-[infoLabel]-vSpace-|"
                                                                     options:NSLayoutFormatAlignAllLeft
                                                                     metrics:metrics
                                                                       views:viewsDictionary]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-vSpace-[arrivalTitle]-lSpace-[arrivalTime]-lSpace-[priceLabel]-lSpace-[infoLabel]-vSpace-|"
                                                                     options:NSLayoutFormatAlignAllRight
                                                                     metrics:metrics
                                                                       views:viewsDictionary]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpace-[departureTitle]-lSpace-[middleLayover]-lSpace-[arrivalTitle]-hSpace-|" options:NSLayoutFormatAlignAllTop metrics:metrics views:viewsDictionary]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpace-[departureTime]-lSpace-[middleInfo]-lSpace-[arrivalTime]-hSpace-|" options:NSLayoutFormatAlignAllTop metrics:metrics views:viewsDictionary]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpace-[timeInfo]-lSpace-[priceLabel]-hSpace-|" options:0 metrics:metrics views:viewsDictionary]];
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-hSpace-[infoLabel]-hSpace-|" options:0 metrics:metrics views:viewsDictionary]];
        
        //Height
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.arrivalTitle
                             attribute:NSLayoutAttributeHeight
                             relatedBy:NSLayoutRelationEqual
                             toItem:self
                             attribute:NSLayoutAttributeHeight
                             multiplier:0.2
                             constant:0.0]];
        
        
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.middleLayover
                             attribute:NSLayoutAttributeHeight
                             relatedBy:NSLayoutRelationEqual
                             toItem:self
                             attribute:NSLayoutAttributeHeight
                             multiplier:0.2
                             constant:0.0]];
        
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.departureTitle
                             attribute:NSLayoutAttributeHeight
                             relatedBy:NSLayoutRelationEqual
                             toItem:self
                             attribute:NSLayoutAttributeHeight
                             multiplier:0.2
                             constant:0.0]];
        
        
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.arrivalTime
                             attribute:NSLayoutAttributeHeight
                             relatedBy:NSLayoutRelationEqual
                             toItem:self
                             attribute:NSLayoutAttributeHeight
                             multiplier:0.3
                             constant:0.0]];
        
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.middleInfo
                             attribute:NSLayoutAttributeHeight
                             relatedBy:NSLayoutRelationEqual
                             toItem:self
                             attribute:NSLayoutAttributeHeight
                             multiplier:0.3
                             constant:0.0]];
        
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.departureTime
                             attribute:NSLayoutAttributeHeight
                             relatedBy:NSLayoutRelationEqual
                             toItem:self
                             attribute:NSLayoutAttributeHeight
                             multiplier:0.3
                             constant:0.0]];
        
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.timeInfo
                             attribute:NSLayoutAttributeHeight
                             relatedBy:NSLayoutRelationEqual
                             toItem:self
                             attribute:NSLayoutAttributeHeight
                             multiplier:0.3
                             constant:0.0]];
        
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.priceLabel
                             attribute:NSLayoutAttributeHeight
                             relatedBy:NSLayoutRelationEqual
                             toItem:self
                             attribute:NSLayoutAttributeHeight
                             multiplier:0.3
                             constant:0.0]];
        
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.infoLabel
                             attribute:NSLayoutAttributeHeight
                             relatedBy:NSLayoutRelationEqual
                             toItem:self
                             attribute:NSLayoutAttributeHeight
                             multiplier:0.2
                             constant:0.0]];
        
        
        //Width
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.departureTitle
                             attribute:NSLayoutAttributeWidth
                             relatedBy:NSLayoutRelationEqual
                             toItem:self
                             attribute:NSLayoutAttributeWidth
                             multiplier:0.4
                             constant:0.0]];
        
        
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.departureTime
                             attribute:NSLayoutAttributeWidth
                             relatedBy:NSLayoutRelationEqual
                             toItem:self
                             attribute:NSLayoutAttributeWidth
                             multiplier:0.4
                             constant:0.0]];
        
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.arrivalTime
                             attribute:NSLayoutAttributeWidth
                             relatedBy:NSLayoutRelationEqual
                             toItem:self
                             attribute:NSLayoutAttributeWidth
                             multiplier:0.4
                             constant:0.0]];
        
        
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.arrivalTitle
                             attribute:NSLayoutAttributeWidth
                             relatedBy:NSLayoutRelationEqual
                             toItem:self
                             attribute:NSLayoutAttributeWidth
                             multiplier:0.4
                             constant:0.0]];
        
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.middleInfo
                             attribute:NSLayoutAttributeWidth
                             relatedBy:NSLayoutRelationEqual
                             toItem:self
                             attribute:NSLayoutAttributeWidth
                             multiplier:0.2
                             constant:0.0]];
        
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.middleLayover
                             attribute:NSLayoutAttributeWidth
                             relatedBy:NSLayoutRelationEqual
                             toItem:self
                             attribute:NSLayoutAttributeWidth
                             multiplier:0.2
                             constant:0.0]];
        
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.timeInfo
                             attribute:NSLayoutAttributeWidth
                             relatedBy:NSLayoutRelationEqual
                             toItem:self
                             attribute:NSLayoutAttributeWidth
                             multiplier:0.6
                             constant:0.0]];
        
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.priceLabel
                             attribute:NSLayoutAttributeWidth
                             relatedBy:NSLayoutRelationEqual
                             toItem:self
                             attribute:NSLayoutAttributeWidth
                             multiplier:0.4
                             constant:0.0]];
        
        [self addConstraint:[NSLayoutConstraint
                             constraintWithItem:self.infoLabel
                             attribute:NSLayoutAttributeWidth
                             relatedBy:NSLayoutRelationEqual
                             toItem:self
                             attribute:NSLayoutAttributeWidth
                             multiplier:1
                             constant:0.0]];
        
    }
    return self;
}


@end
