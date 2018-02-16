//
//  WelcomeViewController.swift
//  ProsperSDKSwiftSample
//
///  Copyright © 2015 Prosper Funding, LLC, All rights reserved.
//

import UIKit
import ProsperBorrowerSDK

class WelcomeViewController: UIViewController, UIAlertViewDelegate, PMIBorrowerDelegate{

    @IBOutlet weak var documentationLabel: UILabel!
    @IBOutlet weak var userTextLabel: UILabel!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var descriptionTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 247/255, green: 147/255, blue:42/255, alpha: 1.0)
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        
        //self.navigationController?.navigationBar.hidden = true
        
        
        let paragrapStyle = NSMutableParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        paragrapStyle.alignment = NSTextAlignment.left
        paragrapStyle.lineSpacing = 4
        paragrapStyle.minimumLineHeight = 18
        
        let attributes = [ NSParagraphStyleAttributeName:paragrapStyle]
        
        let descriptionText = "Let your users apply for a loan through Prosper from your app.\n\nOption 1 : Pass user data to Prosper to present personalized loan offers within your app."
        
        let descriptionAttrText = NSAttributedString(string: descriptionText, attributes: attributes) //1
        self.descriptionTextLabel.attributedText = descriptionAttrText
        
        
        let newUserText = "Option 2 : If you do not want to collect user data to generate offers, allow the SDK to collect user data and display peronalized offers."
        let userTextLabelText = NSAttributedString(string: newUserText, attributes: attributes) //1
        self.userTextLabel.attributedText = userTextLabelText
        
        
        let documentationText = "To learn more, refer to the Prosper SDK documentation."
        self.documentationLabel.attributedText = NSAttributedString(string: documentationText, attributes: attributes)
        
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getOffersButtonClicked(_ sender: AnyObject) {
        let alert = UIAlertController(title: "Error",
                                      message: "Your personal information is shared for applying a Prosper Loan. Do you want to continue?",
                                      preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil))
        
        // Replace UIAlertActionStyle.Default by UIAlertActionStyle.default
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("OK")
            self.okClicked()
        }
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func okClicked(){
                  // Below are the 13 fields that needs to be passed as part of borrower information.
            let borrowerInfo:PMIBorrowerInfo = PMIBorrowerInfo.init()
            
            // 1
            borrowerInfo.loanAmount = 5000
            
            // 2
            borrowerInfo.loanPurposeId = PMIHomeImprovement.rawValue
            
            // 3
            borrowerInfo.creditRangeId = PMIExcellentCredit.rawValue
            
            // 4
            borrowerInfo.firstName = "MONISE"

            // 5
            borrowerInfo.lastName = "KELLY"

            // 6
            borrowerInfo.dateOfBirth = "01/01/1965"

            // 7
            borrowerInfo.address1 = "14511 STAR CROSS TRL"

            // 8
            borrowerInfo.city = "HELOTES"

            // 9
            borrowerInfo.state = "TX"

            // 10
            borrowerInfo.zipCode = "780234050"
            
            // 11
            borrowerInfo.employmentStatusId = PMIEmployed.rawValue
            
            // 12
            borrowerInfo.annualIncome = 100000
            
            // 13
            let randomNumber = arc4random_uniform(10000)
            borrowerInfo.email = String(format:"TestMonise%d@c1.dev", randomNumber)
            
            // Optional fields
            
            borrowerInfo.primaryPhoneNumber = "4088029623"
            borrowerInfo.secondaryPhoneNumber = "4088029625"
            
            borrowerInfo.employerName = "Employer Name"
            borrowerInfo.employerPhoneNumber = "4088029876"
            borrowerInfo.workPhoneNumber = "4088029878"
            
            borrowerInfo.employerStartDate = "04/2010"
            borrowerInfo.occupationType = PMIDoctor.rawValue
            
            borrowerInfo.ssnNumber = "666302683"
            
            borrowerInfo.bankAccountNumber = "32423435345435"
            
            borrowerInfo.bankRoutingNumber = "121000248"
            
            
            self.loadingView.isHidden = false
            
            PMIProspectOffersAPIService.getLoanOffers(borrowerInfo, withCompletionBlock: { (offersResponse) in
                self.loadingView.isHidden = true
                
                if let offerList:PMILoanOfferList = offersResponse?.loanOfferList {
                    if let offers = offerList.offers {
                        let offer:PMILoanOffer = offers[0] as! PMILoanOffer
                        
                        let viewController:OfferViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OfferViewController") as! OfferViewController
                        viewController.loanOffer = offer
                        
                        self.navigationController?.pushViewController(viewController, animated: true)
                        
                    }
                } else {
                    
                    let alert = UIAlertController(title: "Error", message: offersResponse!.responseError.getDescription(), preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    
                }
            })
    }
    

    @IBAction func prosperFunnelButtonClicked(_ sender: AnyObject) {
        let borrowerViewController =  PMIBorrowerViewController.init(details: nil, delegate: self)
        self.present(borrowerViewController!, animated: true, completion: nil)
    
    }
    
    func borrowerViewController(_ borrowerViewController:PMIBorrowerViewController, loanProcessedStatus loanStatus:BorrowerLoanStatus) {
        var status:String = ""
        if loanStatus == PMIBorrowerLoanSuccess {
            status = "Loan is successfully processed."
        } else if loanStatus == PMIBorrowerLoanCancelled {
            status = "Loan is cancelled."
        } else if loanStatus == PMIBorrowerTimedOut {
            status = "Loan Process got timed out due to inactive user session."
        }
        
        let alert = UIAlertController(title: "Alert",
                                      message: status,
                                      preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
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
