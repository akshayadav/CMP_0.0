//
//  LoginVC.swift
//  CMP_0.0
//
//  Created by Akshay's on 2/24/16.
//  Copyright © 2016 Akshay's. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController!.navigationBar.backgroundColor = UIColor.clearColor()
        
        
      //  navigationController!.navigationBar.barTintColor = UIColor.clearColor()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        navigationController?.navigationBarHidden = true
        super.viewDidAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
//    
//    override func viewWillDisappear(animated: Bool) {
//        navigationController?.navigationBarHidden = true
//        super.viewWillDisappear(true)
//        
//        
//    }
   
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
