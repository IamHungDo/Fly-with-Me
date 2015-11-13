//
//  UIView+AutoLayoutView.m
//  FlyWithMe
//
//  Created by Luke on 11/7/15.
//  Copyright © 2015 Hung Do. All rights reserved.
//

#import "UIView+AutoLayoutView.h"

@implementation UIView (AutoLayoutView)

+ (id)newAutoLayoutView
{
    UIView *view = [self new];
    [view setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    return view;
}

@end
