//
//  SNPersonaVC.m
//  FlyWithMe
//
//  Created by Luke on 11/8/15.
//  Copyright © 2015 Hung Do. All rights reserved.
//

#import "SNPersonaVC.h"
#import "NMRangeSlider.h"
#import "SNTravelVC.h"

@interface SNPersonaVC ()

@property (strong, nonatomic) UIButton *dismissButton;
@property (strong, nonatomic) UIScrollView *scrollView;

@property (strong, nonatomic) UILabel *label1;
@property (strong, nonatomic) UILabel *value1;
@property (strong, nonatomic) UILabel *t1;
@property (strong, nonatomic) UIButton *iv1;
@property (strong, nonatomic) UIImageView *p1;
@property (strong, nonatomic) UISlider *slider1;
@property (strong, nonatomic) UISlider *slider2;
@property (strong, nonatomic) UIImageView *p2;
@property (strong, nonatomic) UILabel *value2;

@property (strong, nonatomic) UILabel *label2;
@property (strong, nonatomic) UIButton *iv2;

@end

@implementation SNPersonaVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat screenWidth  = self.view.frame.size.width;
    CGFloat screenHeight = self.view.frame.size.height;
    
    self.title = @"Only You";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //Scroll View
    float scrollStartY =  self.navigationController.navigationBar.frame.size.height;
    float scrollHeight = screenHeight - scrollStartY;
    float scrollContentHeight = 736;
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,scrollStartY, screenWidth, scrollHeight)];
    //self.scrollView.backgroundColor = [UIColor colorWithRed:235/255.0f green:235/255.0f blue:241/255.0f alpha:1.0];
    self.scrollView.backgroundColor = [UIColor whiteColor];
    self.scrollView.scrollEnabled = YES;
    self.scrollView.showsVerticalScrollIndicator = YES;
    self.scrollView.contentSize = CGSizeMake(screenWidth, scrollContentHeight);
    [self.view addSubview:self.scrollView];
    
    CGFloat Y1 = 0;
    CGFloat H1 = 150;
    self.p1 = [[UIImageView alloc]init];
    self.p1.frame = CGRectMake(screenWidth/2-75, Y1, 150, H1);
    self.p1.contentMode = UIViewContentModeScaleAspectFit;
    self.p1.image = [UIImage imageNamed:@"Adventurer.png"];
    [self.scrollView addSubview:self.p1];
    
    CGFloat Y20 = Y1+H1;
    CGFloat H20 = 50;
    self.t1 = [[UILabel alloc]init];
    self.t1.frame = CGRectMake(0, Y20, screenWidth, H20);
    self.t1.text = @"";
    self.t1.textAlignment = NSTextAlignmentCenter;
    self.t1.textColor = [UIColor orangeColor];
    self.t1.font = [UIFont systemFontOfSize:18];
    [self.scrollView addSubview:self.t1];
    
    CGFloat Y2 = Y20+H20;
    CGFloat H2 = 60;
    self.label1 = [[UILabel alloc] init];
    self.label1.frame = CGRectMake(0, Y2, self.view.frame.size.width, H2);
    self.label1.textAlignment = NSTextAlignmentCenter;
    self.label1.textColor = [UIColor orangeColor];
    self.label1.font = [UIFont boldSystemFontOfSize:24];
    self.label1.text = @"Adventurous Index";
    [self.scrollView addSubview:self.label1];
    
