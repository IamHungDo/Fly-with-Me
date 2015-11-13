//
//  SNProfileVC.m
//  FlyWithMe
//
//  Created by Luke on 11/7/15.
//  Copyright © 2015 Hung Do. All rights reserved.
//

#import "SNProfileVC.h"
#import "AFHTTPRequestOperationManager.h"
#import "MBProgressHUD.h"
#import "AppDelegate.h"
#import "SNSearchResultsVC.h"
#import "SNFlightInfo.h"
#import "SNTravelVC.h"

@interface SNProfileVC ()

@property (strong, nonatomic) UIImageView *iv;
@property (strong, nonatomic) UIScrollView   *scrollView;
@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UISearchBar *searchBar;
@property (strong, nonatomic) UISearchBar *searchBar2;
@property (nonatomic, strong) PMCalendarController *pmCC;
@property (nonatomic, strong) UIButton *dateButton;
@property (strong, nonatomic) UILabel *arriveTitle;
@property (strong, nonatomic) UILabel *departTitle;
@property (strong, nonatomic) UILabel *arriveDate;
@property (strong, nonatomic) UILabel *departDate;
@property (strong, nonatomic) UIButton *button;
@property (strong, nonatomic) UIButton *button2;

@end

@implementation SNProfileVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userName = self.userProfile.userName;
    self.title = @"Fly With Me";
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    CGFloat navHeight = self.navigationController.navigationBar.frame.size.height;
    
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"map.png"]];
    
    //NavBar background color:
    self.navigationController.navigationBar.barTintColor=[UIColor whiteColor];
    //NavBar tint color for elements:
    self.navigationController.navigationBar.tintColor=[UIColor orangeColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor orangeColor]}];
    
    //Scroll View
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,navHeight, screenWidth, screenHeight-navHeight+70)];
    self.scrollView.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"map.png"]];
    self.scrollView.scrollEnabled = YES;
    self.scrollView.showsVerticalScrollIndicator = YES;
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height*3);
    [self.view addSubview:self.scrollView];
    
    //Search Bar
    float searchBarY = 84;
    float searchBarHeight = 80;
    self.searchBar = [[UISearchBar alloc]init];
    self.searchBar.frame = CGRectMake(20, searchBarY, screenWidth/2-20, searchBarHeight);
    self.searchBar.delegate = self;
    self.searchBar.backgroundColor = [UIColor whiteColor];
    self.searchBar.tintColor = [UIColor orangeColor];
    self.searchBar.showsCancelButton = NO;
    self.searchBar.showsSearchResultsButton = YES;
    [self.searchBar setPlaceholder:@"SFO"];
    [self.view addSubview:self.searchBar];
    
    self.searchBar2 = [[UISearchBar alloc]init];
    self.searchBar2.frame = CGRectMake(screenWidth/2, searchBarY, screenWidth/2-20, searchBarHeight);
    self.searchBar2.delegate = self;
    self.searchBar2.backgroundColor = [UIColor whiteColor];
    self.searchBar2.tintColor = [UIColor orangeColor];
    self.searchBar2.showsCancelButton = NO;
    self.searchBar2.showsSearchResultsButton = YES;
    [self.searchBar2 setPlaceholder:@"To        "];
    [self.view addSubview:self.searchBar2];
    
    UIGestureRecognizer *tap = [[UIGestureRecognizer alloc]init];
    [tap addTarget:self action:@selector(showCalendar:)];
    
//    self.label = [[UILabel alloc]init];
//    self.label.frame = CGRectMake(20, searchBarY+100, screenWidth/2-60, searchBarHeight);
//    self.label.backgroundColor = [UIColor redColor];
//    [self.view addSubview:self.label];
//    [self.label addGestureRecognizer:tap];
    
    
    
