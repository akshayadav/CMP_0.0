//
//  LaunchVC.swift
//  CMP_0.0
//
//  Created by Akshay's on 2/23/16.
//  Copyright © 2016 Akshay's. All rights reserved.
//

import UIKit
import Parse

class LaunchVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
       _ =  NSTimer.scheduledTimerWithTimeInterval(3.0, target:self, selector: Selector("gotoAppropriateScreen"), userInfo: nil, repeats: false)
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func gotoAppropriateScreen(){
        
        let viewController:UIViewController
    
        if PFUser.currentUser() == nil{
            
           viewController  = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("loginSignupNavController")

        
        }
        else{
            viewController  = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("firstNavController")

        }
        self.presentViewController(viewController, animated: true, completion: nil)

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
