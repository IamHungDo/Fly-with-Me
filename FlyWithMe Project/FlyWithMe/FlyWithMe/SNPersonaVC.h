//
//  SNPersonaVC.h
//  FlyWithMe
//
//  Created by Luke on 11/8/15.
//  Copyright © 2015 Hung Do. All rights reserved.
//

#import <UIKit/UIKit.h>


@class NMRangeSlider;

@interface SNPersonaVC : UIViewController


//****** Slider *******//
@property (retain, nonatomic) NMRangeSlider *labelSlider;
@property (retain, nonatomic) UILabel *lowerLabel;
@property (retain, nonatomic) UILabel *upperLabel;

- (void)labelSliderChanged:(NMRangeSlider*)sender;


@end
