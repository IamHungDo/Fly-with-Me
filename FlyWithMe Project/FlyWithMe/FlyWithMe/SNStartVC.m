//
//  SNStartVC.m
//  FlyWithMe
//
//  Created by Luke on 11/7/15.
//  Copyright © 2015 Hung Do. All rights reserved.
//

#import "SNStartVC.h"
#import "SNProfileVC.h"
#import <TwitterKit/TwitterKit.h>

@interface SNStartVC ()

@property (strong, nonatomic) UIImageView *iv;
@property (strong, nonatomic) UIButton    *logInButton;
@property (strong, nonatomic) UIButton    *logoutButton;
@property (strong, nonatomic) UITextView  *textView;


@end

@implementation SNStartVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //self.navigationController.navigationBarHidden = YES;
    if (!self.userProfile) {
        self.userProfile = [[SNUserProfile alloc]init];
    }
    
//    CGRect logoutFrame = CGRectMake(0, 100, self.view.frame.size.width, 50);
//    self.logoutButton  = [[UIButton alloc]initWithFrame:logoutFrame];
//    [self.logoutButton setTitle:@"LOGOUT" forState:UIControlStateNormal];
//    [self.logoutButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    [self.logoutButton addTarget:self action:@selector(logoutButtonTapped) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:self.logoutButton];
    
/*    TWTRLogInButton *logInButton = [TWTRLogInButton buttonWithLogInCompletion:^(TWTRSession *session, NSError *error) {
        if (session) {
//             Callback for login success or failure. The TWTRSession
//             is also available on the [Twitter sharedInstance]
//             singleton.
//            
//             Here we pop an alert just to give an example of how
//             to read Twitter user info out of a TWTRSession.
//            
//             TODO: Remove alert and use the TWTRSession's userID
//             with your app's user model
            NSString *message = [NSString stringWithFormat:@"@%@ logged in! (%@)",
                                 [session userName], [session userID]];
            NSLog(@"Session user ID: %@",session.userID);
            NSLog(@"Session user userName: %@",session.userName);
            self.userName = session.userName;
            // Get user info */
            /*
            [[[Twitter sharedInstance] APIClient] loadUserWithID:[session userID]
                                                      completion:^(TWTRUser *user,
                                                                   NSError *error)
             {
                 // handle the response or error
                 if (![error isEqual:nil]) {
                     NSLog(@"Twitter info   -> user = %@ ",user);
                     NSLog(@"User name: %@", user.name);
                     self.fullName = user.name;
                     NSString *urlString = [[NSString alloc]initWithString:user.profileImageLargeURL];
                     NSURL *url = [[NSURL alloc]initWithString:urlString];
                     NSData *pullTwitterPP = [[NSData alloc]initWithContentsOfURL:url];
                     
                     self.profileImage = [UIImage imageWithData:pullTwitterPP];
                     SNProfileVC *vc = [[SNProfileVC alloc] init];
                     vc.profileImage = self.profileImage;
                     vc.userName     = self.userName;
                     vc.fullName = self.fullName;
                     [self.navigationController pushViewController:vc animated:YES];
                     
                 } else {
                     NSLog(@"Twitter error getting profile : %@", [error localizedDescription]);
                 }
                 [self logoutButtonTapped];
             }];

            //NSLog(@"Session user dictionary: %@",session.);
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Logged in!"
                                                            message:message
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];

        } else {
            NSLog(@"Login error: %@", [error localizedDescription]);
        }
    }]; */

    self.iv = [[UIImageView alloc]init];
    self.iv.frame = CGRectMake(20, self.view.frame.size.height/3 - 100, self.view.frame.size.width-40, (self.view.frame.size.width-40)*2/5);
    self.iv.image = [UIImage imageNamed:@"logo_homescreen.png"];
    [self.view addSubview:self.iv];
    
    //Text View
    CGRect textViewFrame = CGRectMake(20, self.view.frame.size.height*2/3-100, self.view.frame.size.width-40, 50);
    self.textView = [[UITextView alloc] initWithFrame:textViewFrame];
    self.textView.font = [UIFont systemFontOfSize:25];
    self.textView.returnKeyType = UIReturnKeyDone;
    self.textView.keyboardType = UIKeyboardTypeDefault;
    if(self.userProfile.userName){
        if (![self.userProfile.userName isEqualToString:@""]) {
            self.textView.text = self.userProfile.userName;
            NSLog(@"userProfile.userName = %@", self.userProfile.userName);
        }else{
            self.textView.text = @"@username";
        }
    }else{
        self.textView.text = @"@username";
    }

    self.textView.textColor = [UIColor blueColor];
    self.textView.delegate = self;
    self.textView.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.textView];
    
    
    //logInButton.frame = CGRectMake(20, self.view.frame.size.height*2/3, self.view.frame.size.width-40, 50);
    //[self.view addSubview:logInButton];
    
    
    UIButton *logInButton = [[UIButton alloc]init];
    logInButton.frame = CGRectMake(20, self.view.frame.size.height*2/3, self.view.frame.size.width-40, 50);
    //[logInButton setTitle:@"LOGIN" forState:UIControlStateNormal];
    //[logInButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [logInButton setImage:[UIImage imageNamed:@"twitter_login.png"] forState:UIControlStateNormal];
    [logInButton addTarget:self action:@selector(loginButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:logInButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString *) getDataFrom:(NSString *)url{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:url]];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;
    
    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    
    if([responseCode statusCode] != 200){
        NSLog(@"Error getting %@, HTTP status code %i", url, [responseCode statusCode]);
        return nil;
    }
    
    return [[NSString alloc] initWithData:oResponseData encoding:NSUTF8StringEncoding];
}

-(void) logoutButtonTapped
{
    [[Twitter sharedInstance] logOut];
    
    NSLog(@"LOGOUT BUTTON TAPPED!");
    
    NSURL *url = [NSURL URLWithString:@"https://api.twitter.com"];
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookiesForURL:url];
    for (NSHTTPCookie *cookie in cookies)
    {
        NSLog(@"a cookie!!");
        [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
    }
}
-(void) loginButtonTapped
{
    NSLog(@"loginButtonTapped!!");
    //NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //NSString *documentsDirectory = [paths objectAtIndex:0];
    //NSLog(@"documentsDicrectory: %@",documentsDirectory);
    //NSArray *filePathsArray = [[NSFileManager defaultManager] subpathsOfDirectoryAtPath:documentsDirectory  error:nil];
    self.userProfile.userName = self.textView.text;
    NSLog(@"userProfile.userName = %@", self.userProfile.userName);
    SNProfileVC *profileVC = [[SNProfileVC alloc]init];
    profileVC.userProfile = self.userProfile;
    [self.navigationController pushViewController:profileVC animated:YES];
    //NSLog(@"files array %@", filePathsArray);
}

#pragma mark - UI Text Field
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    NSCharacterSet *doneButtonCharacterSet = [NSCharacterSet newlineCharacterSet];
    NSRange replacementTextRange = [text rangeOfCharacterFromSet:doneButtonCharacterSet];
    NSUInteger location = replacementTextRange.location;
    
    if (textView.text.length + text.length > 600){
        if (location != NSNotFound){
            [textView resignFirstResponder];
        }
        return NO;
    }
    else if (location != NSNotFound){
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@"@username"]) {
        textView.text = @"";
        textView.textColor = [UIColor blueColor]; //optional
    }
    [textView becomeFirstResponder];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@""]) {
        textView.text = @"@username";
        textView.textColor = [UIColor blueColor]; //optional
    }
    [textView resignFirstResponder];
}

@end
