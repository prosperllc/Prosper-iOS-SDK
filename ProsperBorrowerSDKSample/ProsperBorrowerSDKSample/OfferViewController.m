//
//  OfferViewController.m
//  ProsperBorrowerSDKSample
//
//  Copyright © 2015 Prosper Funding, LLC, All rights reserved.
//

#import "OfferViewController.h"

@interface OfferViewController ()
@property (weak, nonatomic) IBOutlet UIView *loadingView;
@end

@implementation OfferViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.view addGestureRecognizer:singleTap];
    
    self.navigationController.navigationBar.hidden = YES;
}

- (void)handleTap:(UITapGestureRecognizer*)gesture {
    
    PMIBorrowerViewController *prosperViewController = [[PMIBorrowerViewController alloc] initWithOffer:self.loanOffer delegate:self];
    [self presentViewController:prosperViewController animated:YES completion:nil];
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