//    //******************** SLIDER BEGIN ************************//
    int sliderHeight = 50;
    int sliderWidth = 270;
    int sliderStartY = 80;
    CGFloat Y3 = Y2+H2;
    CGFloat H3 = 50;
    CGRect frame = CGRectMake(30, Y3, sliderWidth, H3);
    self.slider1 = [[UISlider alloc] initWithFrame:frame];
    [self.slider1 addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    [self.slider1 setBackgroundColor:[UIColor clearColor]];
    self.slider1.minimumValue = 0.0;
    self.slider1.maximumValue = 1;
    self.slider1.continuous = YES;
    self.slider1.value = 1.0;
    [self.scrollView addSubview:self.slider1];
    
    CGFloat Y4 = Y3+H3;
    CGFloat H4 = 50;
    self.iv1 = [[UIButton alloc]init];
    self.iv1.frame = CGRectMake(80, Y4, self.view.frame.size.width-160, H4);
    [self.iv1 setImage:[UIImage imageNamed:@"adventure.png"] forState:UIControlStateNormal];
    [self.iv1 addTarget:self action:@selector(adTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:self.iv1];
    
    
    CGFloat Y5 = Y4+H4+100;
    CGFloat H5 = 150;
    self.p2 = [[UIImageView alloc]init];
    self.p2.frame = CGRectMake(screenWidth/2-75, Y5, 150, H5);
    self.p2.contentMode = UIViewContentModeScaleAspectFit;
    self.p2.image = [UIImage imageNamed:@"loved.png"];
    [self.scrollView addSubview:self.p2];
    
    
    CGFloat Y6 = Y5+H5;
    CGFloat H6 = 60;
    self.label2 = [[UILabel alloc] init];
    self.label2.frame = CGRectMake(0, Y6, self.view.frame.size.width, H6);
    self.label2.textAlignment = NSTextAlignmentCenter;
    self.label2.textColor = [UIColor orangeColor];
    self.label2.font = [UIFont boldSystemFontOfSize:28];
    self.label2.text = @"Loving Index";
    [self.scrollView addSubview:self.label2];
    
    //    //******************** SLIDER BEGIN ************************//
    int sliderStartY2 = Y6+H6;
    CGRect frame2 = CGRectMake(30, sliderStartY2, sliderWidth, sliderHeight);
    self.slider2 = [[UISlider alloc] initWithFrame:frame2];
    [self.slider2 addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    [self.slider2 setBackgroundColor:[UIColor clearColor]];
    self.slider2.minimumValue = 0.0;
    self.slider2.maximumValue = 1.0;
    self.slider2.continuous = YES;
    self.slider2.value = 1.0;
    [self.scrollView addSubview:self.slider2];
    
    CGFloat H8 = sliderStartY2+sliderHeight;
    self.iv2 = [[UIButton alloc]init];
    self.iv2.frame = CGRectMake(80, H8, self.view.frame.size.width-160, 50);
    [self.iv2 setImage:[UIImage imageNamed:@"love_icon.png"] forState:UIControlStateNormal];
    [self.iv2 addTarget:self action:@selector(loveTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:self.iv2];
    
    //NavBar background color:
    self.navigationController.navigationBar.barTintColor=[UIColor whiteColor];
    //NavBar tint color for elements:
    self.navigationController.navigationBar.tintColor=[UIColor orangeColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor orangeColor]}];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dismissButtonTapped
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)sliderAction:(id)sender
{
    //UISlider *slider = (UISlider*)sender;
    float value = self.slider1.value;
    NSString *s1 = [NSString stringWithFormat:@"%.02f",value];
    self.label1.text = [NSString stringWithFormat: @"Adventurous Index: %@", s1];
    
    if (self.slider1.value < 0.5) {
        self.p1.image = [UIImage imageNamed:@"museum.jpg"];
        self.t1.text = @"Museam Tour";
        self.p1.contentMode = UIViewContentModeScaleAspectFill;
        self.p1.clipsToBounds = YES;
        self.p1.backgroundColor = [UIColor clearColor];
        CALayer *imageLayer = self.p1.layer;
        [imageLayer setCornerRadius:150*0.5];
        [imageLayer setBorderWidth:2.0];
        [imageLayer setBorderColor:[UIColor whiteColor].CGColor];
        imageLayer.shadowColor = [UIColor purpleColor].CGColor;
        imageLayer.shadowOffset = CGSizeMake(0,1);
        imageLayer.shadowOpacity = 1.0;
        imageLayer.shadowRadius = 1.0;
        [self.scrollView addSubview:self.p1];
        [self.scrollView addSubview:self.t1];
    } else
    {
        self.p1.image = [UIImage imageNamed:@"Sahara.jpg"];
        self.t1.text = @"2 Days Desert Tour";
        self.p1.contentMode = UIViewContentModeScaleAspectFill;
        self.p1.clipsToBounds = YES;
        self.p1.backgroundColor = [UIColor clearColor];
        CALayer *imageLayer = self.p1.layer;
        [imageLayer setCornerRadius:150*0.5];
        [imageLayer setBorderWidth:2.0];
        [imageLayer setBorderColor:[UIColor whiteColor].CGColor];
        imageLayer.shadowColor = [UIColor purpleColor].CGColor;
        imageLayer.shadowOffset = CGSizeMake(0,1);
        imageLayer.shadowOpacity = 1.0;
        imageLayer.shadowRadius = 1.0;
        [self.scrollView addSubview:self.p1];
        [self.scrollView addSubview:self.t1];
    }
    
    float value2 = self.slider2.value;
    NSString *s2 = [NSString stringWithFormat:@"%.02f",value2];
    self.label2.text = [NSString stringWithFormat: @"Loving Index: %@", s2];
}

-(void)adTapped
{
    if (self.slider1.value < 0.5) {
        NSArray *viewsArray = [self.navigationController viewControllers];
        UIViewController *chosenView = [viewsArray objectAtIndex:2];
        [self.navigationController popToViewController:chosenView animated:YES];
        
    } else
    {
    SNTravelVC *vc = [[SNTravelVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    }
}

-(void)loveTapped
{
    if (self.slider1.value > 0.5) {
        NSArray *viewsArray = [self.navigationController viewControllers];
        UIViewController *chosenView = [viewsArray objectAtIndex:2];
        [self.navigationController popToViewController:chosenView animated:YES];
    } else
    {
        SNTravelVC *vc = [[SNTravelVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


@end
