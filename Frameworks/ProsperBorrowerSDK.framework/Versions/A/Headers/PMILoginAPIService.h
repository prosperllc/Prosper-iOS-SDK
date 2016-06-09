//
//  PMILoginAPIService.h
//  ProsperBorrowSDK
//
//  Created by Rama Krishna Lagadapati on 2/20/15.
//  Copyright (c) 2015 Prosper Funding, LLC, All rights reserved.
//

#import <Foundation/Foundation.h>

@class PMILoginResponse;
@class PMIResponseError;

typedef void (^PMILoginResponseCompletionBlock)(PMILoginResponse *servicesRespObj);

@interface PMILoginAPIService : NSObject

/*!
 @method
 
 @abstract Returns the sucess or failure.
 
 @return PMILoginResponseCompletionBlock called when the loginWithEmail method is completed.
    @param PMILoginResponse type has isLoginSucceed and PMIResponseError objects.
        isLoginSucceed gets set to true or false.
        responseError contains error information for failure.
 */

+ (void)loginWithEmail:(NSString *)email
              password:(NSString *)password
   withCompletionBlock:(PMILoginResponseCompletionBlock)block;

@end

#pragma mark -

@interface PMILoginResponse : NSObject

/**
@abstract isloginSucceed value gets set to true for successfule login, else it gets set to false.
 */
@property (readonly, nonatomic, assign) BOOL isLoginSucceed;

/**
 @abstract returns the error the was returned in failure case.
 */
@property (readonly, nonatomic, copy) PMIResponseError *responseError;

@end