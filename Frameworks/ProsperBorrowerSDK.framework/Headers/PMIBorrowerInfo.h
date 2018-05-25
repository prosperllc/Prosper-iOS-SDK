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
 @abstract set the loan purpose Id. Refer PMIBorrowerLoanPurpose enum in PMIBorrowerConstants.h file
 */
@property (readwrite, nonatomic, assign) NSInteger loanPurposeId;

/**
 @abstract set the employmentStatusId. Refer PMIEmploymentStatus enum in PMIBorrowerConstants.h file
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

/**
 @abstract set the partner source code.
 */
@property (readwrite, nonatomic, strong) NSString *partnerSourceCode;


//----------------------- Below are the Optional fields  --------------------------------//

/**
 @abstract set the Credit Range Id. Refer PMICreditRangeType enum in PMIBorrowerConstants.h file
 */
@property (readwrite, nonatomic, assign) NSInteger creditRangeId;

/**
 @abstract set the primaryPhoneNumber.
 */
@property (readwrite, nonatomic, strong) NSString *primaryPhoneNumber;

/**
 @abstract set the secondaryPhoneNumber. This is not mandatory
 */
@property (readwrite, nonatomic, strong) NSString *secondaryPhoneNumber;

/**
 @abstract set the employerName.
 */
@property (readwrite, nonatomic, strong) NSString *employerName;

/**
 @abstract set the employerPhoneNumber.
 */
@property (readwrite, nonatomic, strong) NSString *employerPhoneNumber;

/**
 @abstract set the workPhoneNumber.
 */
@property (readwrite, nonatomic, strong) NSString *workPhoneNumber;

/**
 @abstract set the employerStartDate. [MM/YYYY]
 */
@property (readwrite, nonatomic, strong) NSString *employerStartDate;

/**
 @abstract set the occupation type values. Refer PMIOccupationType enum in PMIBorrowerConstants.h file
 */
@property (readwrite, nonatomic, assign) NSInteger occupationType;

/**
 @abstract set the ssn number.
 */
@property (readwrite, nonatomic, strong) NSString *ssnNumber;

/**
 @abstract set the bank account number.
 */
@property (readwrite, nonatomic, strong) NSString *bankAccountNumber;

/**
 @abstract set the bank routing number.
 */
@property (readwrite, nonatomic, strong) NSString *bankRoutingNumber;

/**
 @abstract set the client reference id.
 */
@property (readwrite, nonatomic, strong) NSString *clientReferenceId;


@end
