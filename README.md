# Prosper Borrower SDK for iOS Integration Guide

# Overview
The Prosper Borrower SDK is a native SDK that allows your customers to apply for a loan within your app in a seamless and convenient way.

With the Prosper Borrower SDK, you can refer your users to receive loan offers through Prosper. After receiving the loan offers, the customer can select that offer, create a Prosper account, and complete a loan application immediately. After the loan application has been completed, Prosper initiates loan verification and generates a loan listing for funding by Prosper investors. 

## Prosper Borrower SDK requirements
The Prosper Borrower SDK supports iOS 7 or higher versions.
You must use Xcode 7 or higher to build your project with the SDK. 

The SDK also uses the following frameworks/libraries:
 * GoogleMaps

This release contains the following:
 * **BorrowerFramework** - folder containing the ProsperBorrowerSDK.framework and ProsperBorrowerSDK.bundle distributions.

 * **ProsperBorrowerSDKSample** - a sample app that demonstrates how to launch the ProsperBorrowerSDK from within an app to get a loan quote and apply for a Prosper loan. 

You will install the SDK by adding a Cocoapod podfile within your project that references the Prosper Borrower SDK podspec. The podfile will automatically download the required third-party frameworks/libraries and link them to your build. It will also download the Prosper Borrower SDK (BorrowerFramework and ProsperBorrowerSDKSample), placing it into your project.


## Before you get started...
There are just a couple of things you need to do before you can go live with the Prosper Borrower SDK. It's not much, but it'll make your experience easier.

1. Get client keys from Prosper.
  Just contact us at mobileSDK@prosper.com and request keys for testing the SDK with your app.

  We'll reply shortly with the following keys, that you'll need when integrating and testing the SDK with your app. The keys work on both the iOS and Android versions of the Prosper Borrower SDK.
   *	Client_Id
   *  Client_Secret
   *  Ref_AC
   *  Ref_MC

  The first two keys are tied to your app when making API calls. They are used to authenticate your app. 
The last two keys associate your app as the referring partner when we generate a Prosper loan listing. Without these keys, you won't get very far. We'll show you where to set them a little later in this guide.

2. Follow the instructions for installing and integrating the SDK in this guide. 
  
  You install the SDK by adding a Cocoapod podfile within your project that references the Prosper Borrower SDK podspec. The podfile will automatically download the required third-party frameworks/libraries and link them to your build. It will also download the Prosper Borrower SDK, placing it into your project. 

3. Test your integration on the Prosper Sandbox environment.
  
  The keys you received in step 1 above work on the Prosper Sandbox environment. All of your initial testing will happen on our Sandbox environment, which is a mirror of our Production environment.   
  
  When everything is working well end to end, drop us another email with a request for Production keys to go live. This new set of keys are configured to work on the Prosper Production environment. Again, these keys will work for both the iOS and Android versions of the Prosper Borrower SDK.

4. Update your new Production keys in the SDK initialization method to go live on the Production environment.



# SDK User Flows 
 
## User flow one: Prosper Borrower SDK displays loan offers after collecting user info   
The diagram below shows the flow between your app and the Prosper Borrower SDK throughout the loan offer and application process. In this flow, your app does not collect the user information required to generate loan offers through Prosper. Instead, your app launches the Borrower SDK, leaving user information collection and loan offer display and selection to the Prosper Borrower SDK. 

Note: in this flow, you may have some information about the user that you can send to Prosper, but you may not have all required information to generate offers and display them within your app.   

