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

    
+ (void)getMarketPlaceOffers:(PMIBorrowerInfo *)requestParams
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
