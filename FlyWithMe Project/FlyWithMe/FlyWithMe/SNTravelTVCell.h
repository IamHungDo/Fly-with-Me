//
//  SNTravelTVCell.h
//  HotelBuddy
//
//  Created by Yuyu Peng on 4/8/15.
//  Copyright (c) 2015 Snap Group, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SNTravelTVCell;

@protocol SNTravelTVCellDelegate <NSObject>

@end

@interface SNTravelTVCell : UITableViewCell

//Destination Image View
@property (strong, nonatomic) UIImageView *destinationIV;

//Destination Info
@property (strong, nonatomic) UILabel *destinationName;
@property (strong, nonatomic) UILabel *destinationLocation;
@property (strong, nonatomic) UILabel *startDate;
@property (strong, nonatomic) UILabel *endDate;
@property (strong, nonatomic) UIButton *goButton;
@property (strong, nonatomic) UIButton *favoriteButton;

@property (strong, nonatomic) UIActivityIndicatorView *favoriteActivityIndicator;
@property (strong, nonatomic) UIActivityIndicatorView *goActivityIndicator;

@property (weak) id<SNTravelTVCellDelegate> delegate;

@end
