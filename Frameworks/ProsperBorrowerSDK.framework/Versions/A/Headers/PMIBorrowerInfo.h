//
//  Copyright © 2015 Prosper Funding, LLC, All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PMIBorrowerInfo : NSObject

/**
 @abstract set the loan amount requested by borrower.
 */
@property (readwrite, nonatomic, strong) NSNumber *loanAmount;

/**
 @abstract set the loan purpose Id. Refer the PMIBorrowerConstants.h for the value.
 */
@property (readwrite, nonatomic, assign) NSInteger loanPurposeId;

/**
 @abstract set the Credit Range Id. Refer the PMIBorrowerConstants.h for the value.
 */
@property (readwrite, nonatomic, assign) NSInteger creditRangeId;

/**
 @abstract set the employmentStatusId. Refer the PMIBorrowerConstants.h for the value.
 */
@property (readwrite, nonatomic, assign) NSInteger employmentStatusId;

/**
 @abstract set the First Name of the borrower.
 */
@property (readwrite, nonatomic, strong) NSString *firstName;

/**
 @abstract set the last Name of the borrower.
 */
@property (readwrite, nonatomic, strong) NSString *lastName;

/**
 @abstract set the date of Birth of the borrower in the format. [MM/DD/YYYY]
 */
@property (readwrite, nonatomic, strong) NSString *dateOfBirth;

/**
 @abstract set the street address of the borrower.
 */
@property (readwrite, nonatomic, strong) NSString *address1;

/**
 @abstract set the city of the borrower.
 */
@property (readwrite, nonatomic, strong) NSString *city;

/**
 @abstract set the state of the borrower.
 */
@property (readwrite, nonatomic, strong) NSString *state;

/**
 @abstract set the zipcode of the borrower.
 */
@property (readwrite, nonatomic, strong) NSString *zipCode;

/**
 @abstract set the zipcode of the borrower.
 */
@property (readwrite, nonatomic, strong) NSNumber *annualIncome;

/**
 @abstract set the email of the borrower.
 */
@property (readwrite, nonatomic, strong) NSString *email;

@end
