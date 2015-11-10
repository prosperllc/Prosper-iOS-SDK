//
//  Copyright © 2015 Prosper Funding, LLC, All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef ProsperBorrowerSDK_PMIBorrowerConstants_h
#define ProsperBorrowerSDK_PMIBorrowerConstants_h

typedef enum PMIBorrowerLoanStatus:NSInteger {
    PMIBorrowerLoanSuccess = 0,
    PMIBorrowerLoanFailed  = 1,
    PMIBorrowerTimedOut = 2
} BorrowerLoanStatus;

typedef enum PMIBorrowerLoanPurpose:NSInteger {
    PMIDebtConsolidation = 1,
    PMIHomeImprovement  = 2,
    PMIBusiness = 3,
    PMIAuto = 6,
    PMIOther = 7,
    PMIBabyAdaptionLoans = 8,
    PMIBoat = 9,
    PMIEngagementRingFinancing = 11,
    PMIGreenLoans = 12,
    PMIHouseHoldExpenses = 13,
    PMILargePurchases = 14,
    PMIMedicalDental = 15,
    PMIMotorCycle = 16,
    PMIRV = 17,
    PMITaxes = 18,
    PMIVacation = 19,
    PMISpecialOccassionLoans = 21,
} BorrowerLoanPurpose;

typedef enum PMICreditRangeType:NSInteger {
    PMIExcellentCredit = 1,    // 760 +
    PMIGoodCredit = 2,         // 700 - 760
    PMIFairCredit = 3,         // 640 - 700
    PMIPoorCredit = 4          // < 640
} CreditRangeType;

typedef enum PMIEmploymentStatus:NSInteger {
    PMISelfEmployed = 3,
    PMIOtherEmployed = 6,
    PMIEmployed = 7
} EmploymentStatus;


#endif
