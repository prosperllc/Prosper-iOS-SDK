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


#pragma mark - Button Action Methods

- (IBAction)getOffersButtonClicked:(id)sender {
    
    UIAlertController * alertController =   [UIAlertController
                                             alertControllerWithTitle:@""
                                             message:@"Your personal information is shared for applying a Prosper Loan. Do you want to continue?"
                                             preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction *cancelAlertAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                                style:UIAlertActionStyleDefault
                                                              handler:nil];
    
    UIAlertAction *okAlertAction = [UIAlertAction actionWithTitle:@"OK"
                                                                style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction *action) {
                                                                  [self showOffers];
                                                                  
                                                              }];
    [alertController addAction:cancelAlertAction];
    [alertController addAction:okAlertAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (IBAction)prosperFunnelButtonClicked:(id)sender {
    
    PMIBorrowerViewController *borrowerViewController = [[PMIBorrowerViewController alloc] initWithDetails:nil delegate:self];
    [self presentViewController:borrowerViewController animated:YES completion:nil];
}

- (void)showOffers
{
    // Below are the 13 fields that needs to be passed as part of borrower information.
    
    PMIBorrowerInfo *requestParams = [[PMIBorrowerInfo alloc] init];
    NSNumber *loanAmount = @5000;
    // 1
    requestParams.loanAmount = loanAmount;
    
    // 2
    requestParams.loanPurposeId = PMIHomeImprovement;
    
    // 3
    requestParams.partnerSourceCode = @"308";
    
    // 4
    requestParams.firstName = @"MONISE";
    
    // 5
    requestParams.lastName = @"KELLY";
    
    // 6
    requestParams.dateOfBirth = @"01/01/1965";
    
    // 7
    requestParams.address1 = @"14511 STAR CROSS TRL";
    
    // 8
    requestParams.city = @"HELOTES";
    
    // 9
    requestParams.state = @"TX";
    
    // 10
    requestParams.zipCode = @"780234050";
    
    // 11
    requestParams.employmentStatusId = PMIEmployed;
    
    // 12
    NSNumber *num = @100000;
    requestParams.annualIncome = num;
    
    int number = arc4random() %200;
    // 13
    requestParams.email = [NSString stringWithFormat:@"TestUser09%d@c1.dev",number];
    
    
    // Below are Optional fields. Below values gets prepopulated if they are sent.
    requestParams.creditRangeId = PMIExcellentCredit;
    requestParams.primaryPhoneNumber = @"4088029656";
    requestParams.secondaryPhoneNumber = @"4088029658";
    
    requestParams.employerName = @"Employer Name";
    requestParams.employerPhoneNumber = @"4088029876";
    requestParams.workPhoneNumber = @"4088029878";
    
    requestParams.employerStartDate = @"04/2010";
    requestParams.occupationType = PMIDoctor;
    
    requestParams.ssnNumber = @"666302683";
    
    requestParams.bankAccountNumber = @"32423435345435";
    
    requestParams.bankRoutingNumber = @"121000248";

    requestParams.clientReferenceId = @"APPTest01";
    
    self.loadingView.hidden = NO;
    
    [PMIProspectOffersAPIService getMarketPlaceOffers:requestParams withCompletionBlock:^(PMIProspectOffersResponse *servicesRespObj) {
        
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
            
            UIAlertController * alertController =   [UIAlertController
                                                     alertControllerWithTitle:@"Error"
                                                     message:[servicesRespObj.responseError getErrorDescription]
                                                     preferredStyle:UIAlertControllerStyleAlert];
            
            
            UIAlertAction *cancelAlertAction = [UIAlertAction actionWithTitle:@"Ok"
                                                                        style:UIAlertActionStyleDefault
                                                                      handler:nil];
            [alertController addAction:cancelAlertAction];
            
            [self presentViewController:alertController animated:YES completion:nil];
        }
    }];

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
    
    
    UIAlertController * alertController =   [UIAlertController
                                             alertControllerWithTitle:@"Alert"
                                             message:loanStatus
                                             preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAlertAction = [UIAlertAction actionWithTitle:@"Ok"
                                                                style:UIAlertActionStyleDefault
                                                              handler:nil];
    [alertController addAction:cancelAlertAction];
    
    [self presentViewController:alertController animated:YES completion:nil];

    [self.navigationController popToRootViewControllerAnimated:YES];
}


@end
