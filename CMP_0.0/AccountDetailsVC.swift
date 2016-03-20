//
//  AccountDetailsVC.swift
//  CMP_0.0
//
//  Created by Akshay's on 3/19/16.
//  Copyright © 2016 Akshay's. All rights reserved.
//

import UIKit
import Parse

class AccountDetailsVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    
    
    
    var userDetails:[String] = [String]()
    var detailLabels:[String] = ["Username", "Name", "Phone Number", "Email", "pro Member", "Meals Left"]
    
   
    @IBOutlet weak var accountDetailsTableView: UITableView!
    
    override func viewDidLoad() {
        
        
    
        
        userDetails = [PFUser.currentUser()!.username!,(PFUser.currentUser()!.valueForKey("fname")! as! String) + " " + (PFUser.currentUser()!.valueForKey("lname")! as! String), PFUser.currentUser()!.valueForKey("phonenumber")! as! String, PFUser.currentUser()!.email!, isProUser(), PFUser.currentUser()!.valueForKey("mealsLeft")! as! String]
            
        
        
        
        super.viewDidLoad()
        
        accountDetailsTableView.reloadData()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func isProUser()->String{
        if (PFUser.currentUser()!.valueForKey("isProUser")! as! Bool){
            return "Yes"
        
        }
        else{
            return "No"
        }
    
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("accountDetailCell", forIndexPath: indexPath)as! AccountDetailTableViewCell
        
        
            cell.accountDetailLabel.text = userDetails[indexPath.row]
            cell.accountDetailName.text = detailLabels[indexPath.row]
        
        
        
            return cell
    
    
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userDetails.count
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
