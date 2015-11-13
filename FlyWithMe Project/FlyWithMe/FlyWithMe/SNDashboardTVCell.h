//
//  SNDashboardTVCell.h
//  FlyWithMe
//
//  Created by Luke on 11/7/15.
//  Copyright © 2015 Hung Do. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  SNDashboardTVCell;

//@class MZTimerLabel;

@protocol SNDashboardTVCellDelegate<NSObject>

@end

@interface SNDashboardTVCell : UITableViewCell

@property (strong, nonatomic) UILabel *departureTitle;
@property (strong, nonatomic) UILabel *departureTime;
@property (strong, nonatomic) UILabel *arrivalTitle;
@property (strong, nonatomic) UILabel *arrivalTime;

@property (strong, nonatomic) UILabel *middleLayover;
@property (strong, nonatomic) UILabel *middleInfo;

//User Section
@property (strong, nonatomic) UILabel *timeInfo;
@property (strong, nonatomic) UILabel *priceLabel;
@property (strong, nonatomic) UILabel *infoLabel;
@property (strong, nonatomic) UIImageView *iv1;
@property (strong, nonatomic) UIImageView *iv2;
@property (strong, nonatomic) UIImageView *iv3;
@property (strong, nonatomic) UIImageView *iv4;

@property (weak) id<SNDashboardTVCellDelegate> delegate;

@end
