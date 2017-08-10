//
//  OfferViewController.swift
//  ProsperSDKSwiftSample
//
//  Copyright © 2015 Prosper Funding, LLC, All rights reserved.
//

import UIKit
import ProsperBorrowerSDK

class OfferViewController: UIViewController, PMIBorrowerDelegate {

    var loanOffer:PMILoanOffer!

    @IBOutlet weak var loadingView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(OfferViewController.handleTap(_:)))
        self.view.addGestureRecognizer(tapGesture)
        self.navigationController?.navigationBar.isHidden = true

        // Do any additional setup after loading the view.
    }
    
    func handleTap(_ gestureRecognizer: UIGestureRecognizer) {
        // handling code
        let borrowerViewController =  PMIBorrowerViewController.init(offer: loanOffer, delegate: self)
        self.present(borrowerViewController!, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
        
        _=navigationController?.popToRootViewController(animated: true)
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
