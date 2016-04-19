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
    
    @IBOutlet weak var RefreshUIButton: UIButton!
    
    
    @IBAction func RefreshButtonAction(sender: UIButton) {
        
        PFUser.currentUser()?.fetchInBackground()
        
        
        let transactionID = PFUser.currentUser()!.valueForKey("pendingTransaction")! as! String
        
        if (transactionID == ""){
            
            
            
        }
        else{
            print("found Transaction")
            print(PFUser.currentUser()!)
            print(transactionID)
            transactionFound()
            
        }

        
        
        
    }
    
    
    @IBOutlet weak var ApproveButtonUIButton: UIButton!
    
    
    @IBAction func ApproveButtonAction(sender: UIButton) {
    }
    
    
    @IBOutlet weak var DeclineButtonUIButton: UIButton!
    
    
    @IBAction func DeclineButtonAction(sender: AnyObject) {
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        noTransaction()
        RefreshButtonAction(RefreshUIButton)
        
        
        
        
        
        // Do any additional setup after loading the view.
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
        RefreshUIButton.hidden = false
        restaurantNameTextField.hidden = true
        ApproveButtonUIButton.hidden = true
        DeclineButtonUIButton.hidden = true
    
    }
    
    
    func transactionFound(){
        
        noPendingTransactionsTextField.hidden = true
        RefreshUIButton.hidden = true
        restaurantNameTextField.hidden = false
        ApproveButtonUIButton.hidden = false
        DeclineButtonUIButton.hidden = false
    
    }
    
    
    
    
    
    
    
    

}
