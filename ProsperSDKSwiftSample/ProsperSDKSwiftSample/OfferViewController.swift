//
//  OfferViewController.swift
//  ProsperSDKSwiftSample
//
//  Copyright © 2015 Prosper Funding, LLC, All rights reserved.
//

import UIKit


class OfferViewController: UIViewController, PMIBorrowerDelegate {

    var loanOffer:PMILoanOffer!

    @IBOutlet weak var loadingView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "handleTap:")
        self.view.addGestureRecognizer(tapGesture)
        self.navigationController?.navigationBar.hidden = true

        // Do any additional setup after loading the view.
    }
    
    func handleTap(gestureRecognizer: UIGestureRecognizer) {
        // handling code
        let borrowerViewController =  PMIBorrowerViewController.init(offer: loanOffer, delegate: self)
        self.presentViewController(borrowerViewController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
        self.navigationController?.popToRootViewControllerAnimated(true)
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
