//
//  ProfileVC.swift
//  CMP_0.0
//
//  Created by Akshay's on 2/24/16.
//  Copyright © 2016 Akshay's. All rights reserved.
//

import UIKit
import Parse

class ProfileVC: UIViewController {

    @IBAction func logoutButtonAction(sender: UIButton) {
        
        PFUser.logOut()
        let viewController:UIViewController  = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("loginSignupNavController")
        self.presentViewController(viewController, animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
