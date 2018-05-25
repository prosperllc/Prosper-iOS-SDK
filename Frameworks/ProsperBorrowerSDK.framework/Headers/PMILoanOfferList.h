//
//  Copyright © 2015 Prosper Funding, LLC, All rights reserved.
//


#import <Foundation/Foundation.h>

@interface PMILoanOfferList : NSObject

/**
 @abstract returns the maximumLoanCapAmount.
 */
@property (readonly, nonatomic, strong) NSNumber *maximumLoanCapAmount;

/**
 @abstract returns the minimumLoanCapAmount.
 */
@property (readonly, nonatomic, strong) NSNumber *minimumLoanCapAmount;

/**
 @abstract returns the originalLoanAmount.
 */
@property (readonly, nonatomic, strong) NSNumber *originalLoanAmount;

/**
 @abstract returns the requestedLoanAmount.
 */
@property (readonly, nonatomic, strong) NSNumber *requestedLoanAmount;

/**
 @abstract returns the listingId.
 */
@property (readonly, nonatomic, assign) NSInteger listingId;

/**
 @abstract returns the loanCapRestriction.
 */
@property (readonly, nonatomic, assign) BOOL hasLoanCapRestriction;


/**
 @abstract returns the array of PMILoanOffer objects.
 */
@property (readonly, nonatomic, strong, getter = getLoanOffers) NSArray *offers;

@end

#pragma mark -

@interface PMILoanOffer : NSObject

/**
 @abstract returns the loanOfferId.
 */
@property (readonly, nonatomic, assign) NSInteger loanOfferId;

/**
 @abstract returns the apr.
 */
@property (readonly, nonatomic, strong) NSNumber *apr;

/**
 @abstract returns the rateOffered.
 */
@property (readonly, nonatomic, strong) NSNumber *rateOffered;

/**
 @abstract returns the originationFee.
 */
@property (readonly, nonatomic, strong) NSNumber *originationFee;

/**
 @abstract returns the financeCharge.
 */
@property (readonly, nonatomic, strong) NSNumber *financeCharge;

/**
 @abstract returns the loanAmount.
 */
@property (readonly, nonatomic, strong) NSNumber *loanAmount;

/**
 @abstract returns the monthlyPayment.
 */
@property (readonly, nonatomic, strong) NSNumber *monthlyPayment;

/**
 @abstract returns the offerType.
 */
@property (readonly, nonatomic, strong) NSString *offerType;

/**
 @abstract returns the term.
 */
@property (readonly, nonatomic, assign) NSInteger term;

/**
 @abstract returns the firstPaymentDueDate.
 */
@property (readonly, nonatomic, strong) NSDate *firstPaymentDueDate;

/**
 @abstract returns the finalPaymentDueDate.
 */
@property (readonly, nonatomic, strong) NSDate *finalPaymentDueDate;

/**
 @abstract returns the offerDate.
 */
@property (readonly, nonatomic, strong) NSDate *offerDate;

/**
 @abstract returns the referral Code.
 */
@property (readonly, nonatomic, strong) NSString *referralCode;


- (NSDictionary *)getOfferDetails;

@end
