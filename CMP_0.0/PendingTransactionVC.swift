//
//  PendingTransactionVC.swift
//  CMP_0.0
//
//  Created by Akshay's on 4/19/16.
//  Copyright © 2016 Akshay's. All rights reserved.
//

import UIKit
import Parse

class PendingTransactionVC: UIViewController {
    
    
    @IBOutlet weak var noPendingTransactionsTextField: UILabel!
    
    @IBOutlet weak var restaurantNameTextField: UILabel!
    
    
    var transactionId: String!
    
    var timer = NSTimer()
    
    
    func findPendingTransaction(){
        
        //        PFUser.currentUser()?.fetchInBackground()
        
        //
        let pendingTransactionId = PFUser.currentUser()?.objectForKey("pendingTransactionId")as! String!
        //
        let pendingTransactionQuery = PFQuery(className: "pendingTransaction")
        pendingTransactionQuery.getObjectInBackgroundWithId(pendingTransactionId){
            (pendingtransaction: PFObject?, error: NSError?) -> Void in
            if(error == nil && pendingtransaction != nil){
                
                let transactionID = pendingtransaction?.objectForKey("transactionid") as! String!
                if(transactionID == ""){
                    
                    print("No transaction ID FOUND")
                    
                }
                else{
                    
                    self.transactionId = transactionID
                    
                    self.timer.invalidate()
                    self.transactionFound()
                        
                        
                    
                }
                
                
                
            }
            
            
        }
        //
        //
        //
        //
        //        let transactionID = PFUser.currentUser()!.valueForKey("pendingTransaction")! as! String
        //
        //        if (transactionID == ""){
        //
        //
        //
        //        }
        //        else{
        //            print("found Transaction")
        //            print(PFUser.currentUser()!)
        //            print(transactionID)
        //            transactionFound()
        //
        //        }
        //
        
        
        
    }
    
    
    @IBOutlet weak var ApproveButtonUIButton: UIButton!
    
    
    @IBAction func ApproveButtonAction(sender: UIButton) {
        
        
        
        
        
        
        
        let transactionquery = PFQuery(className: "temptransaction")
        
        transactionquery.getObjectInBackgroundWithId(transactionId){
            (transaction: PFObject?, error: NSError?) -> Void in
            
            //  self.currentTransaction = transaction
            
            
            if(transaction == ""){
            
                
                
                let alertController = UIAlertController(title: "Transaction Expired", message:"Transaction limit expired.\nPlease try again.", preferredStyle: UIAlertControllerStyle.Alert)
                
                
                let transactionExpiredAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
                    UIAlertAction in
                    
                    
                    
                   
                    
                    let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("QRcodeVC")
                    self.presentViewController(viewController, animated: true, completion: nil)
                    
                }
                
                alertController.addAction(transactionExpiredAction)
                
                self.presentViewController(alertController, animated: true, completion: nil)

                
                
                
            }else{
            
                let approval = transaction?.objectForKey("approved")as! Bool!
                print("Found the transaction: ")
                print(transaction?.objectId as String!)
                
                if(!approval) {
                
                transaction?.setValue(true, forKey: "approved")
                transaction?.saveInBackground()
                
                    
                    let alertController = UIAlertController(title: "Transaction Successul", message:"Transaction Successfully Approved.", preferredStyle: UIAlertControllerStyle.Alert)
                    
                    
                    let transactionApprovedAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
                        UIAlertAction in
                        
                        let mealsLeftString = PFUser.currentUser()?.objectForKey("mealsLeft")as! String!
                        let mealsLeftInt = Int(mealsLeftString)
                        let mealsLeft = String(mealsLeftInt! - 1)
                        
                        PFUser.currentUser()?.setValue(mealsLeft, forKey: "mealsLeft")
                        
                        PFUser.currentUser()?.saveInBackground()
                        
                        
                        
                        
                        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("QRcodeVC")
                        self.presentViewController(viewController, animated: true, completion: nil)
                        
                    }
                    
                    alertController.addAction(transactionApprovedAction)
                    
                    self.presentViewController(alertController, animated: true, completion: nil)

                    
                }
                
                else{
                
                    let alertController = UIAlertController(title: "Invalid Transaction", message:"Transaction Already Approved.", preferredStyle: UIAlertControllerStyle.Alert)
                    
                    
                    let transactionApprovedAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
                        UIAlertAction in
                        
                        
                        
                        
                        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("QRcodeVC")
                        self.presentViewController(viewController, animated: true, completion: nil)
                        
                    }
                    
                    alertController.addAction(transactionApprovedAction)
                    
                    self.presentViewController(alertController, animated: true, completion: nil)
                
                }
            
            }
            
            
            
            
        }

        
        
    }
    
    
    @IBOutlet weak var DeclineButtonUIButton: UIButton!
    
    
    @IBAction func DeclineButtonAction(sender: AnyObject) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noTransaction()
        
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(PendingTransactionVC.findPendingTransaction), userInfo: nil, repeats: true)
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        self.timer.invalidate()
        
        super.viewWillDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
    func noTransaction(){
        
        noPendingTransactionsTextField.hidden = false
        restaurantNameTextField.hidden = true
        ApproveButtonUIButton.hidden = true
        DeclineButtonUIButton.hidden = true
        
    }
    
    
    func transactionFound(){
        
        noPendingTransactionsTextField.hidden = true
        restaurantNameTextField.hidden = false
        ApproveButtonUIButton.hidden = false
        DeclineButtonUIButton.hidden = false
        
    }
    
    func transactionApproved(){
        
        
        
    }
    
    
    
    
    
    
    
    
}