//    self.arriveTitle = [UILabel newAutoLayoutView];
//    self.arriveTitle.text = @"Arrive";
//    self.arriveTitle.textColor = [UIColor blackColor];
//    self.arriveTitle.textAlignment = NSTextAlignmentCenter;
//    self.arriveTitle.font = [UIFont boldSystemFontOfSize:16];
//    self.arriveTitle.userInteractionEnabled = YES;
//    UITapGestureRecognizer *tap1 =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showCalendar:)];
//    [self.arriveTitle addGestureRecognizer:tap1];
//    [self.view addSubview:self.arriveTitle];
//    
//    self.departTitle = [UILabel newAutoLayoutView];
//    self.departTitle.text = @"Depart";
//    self.departTitle.textColor = [UIColor blackColor];
//    self.departTitle.textAlignment = NSTextAlignmentCenter;
//    self.departTitle.font = [UIFont boldSystemFontOfSize:16];
//    self.departTitle.userInteractionEnabled = YES;
//    UITapGestureRecognizer *tap2 =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showCalendar:)];
//    [self.departTitle addGestureRecognizer:tap2];
//    [self.view addSubview:self.departTitle];
    
    self.arriveDate = [[UILabel alloc] init];
    self.arriveDate.frame =  CGRectMake(20, searchBarY+200, screenWidth/2-60, searchBarHeight);
    self.arriveDate.text = @"Arrival";
    self.arriveDate.textAlignment = NSTextAlignmentCenter;
    self.arriveDate.font = [UIFont boldSystemFontOfSize:18];
    self.arriveDate.textColor = [UIColor orangeColor];
    self.arriveDate.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap3 =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showCalendar:)];
    [self.arriveDate addGestureRecognizer:tap3];
    [self.view addSubview:self.arriveDate];
    
    self.departDate = [[UILabel alloc]init];
    self.departDate.frame = CGRectMake(screenWidth/2, searchBarY+200, screenWidth/2-60, searchBarHeight);
    self.departDate.text = @"Departure";
    self.departDate.textAlignment = NSTextAlignmentCenter;
    self.departDate.font = [UIFont boldSystemFontOfSize:18];
    self.departDate.textColor = [UIColor orangeColor];
    self.departDate.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap4 =  [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showCalendar:)];
    [self.departDate addGestureRecognizer:tap4];
    [self.view addSubview:self.departDate];

    
    //*************** DATE BUTTON VIEW BEGIN ***************//
    self.dateButton = [[UIButton alloc]init];
    self.dateButton.frame = CGRectMake(screenWidth/2-40, searchBarY+200, 40, searchBarHeight);
    self.dateButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.dateButton.backgroundColor = [UIColor clearColor];
    [self.dateButton addTarget:self action:@selector(showCalendar:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.dateButton];
    //*************** DATE BUTTON VIEW BEGIN ***************//
    
    
    self.button = [[UIButton alloc]init];
    self.button.frame = CGRectMake(0, screenHeight-50, screenWidth, 50);
    [self.button setTitle:@"Search" forState:UIControlStateNormal];
    self.button.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.button.backgroundColor = [UIColor orangeColor];
    [self.button addTarget:self action:@selector(buttonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
    
    self.button2 = [[UIButton alloc]init];
    self.button2.frame = CGRectMake(0, screenHeight-100, screenWidth, 50);
    [self.button2 setTitle:@"Search" forState:UIControlStateNormal];
    self.button2.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.button2.backgroundColor = [UIColor greenColor];
    [self.button2 addTarget:self action:@selector(buttonTapped2) forControlEvents:UIControlEventTouchUpInside];
    //[self.view addSubview:self.button2];
    
    
//    self.iv = [[UIImageView alloc]init];
//    self.iv.frame = CGRectMake(60, 0, self.view.frame.size.width-120, self.view.frame.size.width-120);
//    self.iv.image = self.profileImage;
//    self.iv.contentMode = UIViewContentModeScaleAspectFill;
//    self.iv.clipsToBounds = YES;
//    self.iv.backgroundColor = [UIColor clearColor];
//    CALayer *imageLayer = self.iv.layer;
//    [imageLayer setCornerRadius:self.iv.frame.size.width*0.5];
//    [imageLayer setBorderWidth:2.0];
//    [imageLayer setBorderColor:[UIColor whiteColor].CGColor];
//    imageLayer.shadowColor = [UIColor purpleColor].CGColor;
//    imageLayer.shadowOffset = CGSizeMake(0,1);
//    imageLayer.shadowOpacity = 1.0;
//    imageLayer.shadowRadius = 1.0;
//    [self.scrollView addSubview:self.iv];
    
    //NSMutableDictionary *params = [NSMutableDictionary new];
    //NSString *API_BASE = @"http://flywithme.mybluemix.net/api/v1/twitter/";
    //NSString *userURL = [self.userName stringByAppendingString:
    //                     @"/"];
    //NSString *path = [API_BASE stringByAppendingString:userURL];
    NSString *path = [NSString stringWithFormat:@"http://flywithme.mybluemix.net/api/v1/twitter/%@/",self.userProfile.userName];
    NSLog(@"path: %@",path);
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        //NSLog(@"%@",responseObject[@"loveIndex"]);
        NSNumber *showAttractions = responseObject[@"showAttractions"];
        NSNumber *transfers = responseObject[@"transfers"];
        NSNumber *priceCare = responseObject[@"priceCare"];
        NSNumber *loveIndex = responseObject[@"loveIndex"];
        NSNumber *stability = responseObject[@"stability"];
        self.userProfile.showAttractions = [showAttractions isEqualToNumber:@1];
        self.userProfile.transfers = [transfers isEqualToNumber:@1];
        self.userProfile.priceCare = [priceCare isEqualToNumber:@1];
        self.userProfile.loveIndex = [loveIndex isEqualToNumber:@1];
        self.userProfile.stability = [stability isEqualToNumber:@1];
        
        NSLog(@"userProfile is: %@", self.userProfile);
        
        AppDelegate *appDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
        appDelegate.userProfile = self.userProfile;
        [appDelegate saveUserProfile:self.userProfile];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];

    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap1];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


#pragma mark - Show Calendar
- (void)showCalendar:(id)sender
{
    if ([self.pmCC isCalendarVisible])
    {
        [self.pmCC dismissCalendarAnimated:NO];
    }
    
    
    BOOL isPopover = YES;
    
    // limit calendar to current months and 12 months after current date
    PMPeriod *allowed = [PMPeriod periodWithStartDate:[[NSDate date] dateByAddingMonths:0]
                                              endDate:[[NSDate date] dateByAddingMonths:12]];
    
    self.pmCC = [[PMCalendarController alloc] initWithThemeName:@"default"];
    self.pmCC.allowedPeriod = allowed;
    
    self.pmCC.delegate = self;
    self.pmCC.mondayFirstDayOfWeek = NO;
    
    [self.pmCC presentCalendarFromView:self.dateButton
              permittedArrowDirections:PMCalendarArrowDirectionUp | PMCalendarArrowDirectionLeft
                             isPopover:isPopover
                              animated:YES];
    
    self.pmCC.period = [PMPeriod oneDayPeriodWithDate:[NSDate date]];
    [self calendarController:self.pmCC didChangePeriod:self.pmCC.period];
    
}


#pragma mark PMCalendarControllerDelegate methods

- (void)calendarController:(PMCalendarController *)calendarController didChangePeriod:(PMPeriod *)newPeriod
{
    self.arriveDate.text = [NSString stringWithFormat:@"%@", [newPeriod.startDate dateStringWithFormat:@"dd-MMM-yyyy"]];
    self.departDate.text = [NSString stringWithFormat:@"%@", [newPeriod.endDate dateStringWithFormat:@"dd-MMM-yyyy"]];
    
    //    if (newPeriod.startDate == newPeriod.endDate)
    //    {
    //        [[[UIAlertView alloc] initWithTitle:@"Select Dates" message:@"Please make sure arrival date is different from departure date" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Yes Sir!", nil] show];
    //    }
    
}

-(void)buttonTapped
{
    NSString *flightDate = self.arriveDate.text;
    //NSString *origin     = self.searchBar.text;
    NSString *origin = @"SFO";
    NSString *destination = self.searchBar2.text;
    NSString *class       = @"ECO";
    
    NSString *queryString = [NSString stringWithFormat:@"http://flywithme.mybluemix.net/api/v1/flightAvailability?flightDate=%@&origin=%@&destination=%@&class=%@",flightDate,origin,destination, class];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:queryString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"responseObject: %@",responseObject);
        
        //NSArray *flightAvailabilityList = responseObject[@"FlightAvailabilityList"];
        //NSLog(@"FlightAvailabilityList: %@",flightAvailabilityList);
        
        
        //NSArray *jsonDataArray = [[NSArray alloc] initWithArray:[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil]];
        
        //NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        
        NSMutableArray *flightInfoArray = [[NSMutableArray alloc]init];
        
        //NSMutableArray *flightInfoArray = [[NSMutableArray alloc]init];
        
        for (int i = 0; i < [responseObject count]; i++) {
            //NSDictionary *object = responseObject[i];
            
            [flightInfoArray addObject:[self flightInfoFromJson:responseObject[i]]];
            //NSLog(@"flightInfoArray[%i] = %@",i,flightInfoArray[i]);
        }
        
        [self sortArray:flightInfoArray];
        
        SNSearchResultsVC *vc = [[SNSearchResultsVC alloc]init];
        vc.userProfile = self.userProfile;
        vc.allArray = flightInfoArray;
        [self.navigationController pushViewController:vc animated:YES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        
    }];
}