![User flow diagram for when the Prosper Borrower SDK collects user information](https://github.com/prosperllc/Prosper-iOS-SDK/blob/master/doc-images/ProsperBorrowerSDKFlowDiagramIncompleteOfferInfo.png)


## User flow two: Your app collects user information and displays loan offers
The diagram below shows the flow between your app and the Prosper Borrower SDK throughout the loan offer and application process. In this flow, your app collects user information required to generate loan offers through Prosper. You pass this user information to the Prosper Borrower SDK. Prosper generates a list of personalized loan offers you can present to the user. You then launch the Borrower SDK when the user selects from the list of personalized loan offers.

![User flow diagram for when your app collects user information](https://github.com/prosperllc/Prosper-iOS-SDK/blob/master/doc-images/ProsperBorrowerSDKFlowDiagramCompleteOffer.png)

# Consumer experience in your app with the Prosper SDK

The following screenshots show the flow of the Prosper Borrower SDK on iOS. The first image represents an app displaying a list of personalized loan offers to a customer. Once the customer selects a loan offer, the app launches the Prosper Borrower SDK, allowing the customer to complete the loan application.

![Prosper Borrower SDK for iOS screenshots](https://github.com/prosperllc/Prosper-iOS-SDK/blob/master/doc-images/iOSScreenshots.png)


<!-- Here's the Prosper Borrower SDK in action on the iOS platform.

![Demo] (https://github.com/prosperllc/Prosper-iOS-SDK/blob/master/doc-images/<name_of_video>)
-->

# Installing the Prosper Borrower SDK using CocoaPods
Before you can integrate the Prosper Borrower SDK into your app, you must use CocoaPods to download and install third-party libraries that the Prosper Borrower SDK is dependent on. 

These are:
 * GoogleMaps

CocoaPods is an open-source dependency manager for iOS apps, which automates and simplifies the process of using third-party libraries like AFNetworking in your projects.

**Note:** If you already have CocoaPods installed, you can skip to Step 2.

**Step 1: Download CocoaPods**
CocoaPods is distributed as a ruby gem, and is installed by running the following commands in the Terminal:

```
$ sudo gem install cocoapods
$ pod setup
```

**Step 2: Create a Podfile**
Project dependencies to be managed by CocoaPods are specified in a file called Podfile. Create this file in the same directory as your Xcode project (.xcodeproj) file:

```
 $ touch Podfile
 $ open -a Xcode Podfile
```

Copy and paste the following lines into the Podfile. This references the ProsperBorrowerSDK podspec:

```
source 'https://github.com/CocoaPods/Specs.git' 
platform :ios, '7.0'

pod 'ProsperBorrowerSDK'
```

**Step 3: Install Dependencies and bring the SDK into your project**

The last step in installing the SDK is to run pod install. 

```
$ pod install
```

This will pull in the third-party libraries/frameworks, link them, install the Prosper Borrower SDK BorrowerFramework and ProsperBorrowerSDKSample files in your project, and either create or update an Xcode workspace for your project <_YourProjectName_>.xcworkspace.   

Going forward, you should open this Xcode workspace when working.


## Import the ProsperBorrowerSDK header file in your project
You should import the ProsperBorrowerSDK header file anywhere within your app where you may want to call the Prosper Borrower SDK.
 

```
#import <ProsperBorrowerSDK/ProsperBorrowerSDK.h>
```



## Include client authentication and Omniture tracking configuration information to the SDK initialization method
Add the following to your app’s didFinishLaunchingWithOptions method. This ensures the Prosper Borrower SDK Omniture tracking configuration is loaded before you initialize the SDK and you have the correct authentication values for the Prosper environment in which you are launching the SDK:

Initializing SDK configuration settings using Objective C:

```
// Initialize the Prosper Config parameters on the Production environment
  [PMIProsperConfig initWithClientId:@"<your_prod_client_id>"
                        clientSecret:@"<your_prod_client_secret>"
                        refMC:@"<your_REF_mc>"
                        refAC:@"<your_REF_mc>"
                        prodCredentials:YES];
```


Initializing SDK configuration settings using Swift:

```
// Initialize the Prosper Config parameters on the Production environment
   PMIProsperConfig.initWithClientId("<your_prod_client_id>", clientSecret: "<your_prod_client_secret>", refMC: "<your_REF_mc>", refAC: "<your_REF_mc>",
    prodCredentials: true)
```

In the above example prodCredentials will take one of the following values

| Language | Possible values for prodCredentials |
| ------------- | ------------- |
| Objective C | YES &#124; NO |
| Swift | true &#124; false |

If set to “NO” or “false”, when the client is launched, the SDK will point to Prosper’s Sandbox environment for authentication and API requests. Use this setting during your initial integration and testing of the Prosper Borrower SDK with you app. 

If set to “YES” or “true”, when the client is launched, the SDK will point to Prosper’s Production environment for authentication and API requests. Use this setting when you are ready to go live with the Prosper Borrower SDK integrated into your app.




You’re all set! At this point, the Prosper Borrower SDK is installed and set up. You can now invoke the Prosper Borrower SDK and get personalized loan offers for users through Prosper.


# Collecting loan applicant information for Prosper loan offers
To generate personalized loan offers for a user, Prosper requires 13 pieces of information about the loan applicant. 

We'll show you how to send this information to the SDK a bit later, but this list can help you decide whether you want to collect this information from your app, or let the SDK collect the information. Even if you have a small subset of this information, it may help to pass it to the SDK to speed the loan application process. 

User info required to generate loan offers:  
 * Loan Amount
 * Loan Purpose
 * Self-Reported Credit Score
 * First Name
 * Last Name
 * Date Of Birth (DOB)
 * Email
 * Street Address
 * City
 * State
 * Zip
 * Employment Status
 * Annual Income
 
To speed up the creation of a loan listing, Prosper can also accept additional information about the loan applicant:
 * Primary phone number
 * Secondary phone number
 * Employer name
 * Employer phone number
 * Work phone number
 * Employer start date
 * Occupation type
 * Social security number
 * Bank account number
 * Bank routing number


## Select the user flow that best matches your development needs.

There are two user flows to choose from, described previously: 
 * **Prosper Borrower SDK displays loan offers after collecting borrower info** – You either cannot or do not want to collect the 13 required pieces of information from users within your app. You are OK with relinquishing control to the Prosper Borrower SDK for collecting this information, and displaying the personalized loan offers to the user. 

  In this case, you will initialize the Prosper Borrower SDK, passing in a nil value for user details. The Prosper Borrower SDK takes care of the rest.
  
  **Note:** If your app has collected a subset of the 13 required fields (or additional fields), you can pass them to the SDK, and the SDK will collect any missing information. 
  
 * **Your app collects user information and displays loan offers** – You may want to have tight control over how (and how many) loan offers are presented to your users. Prosper provides the PMIProspectOffersAPIService API to get a list of personalized loan offers you can present to your users. 

  In this case, you will collect the information above, construct a PMIBorrowerInfo object with this information, and pass the object in a call to the PMIProspectOffersAPIService API. You can then display one or more personalized loan offers returned by the API within your app. When a user selects the offer, you will launch the SDK with that selected loan offer. The Prosper Borrower SDK will take care of the rest.


## Prosper Borrower SDK displays loan offers after collecting user info
If you cannot or do not want to collect all 13 pieces of user information to generate Prosper loan offers, you can launch the Borrower SDK, allowing the Prosper Borrower SDK to collect this information and present the loan offers to the user.

**Passing no user information fields**

The following example shows the first case, where you are passing no borrower info fields to the SDK.

**Using Objective C:**

You will initialize the SDK with the initWithDetails method input set to nil:

```
PMIBorrowerViewController *borrowerViewController = [[PMIBorrowerViewController alloc] initWithDetails:nil delegate:self];
   [self presentViewController:controller animated:YES completion:nil];
```

**Using Swift:**

You will initialize the SDK with the details set to nil:

```
let borrowerViewController =  PMIBorrowerViewController.init(details: nil, delegate: self)
        self.presentViewController(borrowerViewController, animated: true, completion: nil)
```

The Prosper Borrower SDK will then take control, guiding the user through several screens, collecting the 13 pieces of information, requesting that the user create a Prosper account, and presenting a set of pre-approved personalized loan offers the user can select from.


**Passing some user information fields**
In the case where you are passing some of the 13 user info fields (and possibly some additional fields), you will initialize the SDK passing a requestParams object of type PMIBorrowerInfo to the initWithDetails method:

Once you collect this information from your user, you construct a PMIBorrowerInfo object for the loan applicant.

**Using Object C:**

``` 
// Full object with required 13 fields shown. 
// In your case, only some of the required user info fields collected
PMIBorrowerInfo *borrowerInfo = [[PMIBorrowerInfo alloc] init];
   borrowerInfo.loanAmount = @20000;
   borrowerInfo.loanPurposeId = PMIHomeImprovement;
   borrowerInfo.employmentStatusId = PMIEmployed;
   borrowerInfo.creditRangeId = PMIExcellentCredit;
   borrowerInfo.firstName = @"Maryann";
   borrowerInfo.lastName = @"Helmann";
   borrowerInfo.dateOfBirth = @"03/22/1984";
   borrowerInfo.address1 = @"912 PINELAND AVE APT 33";
   borrowerInfo.city = @"Hinesville";
   borrowerInfo.state = @"GA";
   borrowerInfo.zipCode = @"31313";
   borrowerInfo.annualIncome = @75000;
   borrowerInfo.email = @"user@somedomain.com";
// Optional additional borrower info to pass to Prosper Borrower SDK
   borrowerInfo.primaryPhoneNumber = "4085550175";
   borrowerInfo.secondaryPhoneNumber = "4085550235";
   borrowerInfo.employerName = @"City Hospital";
   borrowerInfo.employerPhoneNumber = @"4085550199";
   borrowerInfo.workPhoneNumber = @"4085550100";
   borrowerInfo.employerStartDate = @"04/2010";
   borrowerInfo.occupationType = PMIDoctor;
   borrowerInfo.ssnNumber = @"123456789";
   borrowerInfo.bankAccountNumber = @"32423435345435";
   borrowerInfo.bankRoutingNumber = @"121000248";
```

**Using Swift:**

```
// Full object with required 13 fields shown. 
// In your case, only some of the required user info fields collected
let borrowerInfo:PMIBorrowerInfo = PMIBorrowerInfo.init()
   borrowerInfo.loanAmount = 20000
   borrowerInfo.loanPurposeId = PMIHomeImprovement.rawValue
   borrowerInfo.employmentStatusId = PMIEmployed.rawValue
   borrowerInfo.creditRangeId = PMIExcellentCredit.rawValue
   borrowerInfo.firstName = "Maryann"
   borrowerInfo.lastName = "Helmann"
   borrowerInfo.dateOfBirth = "03/22/1984"
   borrowerInfo.address1 = "912 PINELAND AVE APT 33"
   borrowerInfo.city = "Hinesville"
   borrowerInfo.state = "GA"
   borrowerInfo.zipCode = "31313"
   borrowerInfo.annualIncome = 50000
   borrowerInfo.email = "user@somedomain.com"
// Optional additional borrower info to pass to Prosper Borrower SDK
   borrowerInfo.primaryPhoneNumber = "4085550175"
   borrowerInfo.secondaryPhoneNumber = "4085550235"
   borrowerInfo.employerName = "City Hospital"
   borrowerInfo.employerPhoneNumber = "4085550199"
   borrowerInfo.workPhoneNumber = "4085550100"
   borrowerInfo.employerStartDate = "04/2010"
   borrowerInfo.occupationType = PMIDoctor.rawValue
   borrowerInfo.ssnNumber = "123456789"
   borrowerInfo.bankAccountNumber = "32423435345435"
   borrowerInfo.bankRoutingNumber = "121000248"
```

**Note:** For a full list of values that can be entered for loanPurposeId, employmentStatusId, creditRangeId, and occupationType, refer to the PMIBorrowerConstants.h file in the Headers directory of the ProsperBorrowerSDK framework.


**Using Objective C:**

```
PMIBorrowerViewController *borrowerViewController = [[PMIBorrowerViewController alloc] initWithDetails:borrowerInfo delegate:self];
   [self presentViewController:controller animated:YES completion:nil];
```

**Using Swift:**

```
let borrowerViewController =  PMIBorrowerViewController.init(details: borrowerInfo, delegate: self)
   self.presentViewController(borrowerViewController, animated: true, completion: nil)
```


The Prosper Borrower SDK will then take control, guiding the user through several screens, collecting the 13 pieces of information, requesting that the user create a Prosper account, and presenting a set of pre-approved personalized loan offers the user can select from. 


### User selects and completes the Prosper loan offer
Pre-approved loan offers generated by the Prosper Borrower SDK require user consent and user acceptance of the Prosper Marketplace Terms and Conditions for the loan to become an active listing for funding. 

Once the loan offer is selected, the Prosper Borrower SDK guides the user through the process, displaying Prosper Marketplace Terms and Conditions and requiring consent and acceptance as part of the user experience.



## Your app collects user information and displays loan offers
The Prosper Borrower SDK provides the PMIProspectOffersAPIService API to get a list of loan offers for your users. Getting a list of loan offers is a two-step process.

### Step 1: Collect loan applicant information 
To generate the loan offers, Prosper requires 13 pieces of information about the loan applicant:
 * Loan Amount
 * Loan Purpose
 * Self-Reported Credit Score
 * First Name
 * Last Name
 * Date Of Birth (DOB)
 * Email
 * Street Address
 * City
 * State
 * Zip
 * Employment Status
 * Annual Income

To speed up the creation of a loan listing, Prosper will also accept additional information about the loan applicant.
 * Primary phone number
 * Secondary phone number
 * Employer name
 * Employer phone number
 * Work phone number
 * Employer start date
 * Occupation type
 * Social security number
 * Bank account number
 * Bank routing number

Once you collect this information from your user, you construct a PMIBorrowerInfo object for the loan applicant.

**Using Objective C:**

```
// Building borrower info object with 13 required fields 
PMIBorrowerInfo *borrowerInfo = [[PMIBorrowerInfo alloc] init];
   borrowerInfo.loanAmount = @20000;
   borrowerInfo.loanPurposeId = PMIHomeImprovement;
   borrowerInfo.employmentStatusId = PMIEmployed;
   borrowerInfo.creditRangeId = PMIExcellentCredit;
   borrowerInfo.firstName = @"Maryann";
   borrowerInfo.lastName = @"Helmann";
   borrowerInfo.dateOfBirth = @"03/22/1984";
   borrowerInfo.address1 = @"912 PINELAND AVE APT 33";
   borrowerInfo.city = @"Hinesville";
   borrowerInfo.state = @"GA";
   borrowerInfo.zipCode = @"31313";
   borrowerInfo.annualIncome = @75000;
   borrowerInfo.email = @"user@somedomain.com";
// Optional additional borrower info to pass to Prosper Borrower SDK
   borrowerInfo.primaryPhoneNumber = "4085550175";
   borrowerInfo.secondaryPhoneNumber = "4085550235";
   borrowerInfo.employerName = @"City Hospital";
   borrowerInfo.employerPhoneNumber = @"4085550199";
   borrowerInfo.workPhoneNumber = @"4085550100";
   borrowerInfo.employerStartDate = @"04/2010";
   borrowerInfo.occupationType = PMIDoctor;
   borrowerInfo.ssnNumber = @"123456789";
   borrowerInfo.bankAccountNumber = @"32423435345435";
   borrowerInfo.bankRoutingNumber = @"121000248";
```

**Using Swift**

```
// Building borrower info object with 13 required fields
let borrowerInfo:PMIBorrowerInfo = PMIBorrowerInfo.init()
   borrowerInfo.loanAmount = 20000
   borrowerInfo.loanPurposeId = PMIHomeImprovement.rawValue
   borrowerInfo.employmentStatusId = PMIEmployed.rawValue
   borrowerInfo.creditRangeId = PMIExcellentCredit.rawValue
   borrowerInfo.firstName = "Maryann"
   borrowerInfo.lastName = "Helmann"
   borrowerInfo.dateOfBirth = "03/22/1984"
   borrowerInfo.address1 = "912 PINELAND AVE APT 33"
   borrowerInfo.city = "Hinesville"
   borrowerInfo.state = "GA"
   borrowerInfo.zipCode = "31313"
   borrowerInfo.annualIncome = 50000
   borrowerInfo.email = "user@somedomain.com"
// Optional additional borrower info to pass to Prosper Borrower SDK
   borrowerInfo.primaryPhoneNumber = "4085550175"
   borrowerInfo.secondaryPhoneNumber = "4085550235"
   borrowerInfo.employerName = "City Hospital"
   borrowerInfo.employerPhoneNumber = "4085550199"
   borrowerInfo.workPhoneNumber = "4085550100"
   borrowerInfo.employerStartDate = "04/2010"
   borrowerInfo.occupationType = PMIDoctor.rawValue
   borrowerInfo.ssnNumber = "123456789"
   borrowerInfo.bankAccountNumber = "32423435345435"
   borrowerInfo.bankRoutingNumber = "121000248"
```



**Note:** For a full list of values that can be entered for loanPurposeId, employmentStatusId, creditRangeId, and occupationType, refer to the PMIBorrowerConstants.h file in the Headers directory of the ProsperBorrowerSDK framework.

### Step 2. Call the PMIProspectOffersAPIService to get loan offers
In this step, you will pass the PMIBorrowerInfo (borrowerInfo) object you constructed in Step 1 to get a list of Prosper loan offers.

**Using Objective C:**

```
 [PMIProspectOffersAPIService getLoanOffers:borrowerInfo withCompletionBlock:^(PMIProspectOffersResponse *servicesRespObj) {

   // Get the loanofferlist object from the PMILoanOffersResponse
   if(nil == servicesRespObj.responseError) {
      PMILoanOfferList *loanOfferList = servicesRespObj.loanOfferList;
      if (loanOfferList.offers) {
         NSArray *offers = servicesRespObj.loanOfferList.offers; 
      }
   } 
   else {
      // Log the error response
      PMIResponseError *error =  [servicesRespObj responseError];
          NSLog(@"Error Description = %@",[error getErrorDescription]);
          NSLog(@"Server Error code = %@",[error getServerErrorCode]);
      }
    }];
```

**Using Swift:**

```
PMIProspectOffersAPIService.getLoanOffers(borrowerInfo, withCompletionBlock: { 
(offersResponse:PMIProspectOffersResponse!) -> Void in
         self.loadingView.hidden = true
          
         if let offerList:PMILoanOfferList = offersResponse.loanOfferList {
        } 
    else {
         let alert:UIAlertView = UIAlertView(title: "Error",
            message:offersResponse.responseError.getErrorDescription(),
            delegate: nil,
            cancelButtonTitle: "Ok")
        alert.show()
     }

  })
```

The code above returns an Offers list object. The list contains different loan offers for which the user has been pre-approved. These offers range between different interest rates, APRs and length of term. It is up to your development team to determine the offers to display to the user. If the call is unsuccessful, you will receive an error from the PMILoanOffersAPIService.

### User selects loan offer
Once the user selects the offer, you pass the selected offer to the PMIBorrowerViewController, which will guide the user through the loan application process.

To access a particular offer by index, you can do something like this in the OffersCallback success. In the following code, the first offer has been selected:

**Using Objective C:**

```
PMILoanOffer *userSelectedoffer = [offers objectAtIndex:0];
PMIBorrowerViewController *controller = [[PMIBorrowerViewController alloc] initWithOffer: userSelectedoffer delegate:self];
   [self presentViewController:controller animated:YES completion:nil];
```

**Using Swift:**

```
  let offer:PMILoanOffer = offers[0] as! PMILoanOffer

  let viewController:OfferViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("OfferViewController") as! OfferViewController
        viewController.loanOffer = offer

  self.navigationController?.pushViewController(viewController, animated: true)
```



### User completes the Prosper loan offer
Pre-approved loan offers generated by the Prosper Borrower SDK require user consent and user acceptance of the Prosper Marketplace Terms and Conditions for the loan to become an active listing for funding. The Prosper Borrower SDK guides the user through the process, displaying Prosper Marketplace Terms and Conditions and requiring consent and acceptance as part of the user experience.

# Adding delegate methods
Your view controller should conform to the PMIBorrowerDelegate protocol and implement the delegate methods.

**Using Obejctive C:**

```
@interface PMIBorrowerViewController :UIViewcontroller <PMIBorrowerDelegate>  
  
@end
```

**Using Swift:**

```
class OfferViewController: UIViewController, PMIBorrowerDelegate {
}
```

Add the following PMIBorrowerDelegate method to your view controller. This method is called after the PMIBorrowerViewController is closed, giving status.

**Objective C:**

```
- (void)borrowerViewController:(PMIBorrowerViewController *)borrowerViewController loanProcessedStatus:(BorrowerLoanStatus)status
 {
   if(status == BorrowerLoanSuccess) {
       NSLog(@"Loan application was successfully processed.");
   } else if(status == PMIBorrowerLoanCancelled) {
       NSLog(@"Loan application process cancelled");
   } else if(status == BorrowerTimedOut) {
       NSLog(@"Loan process timed out due to an inactive user session");
   }
 }
```


**Using Swift:**

```
func borrowerViewController(borrowerViewController:PMIBorrowerViewController, loanProcessedStatus loanStatus:BorrowerLoanStatus) {
    var status:String = ""
      if loanStatus == PMIBorrowerLoanSuccess {
         status = "Loan application was successfully processed."
      } else if loanStatus == PMIBorrowerLoanCancelled {
         status = "Loan application process cancelled."
       } else if loanStatus == BorrowerTimedOut {
         status = "Loan process timed out due to an inactive user session."
    }
    
     let alert:UIAlertView = UIAlertView(title: "Alert",
        message: status,
        delegate: nil,
        cancelButtonTitle: "Cancel")
      alert.show()
      
      self.navigationController?.popToRootViewControllerAnimated(true)
}
```



# Sample app
A sample app can be found in the ProsperBorrowerSDKSample folder. The sample app demonstrates how to integrate the Prosper Borrower SDK. 

You can use the instructions within this guide to see how the SDK works. Remember to request app keys before trying out the sample app. You'll need them to run the sample app.

#Contact us
Do you have any questions, comments for us, or problems integrating the Prosper Borrower SDK into your app? 

Contact us at mobileSDK@prosper.com


#Legal notices
1.1 Confidential Information. The integrator of the SDK (“Integrator”) and their respective affiliates, directors, officers, employees, authorized representatives, agents and advisors shall keep confidential all information concerning proprietary business procedures, products, services, operations, software development kits (“SDKs”), marketing materials, fees, policies or plans and all Nonpublic Personal Information that is received or obtained from Prosper Marketplace Inc. (“Prosper”) prior to or during the integration relationship, whether such information is oral or written, and whether or not labeled as confidential (collectively “Confidential Information”). “Nonpublic Personal Information” shall include all personally identifiable financial information and any list, description or other grouping of consumers, and publicly available information pertaining to them, that is derived using any personally identifiable financial information that is not publicly available, and shall further include all “nonpublic personal information” as defined by federal regulations implementing the Gramm-Leach-Bliley Act, as amended from time to time. “Personally identifiable financial information” means any information a consumer provides to the Integrator or Prosper in order to obtain a financial product or service, any information Integrator or Prosper otherwise obtains about a consumer in connection with providing a financial product or service to that consumer, and any information about a consumer resulting from any transaction involving a financial product or service between the Integrator or Prosper and a consumer. Personally identifiable information may include, without limitation, a consumer's first and last name, physical address, zip code, email address, phone number, social security number, birth date, and any other information that itself identifies or when tied to the above information, may identify a consumer.

1.2 Use of Confidential Information. For as long as Confidential Information is in possession of the Integrator, the Integrator shall take reasonable steps, at least substantially equivalent to the steps it takes to protect its own proprietary information, to prevent the use, duplications or disclosure of Confidential Information, other than, by or to its employees or agents who are directly involved in integrating the Prosper SDKs and who are apprised of their obligations required by these Legal Notices and directed by the Integrator to treat such information confidentially, or except as required by law or by a supervising regulatory agency of the integrator. The Integrator shall not disclose, share, rent, sell or transfer to any third party any Confidential Information. The parties shall use Confidential Information only as necessary to perform the integration of the Prosper SDKs.  The Integrator shall treat any Nonpublic Personal Information that it receives from the other party in a manner that is fully compliant with the disclosing party's obligations under Title V of the Gramm-Leach-Bliley Act and any implementing regulations thereunder, including but not limited to applicable limits on the use, disclosure, storage, safeguarding and destruction of Nonpublic Personal Information.  In addition, to the extent that the Integrator receives Nonpublic Personal Information, the Integrator shall maintain commercially reasonable data security and disaster recovery protections that at the least are consistent with industry standards for the consumer lending industry.

1.3 Return of Information; Indemnity. Upon the termination or expiration of the integration of the Prosper SDKs, the Integrator shall promptly return all Confidential Information received in connection with the integration, or shall promptly destroy any materials containing such information (and any copies, extracts, and summaries thereof) and shall provide Prosper with written confirmation of such return or destruction upon request. In the event the Integrator discovers that Confidential Information has been used in an unauthorized manner or disclosed in violation of the Legal Notices, the Integrator discovering the unauthorized use or disclosure shall immediately notify Prosper of such event, and the Integrator of the Prosper SDKs shall indemnify and hold Prosper harmless from all claims, damage, liability, costs and expenses (including court costs and reasonable attorneys' fees) arising or resulting from the unauthorized use or disclosure. In addition, Prosper shall be entitled to all other remedies available at law or equity, including injunctive relief. 

2.1 Ownership.  Notwithstanding any other language or information within the SDK Integration Guide, the Integrator acknowledges and agrees that Prosper shall retain sole and exclusive ownership of the Prosper SDKs and related materials and all intellectual property rights therein.  Prosper acknowledges and agrees that the Integrator shall retain sole and exclusive ownership of the integrator’s background technology that existed prior to integration and all intellectual property rights therein.

2.2 Reservation of Rights.  Prosper and Integrator shall continue to own all rights, title and interest in and to its patents, know-how, trade secrets, software, trademarks and all other intellectual property, subject only to the license rights expressly granted herein.

3.1 SDK API Key and Secret Security.   When using the Prosper SDKs, the Integrator shall follow these specified essential security protocols.

3.1.1  The Integrator shall only use the API key and secret provided to you by Prosper; specifically, the Integrator shall not communicate with the SDK using keys or secrets that are not authorized by Prosper for your use.

3.1.2 THE INTEGRATOR IS SOLEY RESPONSIBLE FOR MAINTAINING ADEQUATE SECURITY AND CONTROL OF ANY API KEY AND SECRET COMBINATION PROVIDED TO YOU.  BECAUSE THE KEY AND SECRET ENSURE AUTHORIZED COMMUNICATIONS BETWEEN THE INTEGRATOR AND PROSPER, THE INTEGRATOR MUST PROTECT THE KEY AND SECRET, ALLOWING ONLY AUTHORIZED AND AUTHENTICATED ENTITIES, SUCH AS INDIVIDUALS, APIS, CODE, ETC., TO ACCESS THE KEY AND SECRET.

4.1 Indemnification by Integrator of Prosper SDKs.  Integrator shall indemnify, defend and hold Prosper harmless from and against any Claim that is attributable to or arises from (i) Integrator’s violation of any state or Federal law, rule or regulation, or any other illegal or actionable act or omission by or on behalf of Integrator; (ii) Integrator’s breach of any material obligation owed to Prosper; and (iii) any acts or omissions by Integrator, its employees or its agents, in connection with Integrator’s marketing efforts or efforts related to the protection of data privacy or security keys.  Integrator agrees to promptly pay and fully satisfy any and all losses, judgments or expenses, including, without limitation, costs of settlement and attorneys’ fees incurred or sustained, or reasonably likely to be incurred or sustained by Prosper as a result of any claims of the types described above.

4.2 Procedures.  Prosper shall: (i) promptly notify the Integrator in writing of any losses for which Prosper seeks indemnification; (ii) provide reasonable cooperation to the Integrator and its legal representatives in the investigation of any matter which is the subject of indemnification; and (iii) permit Integrator to have full control over the defense and settlement of any matter subject to indemnification; provided, however, that the Integrator shall not enter into any settlement that affects Prosper’s rights or interests without Prosper’s prior written consent, which shall not be unreasonably withheld or delayed.  Prosper shall have the right to participate in the defense at its expense.


