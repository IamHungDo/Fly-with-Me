//
//  SNTravelVC.m
//  FlyWithMe
//
//  Created by Luke on 11/8/15.
//  Copyright © 2015 Hung Do. All rights reserved.
//

//
//  SNTravelVC.m
//  HotelBuddy
//
//  Created by Yuyu Peng on 4/6/15.
//  Copyright (c) 2015 Snap Group, LLC. All rights reserved.
//


#import "SNTravelVC.h"
#import "SNTravelTVCell.h"

@interface SNTravelVC ()

@property UISegmentedControl *segmentedControl;
@property UIActivityIndicatorView *activityIndicator;
@property UITableView *tableView;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@property NSMutableArray *allArray;
@property NSMutableArray *showArray;
//Sort by date etc
@property NSMutableArray *sortedArray;

@end

@implementation SNTravelVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Trips";
    self.view.backgroundColor = [UIColor orangeColor];
    
    self.dateFormatter = [[NSDateFormatter alloc]init];
    [self.dateFormatter setDateFormat:@"MMM dd , yyyy"];
    
    [self setupViews];
    
    //NavBar background color:
    self.navigationController.navigationBar.barTintColor=[UIColor whiteColor];
    //NavBar tint color for elements:
    self.navigationController.navigationBar.tintColor=[UIColor orangeColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor orangeColor]}];
    
}

- (void) setupViews
{
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    //***************** NAV BAR BEGIN *****************************//
    UINavigationBar *navBar = [[UINavigationBar alloc] init];
    navBar.frame = CGRectMake(0, 0, self.view.frame.size.width, 64);
    navBar.backgroundColor = [UIColor whiteColor];
    UINavigationItem *navItem = [[UINavigationItem alloc] init];
    navItem.title = @"Travel";
    navBar.items = @[ navItem ];
    [[UINavigationBar appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor orangeColor]}];
    [navBar setTintColor:[UIColor orangeColor]];
    [self.view addSubview:navBar];
    //***************** NAV BAR END ******************************//
    
    
    // ****************** INDICATOR VIEW BEGIN *********************** //
    self.activityIndicator= [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    //    self.activityIndicator.frame = CGRectMake(100, 200, 100, 100);
    //    self.activityIndicator.backgroundColor = [UIColor redColor];
    //self.activityIndicator.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2);
    self.activityIndicator.color = [UIColor blueColor];
    [self.view addSubview:self.activityIndicator];
    [self.activityIndicator startAnimating];
    [self.activityIndicator stopAnimating];
    // ****************** INDICATOR VIEW END *********************** //
    
    
    // ****************** TABLE VIEW BEGIN *********************** //
    float tableX = 0;
    float tableY = 64;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(tableX, tableY, screenWidth, screenHeight-64)];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView setAllowsSelection:YES];
    self.tableView.userInteractionEnabled = YES;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.tableView setSeparatorColor:[UIColor blackColor]];
    [self.view addSubview:self.tableView];
    // ****************** TABLE VIEW END *********************** //
    
    [self.view bringSubviewToFront:self.activityIndicator];
    self.activityIndicator.center = self.tableView.center;
    
}



#pragma mark - Table View Methods

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

// Set row height
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 350;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identitifier = @"tableViewIdentifier";
    
    SNTravelTVCell *cell = (SNTravelTVCell *)[tableView dequeueReusableCellWithIdentifier:identitifier];
    
    if (cell == nil) {
        cell = [[SNTravelTVCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identitifier];
    }
    
    cell.backgroundColor = [UIColor whiteColor];
    
    
    if (indexPath.row == 0) {
        cell.destinationIV.image = [UIImage imageNamed:@"Sahara.jpg"];
        cell.destinationName.text = @"Desert Adventure";
        cell.destinationLocation.text = @"$200";
        cell.startDate.text = @"Sahara";
        cell.endDate.text = @"2 Days";
    }
    
    if (indexPath.row == 1) {
        cell.destinationIV.image = [UIImage imageNamed:@"NightTour.jpg"];
        cell.destinationName.text = @"Dubai Nightlife";
        cell.destinationLocation.text = @"$50";
        cell.startDate.text = @"City Center";
        cell.endDate.text = @"1 night";
    }
    
    if (indexPath.row == 2) {
        cell.destinationIV.image = [UIImage imageNamed:@"waterpark.jpg"];
        cell.destinationName.text = @"Happyland Park";
        cell.destinationLocation.text = @"$180";
        cell.startDate.text = @"Downtown";
        cell.endDate.text = @"1 Day";
    }
    
    if (indexPath.row == 3) {
        cell.destinationIV.image = [UIImage imageNamed:@"hawaii.jpeg"];
        cell.destinationName.text = @"Beach And Chill";
        cell.destinationLocation.text = @"$40";
        cell.startDate.text = @"Labla Beach";
        cell.endDate.text = @"1 Day";
    }
    
    if (indexPath.row == 4) {
        cell.destinationIV.image = [UIImage imageNamed:@"zoo.jpg"];
        cell.destinationName.text = @"Wildlife Adventure";
        cell.destinationLocation.text = @"$160";
        cell.startDate.text = @"Suburban";
        cell.endDate.text = @"1 Day";
    }
    
    if (indexPath.row == 5) {
        cell.destinationIV.image = [UIImage imageNamed:@"museum.jpg"];
        cell.destinationName.text = @"History Flashback";
        cell.destinationLocation.text = @"$50";
        cell.startDate.text = @"East Asia Museum";
        cell.endDate.text = @"6 Hours";
    }
    
    if (indexPath.row == 6) {
        cell.destinationIV.image = [UIImage imageNamed:@"CityTour.jpg"];
        cell.destinationName.text = @"City Culture Explore";
        cell.destinationLocation.text = @"$80";
        cell.startDate.text = @"Dubai";
        cell.endDate.text = @"4 Hours";
    }
    
    cell.favoriteButton.tag = indexPath.row;
    [cell.favoriteButton addTarget:self action:@selector(favoriteButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.goButton.tag = indexPath.row;
    [cell.goButton addTarget:self action:@selector(goButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end


