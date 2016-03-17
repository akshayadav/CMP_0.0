//
//  TodayVC.swift
//  CMP_0.0
//
//  Created by Akshay's on 2/26/16.
//  Copyright © 2016 Akshay's. All rights reserved.
//

import Foundation
import UIKit
import Social
import Parse





class TodayVC: UIViewController {

    @IBOutlet weak var todayRestaurantsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tabBarItems = self.tabBarController?.tabBar.items
        let QRItem = tabBarItems![1]
        
        
        print(PFUser.currentUser())
        if((PFUser.currentUser()?.objectForKey("isProUser"))! as! NSObject == 1){
            print("reaching here")
            QRItem.enabled = true
            
        }
        // this code is here because QRCodeVC cannot reach it
        
        
        
        //-----------------------------------------------------
        

        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
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
