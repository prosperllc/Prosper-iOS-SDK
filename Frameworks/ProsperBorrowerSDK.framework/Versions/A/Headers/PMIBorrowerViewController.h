//
//  Copyright © 2015 Prosper Funding, LLC, All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PMIBorrowerConstants.h"

@class PMILoanOffer;

@interface PMIBorrowerViewController : UINavigationController

// Pass the Selected offer by the user. This loads the borrower SDK UI.
- (PMIBorrowerViewController*)initWithOffer:(PMILoanOffer*)offer
                                   delegate:(id)delegate;
@end

/* 
 BorrowerDelegate Protocol has to be implemented by the delegate class to know the status of loan.
 1. Loan is successfully processed.
 2. Loan is declined
 3. Loan is cancelled by the user
*/

@protocol PMIBorrowerDelegate <NSObject>
@required
- (void)borrowerViewController:(PMIBorrowerViewController *)borrowerViewController loanProcessedStatus:(BorrowerLoanStatus)status;
@end