-(SNFlightInfo *) flightInfoFromJson: (NSDictionary *) json
{
    SNFlightInfo *flightInfo = [[SNFlightInfo alloc]init];
    //flightInfo.dining = json[@"Dining"];
    flightInfo.duration       = [NSString stringWithFormat:@"%@",json[@"Duration"]];
    //flightInfo.entertainment  = json[@"Entertainment"];
    flightInfo.flightDateTime = json[@"FlightDateTime"];
    NSNumberFormatter *f = [[NSNumberFormatter alloc]init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    NSString *priceString = [NSString stringWithFormat:@"%@",json[@"FlightFare"]];
    NSString *numberString = [priceString substringToIndex:[priceString length]];
    //flightInfo.flightFare     = [f numberFromString:numberString];
    flightInfo.flightFare = json[@"FlightFare"];
    flightInfo.flightNo       = [NSString stringWithFormat:@"%@", json[@"FlightNo"]];
    //flightInfo.inflightCommunications = json[@"InflightCommunications"];
    flightInfo.sector      = json[@"Sector"];
    flightInfo.transitions = json[@"Transitions"];
    //flightInfo.wines       = json[@"Wines"];
    return flightInfo;
}

-(void)buttonTapped2
{
    SNTravelVC *vc = [[SNTravelVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark - sort nearby tags array
-(void) sortArray:(NSMutableArray *) array
{
    // we'll sort the array based on some (hopefully) smart parameters
    // definitely need to sort based on likes - k*hides, where k ~4
    // just do quicksort
    
    [self quicksort: array FromIndex:0 toIndex:(int) [array count]];
    
    //
}

-(void) quicksort:(NSMutableArray *) array FromIndex:(int) start toIndex:(int) end
// here we're just sorting TAG's //
{
    if(end - start  < 2){return;}
    int i = start;
    int j = end - 1;
    while (j > i) {
        if([self array:array scoreI:i minusScoreJ:(i+1)] < 0){ // then we need to swap them
            SNFlightInfo *tmp               = array[i];
            array[i]   = array[i+1];
            array[i+1] = tmp;
            i++;
        }else{
            SNFlightInfo *tmp               = array[j];
            array[j]   = array[i+1];
            array[i+1] = tmp;
            j--;
        }
    } // here i == j
    if(i == start){ // i was the largest
        [self quicksort: array FromIndex:(start + 1) toIndex:end];
    }else{
        [self quicksort: array FromIndex:start toIndex:i];
        [self quicksort: array FromIndex:i toIndex:end];
    }
}

-(int) array:(NSMutableArray *) array scoreI:(int) i minusScoreJ:(int) j
{
    SNFlightInfo *flightInfoI = array[i];
    SNFlightInfo *flightInfoJ = array[j];
    if (self.userProfile.priceCare) {
        int priceI = [flightInfoI.flightFare intValue];
        int priceJ = [flightInfoJ.flightFare intValue];
        return priceI - priceJ;
    }
    if (self.showAttractions) {
        int showI = [flightInfoI.inflightCommunications intValue];
        int showJ = [flightInfoJ.inflightCommunications intValue];
        return showI - showJ;
    }
    return 1;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self view] endEditing:TRUE];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
}

-(void)dismissKeyboard {
    NSLog(@"dismissKeyboard called!!");
    [self.searchBar2 resignFirstResponder];
    [self.searchBar resignFirstResponder];
    [self.pmCC dismissCalendarAnimated:YES];
}



@end
