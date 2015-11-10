//
//  OfferViewController.h
//  ProsperBorrowerSDKSample
//
//  Copyright © 2015 Prosper Funding, LLC, All rights reserved.

#import <UIKit/UIKit.h>
#import <ProsperBorrowerSDK/ProsperBorrowerSDK.h>

@interface OfferViewController : UIViewController <PMIBorrowerDelegate, UIAlertViewDelegate>

@property(readwrite, nonatomic, strong) PMILoanOffer *loanOffer;

@end

