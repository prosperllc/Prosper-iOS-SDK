//
//  Copyright © 2015 Prosper Funding, LLC, All rights reserved.
//


#import <Foundation/Foundation.h>

@class PMIProspectOffersResponse;
@class PMIBorrowerInfo;
@class PMILoanOfferList;
@class PMIResponseError;

typedef void (^PMIProspectOffersResponseCompletionBlock)(PMIProspectOffersResponse *servicesRespObj);


@interface PMIProspectOffersAPIService : NSObject

/*!
 @method
 
 @abstract Return the loan offers.
 @param requestParams If all values are not set for requestParams, this method will return error.
 
 @return PMILoanOffersProspectResponseCompletionBlock called when the getLoanOffers method is completed.
 @param PMILoanOffersResponse type has PMILoanOffersList and PMIResponseError objects.
 PMILoanOffersList gets initailzed if there is success.
 PMIResponseError contains error information for failure.
 */

+ (void)getLoanOffers:(PMIBorrowerInfo*)requestParams
  withCompletionBlock:(PMIProspectOffersResponseCompletionBlock)block;

@end


#pragma mark -

@interface PMIProspectOffersResponse: NSObject

/*!
 @abstract returns the loanOfferList values.
 */
@property (readonly, nonatomic, strong) PMILoanOfferList *loanOfferList;

/*!
 @abstract returns the error the was returned in failure case.
 */
@property (readonly, nonatomic, copy) PMIResponseError *responseError;

@end
