//
//  ProfileVC.swift
//  CMP_0.0
//
//  Created by Akshay's on 2/24/16.
//  Copyright © 2016 Akshay's. All rights reserved.
//

import UIKit
import Parse

class ProfileVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var accountItems:[String] = ["Profile Settings","My Restaurants", "Add Meals"]
    var otherStuff:[String] = ["Help & Support", "Terms of Use and Privacy Policy", "Logout"]
    
    
    @IBOutlet weak var account: UITableView!
    
    
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 2
    }
    
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0){
            return "Account"
        }
            
        else{
            return "Other Stuff"
        }
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("accountCell", forIndexPath: indexPath)
        
        if (indexPath.section == 0 ){
        
            cell.textLabel?.text = accountItems[indexPath.row]
        
        
        }
        else{
            cell.textLabel?.text = otherStuff[indexPath.row]
            print(indexPath.row)
        }
        
        return cell
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){return accountItems.count}
        else {return otherStuff.count}
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(indexPath.section == 0){
            if(indexPath.row == 0 ){
                performSegueWithIdentifier("profileToAccountDetails", sender: self)
            }
        }
        else{
            if(indexPath.row == otherStuff.count - 1 ){
                logoutButtonAction()
            }
        
        }
    }
    
    

    func logoutButtonAction() {
        
        PFUser.logOut()
        let viewController:UIViewController  = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("loginSignupNavController")
        self.presentViewController(viewController, animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        account.reloadData()

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

}
