//
//  Copyright © 2015 Prosper Funding, LLC, All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PMIBorrowerConstants.h"

@class PMILoanOffer;
@class PMIBorrowerInfo;
@class PMIBorrowerViewController;

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


@interface PMIBorrowerViewController : UINavigationController

/*!
 @method
 @abstract Pass the Selected offer by the user. This loads the borrower SDK UI.
 @param delegate - the caller object
 */
- (PMIBorrowerViewController*)initWithOffer:(PMILoanOffer*)offer
                                   delegate:(id<PMIBorrowerDelegate>) delegate;

/*!
 @method
 @abstract Creates the borrower controller from the passed borrower Information. This loads the borrower SDK UI.
 Use this method only if there are no complete 13 fields information that gets passed to borrowerInfo object. 
 @param delegate - the caller object
 */
- (PMIBorrowerViewController*)initWithDetails:(PMIBorrowerInfo*)borrowerInfo
                                   delegate:(id<PMIBorrowerDelegate>) delegate;

@end


