//
//  WelcomeViewController.swift
//  ProsperSDKSwiftSample
//
///  Copyright © 2015 Prosper Funding, LLC, All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIAlertViewDelegate, PMIBorrowerDelegate{

    @IBOutlet weak var documentationLabel: UILabel!
    @IBOutlet weak var userTextLabel: UILabel!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var descriptionTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 247/255, green: 147/255, blue:42/255, alpha: 1.0)
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        //self.navigationController?.navigationBar.hidden = true
        
        
        let paragrapStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        paragrapStyle.alignment = NSTextAlignment.Left
        paragrapStyle.lineSpacing = 4
        paragrapStyle.minimumLineHeight = 18
        
        let attributes = [ NSParagraphStyleAttributeName:paragrapStyle]
        
        let descriptionText = "Let your users apply for a loan through Prosper from your app.\n\nOption 1 : Pass user data to Prosper to present personalized loan offers within your app."
        
        let descriptionAttrText = NSAttributedString(string: descriptionText, attributes: attributes) //1
        self.descriptionTextLabel.attributedText = descriptionAttrText
        
        
        let newUserText = "Option 2 : If you do not want to collect user data to generate offers, allow the SDK to collect user data"
        " and display peronalized offers."
        let userTextLabelText = NSAttributedString(string: newUserText, attributes: attributes) //1
        self.userTextLabel.attributedText = userTextLabelText
        
        
        let documentationText = "To learn more, refer to the Prosper SDK documentation."
        self.documentationLabel.attributedText = NSAttributedString(string: documentationText, attributes: attributes)
        
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.hidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getOffersButtonClicked(sender: AnyObject) {
        let alert:UIAlertView = UIAlertView(title: "Alert",
            message: "Your personal information is shared for applying a Prosper Loan. Do you want to continue?",
            delegate: self,
            cancelButtonTitle: "Cancel")
        alert.addButtonWithTitle("Ok")
        alert.show()
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        let buttonTitle = alertView.buttonTitleAtIndex(buttonIndex)
        if buttonTitle == "Ok" {
            // Below are the 13 fields that needs to be passed as part of borrower information.
            let borrowerInfo:PMIBorrowerInfo = PMIBorrowerInfo.init()
            
            // 1
            borrowerInfo.loanAmount = 5000
            
            // 2
            borrowerInfo.loanPurposeId = PMIHomeImprovement.rawValue
            
            // 3
            borrowerInfo.creditRangeId = PMIExcellentCredit.rawValue
            
            // 4
            borrowerInfo.firstName = "Mary"
            
            // 5
            borrowerInfo.lastName = "Hopkins"
            
            // 6
            borrowerInfo.dateOfBirth = "03/22/1984"
            
            // 7
            borrowerInfo.address1 = "912 PINELAND AVE APT 33"
            
            // 8
            borrowerInfo.city = "Hinesville"
            
            // 9
            borrowerInfo.state = "GA"
            
            // 10
            borrowerInfo.zipCode = "31313"
            
            // 11
            borrowerInfo.employmentStatusId = PMIEmployed.rawValue
            
            // 12
            borrowerInfo.annualIncome = 100000
            
            // 13
            let randomNumber = arc4random_uniform(10000)
            borrowerInfo.email = String(format:"TestUser20151019%d@gmail.com", randomNumber)
            
            // Optional fields
            
            borrowerInfo.primaryPhoneNumber = "4088029656"
            borrowerInfo.secondaryPhoneNumber = "4088029658"
            
            borrowerInfo.employerName = "Employer Name"
            borrowerInfo.employerPhoneNumber = "4088029876"
            borrowerInfo.workPhoneNumber = "4088029878"
            
            borrowerInfo.employerStartDate = "04/2010"
            borrowerInfo.occupationType = PMIDoctor.rawValue
            
            borrowerInfo.ssnNumber = "123456786"
            
            borrowerInfo.bankAccountNumber = "32423435345435"
            
            borrowerInfo.bankRoutingNumber = "121000248"
            
            
            self.loadingView.hidden = false
            
            PMIProspectOffersAPIService.getLoanOffers(borrowerInfo, withCompletionBlock: { (offersResponse:PMIProspectOffersResponse!) -> Void in
                self.loadingView.hidden = true
                
                if let offerList:PMILoanOfferList = offersResponse.loanOfferList {
                     if let offers = offerList.offers {
                        let offer:PMILoanOffer = offers[0] as! PMILoanOffer
                        
                        let viewController:OfferViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("OfferViewController") as! OfferViewController
                        viewController.loanOffer = offer
                        
                        self.navigationController?.pushViewController(viewController, animated: true)

                    }
                } else {
                    let alert:UIAlertView = UIAlertView(title: "Error",
                        message:offersResponse.responseError.getErrorDescription(),
                        delegate: nil,
                        cancelButtonTitle: "Ok")
                    alert.show()
                }

            })
        
        }
    }
    

    @IBAction func prosperFunnelButtonClicked(sender: AnyObject) {
        let borrowerViewController =  PMIBorrowerViewController.init(details: nil, delegate: self)
        self.presentViewController(borrowerViewController, animated: true, completion: nil)
    
    }
    
    func borrowerViewController(borrowerViewController:PMIBorrowerViewController, loanProcessedStatus loanStatus:BorrowerLoanStatus) {
        var status:String = ""
        if loanStatus == PMIBorrowerLoanSuccess {
            status = "Loan is successfully processed."
        } else if loanStatus == PMIBorrowerLoanCancelled {
            status = "Loan is cancelled."
        } else if loanStatus == PMIBorrowerTimedOut {
            status = "Loan Process got timed out due to inactive user session."
        }
        
        let alert:UIAlertView = UIAlertView(title: "Alert",
            message: status,
            delegate: nil,
            cancelButtonTitle: "Cancel")
        alert.show()
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
