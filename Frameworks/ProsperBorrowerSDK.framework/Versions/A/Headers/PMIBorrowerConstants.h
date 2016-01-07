//
//  Copyright © 2015 Prosper Funding, LLC, All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef ProsperBorrowerSDK_PMIBorrowerConstants_h
#define ProsperBorrowerSDK_PMIBorrowerConstants_h

typedef enum PMIBorrowerLoanStatus:NSInteger {
    PMIBorrowerLoanSuccess = 0,
    PMIBorrowerLoanCancelled  = 1,
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

typedef enum PMIOccupationType:NSInteger {
    PMIAccountantOrCPA = 1,
    PMIAnalyst = 2,
    PMIArchitect = 3,
    PMIAttorney = 4,
    PMIBiologist = 5,
    PMIBusDriver = 6,
    PMICarDealer = 7,
    PMIChemist = 8,
    PMICivilService = 9,
    PMIClergy = 10,
    PMIClerical = 11,
    PMIComputerProgrammer = 12,
    PMIConstruction = 13,
    PMIDentist = 14,
    PMIDoctor = 16,
    PMIEngineerChemical = 17,
    PMIEngineerElectrical = 18,
    PMIEngineerMechanical = 19,
    PMIExecutive = 20,
    PMIFireman = 21,
    PMIFlightAttendant = 22,
    PMIFoodService = 23,
    PMIFoodServiceManagement = 24,
    PMIHomemaker = 25,
    PMIJudge = 26,
    PMILaborer = 27,
    PMILandscaping = 28,
    PMIMedicalTechnician = 29,
    PMIMilitaryEnlisted = 30,
    PMIMilitaryOfficer = 31,
    PMINurseLPN = 32,
    PMINurseRN = 33,
    PMINurseAide = 34,
    PMIPharmacist = 35,
    PMIPilotPrivateOrCommercial = 36,
    PMIPoliceOfficerOrCorrectionOfficer = 37,
    PMIPostalService = 38,
    PMIPrincipal = 39,
    PMIProfessional = 40,
    PMIProfessor = 41,
    PMIPsychologist = 42,
    PMIRealtor = 43,
    PMIReligious = 44,
    PMIRetailManagement = 45,
    PMISalesCommission = 47,
    PMISalesRetail = 48,
    PMIScientist = 49,
    PMIAdministrativeAssistant = 50,
    PMISkilledLabor = 52,
    PMISocialWorker = 53,
    PMIStudentCollegeFreshman = 54,
    PMIStudentCollegeSophomore = 55,
    PMIStudentCollegeJunior = 56,
    PMIStudentCollegeSenior = 57,
    PMIStudentCollegeGraduateStudent = 58,
    PMIStudentCommunityCollege = 59,
    PMIStudentTechnicalSchool = 60,
    PMITeacher = 61,
    PMITeacherAide = 62,
    PMITradesmanCarpenter = 63,
    PMITradesmanElectrician = 64,
    PMITradesmanMechanic = 65,
    PMITradesmanPlumber = 66,
    PMITruckDriver = 67,
    PMIWaiterOrWaitress = 69,
    PMIOccupationOther = 70,
    PMIInvestor = 71
} OccupationType;

#endif
