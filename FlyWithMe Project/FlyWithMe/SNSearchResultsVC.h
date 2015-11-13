//
//  SNSearchResultsVC.h
//  FlyWithMe
//
//  Created by Luke on 11/7/15.
//  Copyright © 2015 Hung Do. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SNDashboardTVCell.h"
#import "SNUserProfile.h"

@interface SNSearchResultsVC : UIViewController<UITableViewDataSource,UITableViewDelegate,SNDashboardTVCellDelegate>

@property (strong, nonatomic) NSMutableArray *allArray;
@property (strong, nonatomic) SNUserProfile *userProfile;

@end
