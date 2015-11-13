//
//  SNSearchResultsVC.m
//  FlyWithMe
//
//  Created by Luke on 11/7/15.
//  Copyright © 2015 Hung Do. All rights reserved.
//

#import "SNSearchResultsVC.h"
#import "QuartzCore/QuartzCore.h"
#import "SNFlightInfo.h"
#import "SNPersonaVC.h"

@interface SNSearchResultsVC ()

@property (strong, nonatomic) UIButton *personaButton;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicator;
//@property NSMutableArray *allArray;
@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@property (strong, nonatomic) UIButton *infoLabel;

@end

@implementation SNSearchResultsVC

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.title = @"Flights";
    //NSLog(@"table view size: %lu", [self.allArray count]);
    self.view.backgroundColor = [UIColor whiteColor];
    
    UINavigationBar *navBar = [[UINavigationBar alloc] init];
    navBar.frame = CGRectMake(0, 0, self.view.frame.size.width, 64);
    navBar.backgroundColor = [UIColor whiteColor];
    UINavigationItem *navItem = [[UINavigationItem alloc] init];
    navItem.title = @"Flights";
    navBar.items = @[ navItem ];
    [[UINavigationBar appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor orangeColor]}];
    [self.view addSubview:navBar];
    
    //NavBar background color:
    self.navigationController.navigationBar.barTintColor=[UIColor whiteColor];
    //NavBar tint color for elements:
    self.navigationController.navigationBar.tintColor=[UIColor orangeColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor orangeColor]}];
    
    
    self.dateFormatter = [[NSDateFormatter alloc]init];
    [self.dateFormatter setDateFormat:@"MMM dd, hh a, yyyy"];
    
    [self setupViews];
    
    //[self updateDataSource];
    
    [self.tableView reloadData];
}

#pragma mark - Set Up Views
-(void)setupViews
{
    //if array zero, display no reservation yet
    //Info Label
    self.infoLabel = [[UIButton alloc] init];
    self.infoLabel.frame = CGRectMake(0, 64, self.view.frame.size.width, 68);
    //self.infoLabel.textAlignment = NSTextAlignmentCenter;
    //self.infoLabel.textColor = [UIColor whiteColor];
    self.infoLabel.backgroundColor = [UIColor orangeColor];
    //self.infoLabel.font = [UIFont systemFontOfSize:16];
    [self.infoLabel setTitle:@"Feeling Lucky?" forState:UIControlStateNormal];
    [self.infoLabel addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.infoLabel];
    
    //Table View
    self.tableView = [[UITableView alloc] init];
    self.tableView.frame = CGRectMake (20, 132, self.view.frame.size.width-40,self.view.frame.size.height - 132);
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    //self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.tableView setSeparatorColor:[UIColor lightGrayColor]];
    self.tableView.layer.borderWidth = 1.0;
    self.tableView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [self.view addSubview:self.tableView];
    
    [self.view bringSubviewToFront:self.activityIndicator];
    self.activityIndicator.center = self.tableView.center;
    
}

#pragma mark - Update Data
//-(void)updateDataSource
//{
//    self.activityIndicator.hidden = NO;
//    [self.activityIndicator startAnimating];
//    
//    self.allArray = [[NSMutableArray alloc] init];
//
//    if (self.allArray.count == 0)
//    {
//        self.infoLabel.text = @"Feeling lucky?";
//    } else
//    {
//        self.infoLabel.text = @"Your Flights";
//    }
//}

#pragma mark - Memory Warning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark - Table View Related
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return [self.allArray count];
    return 2;
}

// Set row height
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identitifier = @"viewIdentifier";
    
    SNFlightInfo *flightInfo = [self.allArray objectAtIndex:indexPath.row];
    
    SNDashboardTVCell *cell = (SNDashboardTVCell *)[tableView dequeueReusableCellWithIdentifier:identitifier];
    
    if (cell == nil) {
        cell = [[SNDashboardTVCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identitifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor whiteColor];
    
    cell.departureTitle.text = @"Departure";
    cell.departureTime.textAlignment = NSTextAlignmentCenter;
    cell.departureTitle.textColor = [UIColor grayColor];
    cell.departureTime.text = flightInfo.flightDateTime;
    cell.departureTime.font = [UIFont systemFontOfSize:24];
    cell.departureTitle.textAlignment = NSTextAlignmentCenter;
    cell.arrivalTitle.text = @"Arrival";
    cell.arrivalTitle.textColor = [UIColor grayColor];
    cell.arrivalTitle.textAlignment = NSTextAlignmentCenter;
    if (indexPath.row == 0) {
        cell.arrivalTime.text = @"11:12";
        //cell.backgroundColor = [UIColor lightGrayColor];
    }
    if (indexPath.row == 1) {
        cell.arrivalTime.text = @"21.12";
    }
    cell.arrivalTime.font = [UIFont systemFontOfSize:24];
    cell.arrivalTime.textAlignment = NSTextAlignmentCenter;
    cell.timeInfo.text = flightInfo.duration;
    cell.timeInfo.font = [UIFont systemFontOfSize:14];
    cell.timeInfo.textColor = [UIColor grayColor];
    cell.timeInfo.textAlignment = NSTextAlignmentCenter;
    cell.priceLabel.text = [NSString stringWithFormat:@"%@", flightInfo.flightFare];
    cell.priceLabel.font = [UIFont boldSystemFontOfSize:20];
    cell.priceLabel.textColor = [UIColor orangeColor];
    cell.priceLabel.textAlignment = NSTextAlignmentCenter;
    if (indexPath.row == 0) {
        cell.infoLabel.text = @"Entertainment";
    }
    if (indexPath.row == 1) {
        cell.infoLabel.text = @"Special Drinks";
        cell.infoLabel.textColor = [UIColor redColor];
    }
    cell.infoLabel.textAlignment = NSTextAlignmentCenter;
    cell.infoLabel.textColor = [UIColor orangeColor];
    //cell.iv4.image = [UIImage imageNamed:@"taxfree.png"];
    //cell.iv4.contentMode = UIViewContentModeCenter;
    //NSDictionary *layovers = flightInfo.transitions;
    //if (layovers) {
    //    cell.middleLayover.text = layovers[@"TransitsStation"];
    //}else{
    //    cell.middleLayover.text = @"None";
   // }
    cell.middleLayover.textAlignment = NSTextAlignmentCenter;
    cell.middleLayover.font = [UIFont systemFontOfSize:16];
    cell.middleInfo.text = @"";
    cell.middleInfo.font = [UIFont systemFontOfSize:14];
    cell.middleInfo.textAlignment = NSTextAlignmentCenter;


    return cell;
    
}

-(void)buttonTapped
{
    SNPersonaVC *vc        = [[SNPersonaVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
