//
//  WelcomeViewController.m
//  ProsperBorrowerSDKSample
//
//  Copyright © 2015 Prosper Funding, LLC, All rights reserved.


#import "WelcomeViewController.h"
#import "OfferViewController.h"
#import <ProsperBorrowerSDK/ProsperBorrowerSDK.h>

@interface WelcomeViewController ()
@property (weak, nonatomic) IBOutlet UIView *loadingView;
@property (weak, nonatomic) IBOutlet UILabel *descriptionTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *userTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *documentationLabel;
@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:247.0f/255.0f green:147.0f/255.0f blue:42.0f/255.0f alpha:1.0f]];
    [self.navigationController.navigationBar setTranslucent:NO];
    [self.navigationController.navigationBar
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    NSMutableDictionary *attributes = [[NSMutableDictionary alloc] init];
    
    NSMutableParagraphStyle *paragrapStyle = [[NSMutableParagraphStyle alloc] init];
    paragrapStyle.alignment = NSTextAlignmentLeft;
    paragrapStyle.lineSpacing = 4;
    paragrapStyle.minimumLineHeight = 18.0f;
    [attributes setObject:paragrapStyle forKey:NSParagraphStyleAttributeName];
    
    
    NSString *descriptionText = @"Let your users apply for a loan through Prosper from your app.\n\n"
    "Option 1 : Pass user data to Prosper to present personalized loan offers within your app.";
    
    NSMutableAttributedString *descriptionAttrText = [[NSMutableAttributedString alloc] initWithString:descriptionText
                                                                                      attributes:attributes];
    self.descriptionTextLabel.attributedText = descriptionAttrText;

    
    NSString *newUserText = @"Option 2 : If you do not want to collect user data to generate offers, allow the SDK to collect user data"
    " and display peronalized offers.";
    NSMutableAttributedString *userTextLabelText = [[NSMutableAttributedString alloc] initWithString:newUserText
                                                                                      attributes:attributes];
    self.userTextLabel.attributedText = userTextLabelText;
    
    
    NSString *documentationText = @"To learn more, refer to the Prosper SDK documentation.";
    self.documentationLabel.attributedText = [[NSMutableAttributedString alloc] initWithString:documentationText
                                                                                    attributes:attributes];

    self.title = @"Sample App";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Button Action Methods

- (IBAction)getOffersButtonClicked:(id)sender {
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                    message:@"Your personal information is shared for applying a Prosper Loan. Do you want to continue?"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Ok",nil];
    [alert show];
    
}

- (IBAction)prosperFunnelButtonClicked:(id)sender {
    
    PMIBorrowerViewController *borrowerViewController = [[PMIBorrowerViewController alloc] initWithDetails:nil delegate:self];
    [self presentViewController:borrowerViewController animated:YES completion:nil];
}

#pragma mark - UIAlertView delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    
    if([title isEqualToString:@"Ok"]) {
        // Below are the 13 fields that needs to be passed as part of borrower information.
        
        PMIBorrowerInfo *requestParams = [[PMIBorrowerInfo alloc] init];
        NSNumber *loanAmount = @5000;
        // 1
        requestParams.loanAmount = loanAmount;
        
        // 2
        requestParams.loanPurposeId = PMIHomeImprovement;
        
        // 3
        requestParams.creditRangeId = PMIExcellentCredit;
        
        // 4
        requestParams.firstName = @"Mary";
        
        // 5
        requestParams.lastName = @"Hopkins";
        
        // 6
        requestParams.dateOfBirth = @"03/22/1984";
        
        // 7
        requestParams.address1 = @"912 PINELAND AVE APT 33";
        
        // 8
        requestParams.city = @"Hinesville";
        
        // 9
        requestParams.state = @"GA";
        
        // 10
        requestParams.zipCode = @"31313";
        
        // 11
        requestParams.employmentStatusId = PMIEmployed;
        
        // 12
        NSNumber *num = @100000;
        requestParams.annualIncome = num;
        
        int number = arc4random() %200;
        // 13
        requestParams.email = [NSString stringWithFormat:@"TestUser20151019%d@gmail.com",number];
        
        
        // Below are Optional fields. Below values gets prepopulated if they are sent.
        requestParams.primaryPhoneNumber = @"4088029656";
        requestParams.secondaryPhoneNumber = @"4088029658";
        
        requestParams.employerName = @"Employer Name";
        requestParams.employerPhoneNumber = @"4088029876";
        requestParams.workPhoneNumber = @"4088029878";
        
        requestParams.employerStartDate = @"04/2010";
        requestParams.occupationType = PMIDoctor;
        
        requestParams.ssnNumber = @"123456786";
        
        requestParams.bankAccountNumber = @"32423435345435";
        
        requestParams.bankRoutingNumber = @"121000248";

        
        self.loadingView.hidden = NO;
        
        [PMIProspectOffersAPIService getLoanOffers:requestParams withCompletionBlock:^(PMIProspectOffersResponse *servicesRespObj) {
            
            self.loadingView.hidden = YES;
            if(nil != servicesRespObj.loanOfferList.offers) {
                NSArray *offersList = servicesRespObj.loanOfferList.offers;
                if([offersList count] > 0) {
                    NSNumber *val = @5000;
                    NSArray *offerCategoriesArray1 = [offersList filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"(loanAmount == %@)", val]];
                    
                    PMILoanOffer *offer = [offersList objectAtIndex:0];
                    if([offerCategoriesArray1 count] > 0) {
                        offer = [offerCategoriesArray1 objectAtIndex:0];
                    }
                    
                    UIStoryboard *thankyouStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    OfferViewController *thankYouViewController = [thankyouStoryBoard instantiateViewControllerWithIdentifier:@"HomeViewController"];
                    thankYouViewController.loanOffer = offer;
                    
                    [self.navigationController pushViewController:thankYouViewController animated:YES];
                    
                }
            } else {
                NSLog(@"ErrorDescription = %@", [servicesRespObj.responseError getErrorDescription]);
                
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                message:[servicesRespObj.responseError getErrorDescription]
                                                               delegate:nil
                                                      cancelButtonTitle:@"Ok"
                                                      otherButtonTitles:nil];
                [alert show];
            }
        }];
    }
}

#pragma mark - PMIBorrowerDelegate methods

- (void)borrowerViewController:(PMIBorrowerViewController *)borrowerViewController loanProcessedStatus:(BorrowerLoanStatus)status {
    NSString *loanStatus = @"";
    if(status == PMIBorrowerLoanSuccess) {
        loanStatus = @"Loan is successfully processed.";
    } else if(status == PMIBorrowerLoanCancelled) {
        loanStatus = @"Loan Process got cancelled";
    } else if(status == PMIBorrowerTimedOut) {
        loanStatus = @"Loan Process got timed out due to inactive user session";
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert"
                                                    message:loanStatus
                                                   delegate:nil
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil];
    [alert show];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
