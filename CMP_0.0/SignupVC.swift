//
//  SignupVC.swift
//  CMP_0.0
//
//  Created by Akshay's on 2/24/16.
//  Copyright © 2016 Akshay's. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {

    @IBOutlet weak var fnameTextField: UITextField!
    
    @IBOutlet weak var lnameTextField: UITextField!
    
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        self.navigationItem.title = "create account"
        super.viewDidAppear(animated)
    }
    
    func changeBackButtonTitle(){
        self.navigationItem.title = ""
    }
    
    
    @IBAction func continueButtonPressed(sender: UIButton) {

        checkAllEntries()
        
    }
    
    
    
    func isValidEntry(testStr:String, regEx:String) -> Bool {
        
        let stringTest = NSPredicate(format:"SELF MATCHES %@", regEx)
        return stringTest.evaluateWithObject(testStr)
    }
    
    
    func checkFname() -> Bool{
       return isValidEntry(fnameTextField.text!, regEx: "^[a-zA-Z]+$")
    }
    
    func checkLname() -> Bool{
        return isValidEntry(lnameTextField.text!, regEx: "^[a-zA-Z]+$")
    }
    
    func checkPhoneNumber()->Bool{
        return isValidEntry(phoneNumberTextField.text!, regEx: "^[0-9]{10}$")
    }
    
    func checkAllEntries(){
    
        if(checkFname()){
            if(checkLname()){
                if(checkPhoneNumber()){
                   // print("Everything Looks Good")
                    
                    
                    movingOntoNextPage()
                    
                    
                }
                else{showAlert("Phone Number")}
            }
            else{showAlert("Last Name")}
        }
        else{showAlert("First Name") }
    }
    
    
    
    
    func showAlert(textFieldName: String){
        
        let alertController = UIAlertController(title: "Invalid Entry!", message:
            textFieldName.stringByAppendingString(" has invalid entry."), preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func movingOntoNextPage(){
        changeBackButtonTitle()
        performSegueWithIdentifier("signup1ToSignup2", sender: self)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
       
        let destinationVC = segue.destinationViewController as! SignUp2VC
        destinationVC.fname = fnameTextField.text
        destinationVC.lname = lnameTextField.text
        destinationVC.phoneNumber = phoneNumberTextField.text
    
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