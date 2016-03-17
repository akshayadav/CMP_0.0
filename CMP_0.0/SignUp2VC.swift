//
//  SignUp2VC.swift
//  CMP_0.0
//
//  Created by Akshay's on 3/10/16.
//  Copyright © 2016 Akshay's. All rights reserved.
//

import UIKit

class SignUp2VC: UIViewController {
    
    var fname: String?
    var lname: String?
    var phoneNumber: String?
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
  
    func isValidEmail(testStr:String) -> Bool {
        // println("validate calendar: \(testStr)")
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(testStr)
    }
    
    func matchPasswordAndConfirmPassword()->Bool{
        if(passwordTextField.text == confirmPasswordTextField.text){
            return true;
        }
        else{
            
            let alertController = UIAlertController(title: "Password not confirmed", message:"Password does not match confirmation.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
            return false
        }
    }

    
    
    @IBAction func signupButtonPressed(sender: UIButton) {
   
        if(isValidEmail(emailTextField.text!)){
            if(matchPasswordAndConfirmPassword()){
                signUp()
            }
        }
        
    
    
    }
    
    
    
    //---------
    
    func signUp(){
    
    
    
    // Run a spinner to show a task in progress
    let spinner: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0, 0, 150, 150)) as UIActivityIndicatorView
    spinner.startAnimating()
    
    let newUser = PFUser()
    
    newUser.username = emailTextField.text
    newUser.password = passwordTextField.text
    newUser.email = emailTextField.text
    newUser.setObject(self.fname!, forKey: "fname")
    newUser.setObject(self.lname!, forKey: "lname")
    newUser.setObject(self.phoneNumber!, forKey: "phonenumber")
        
        
    
    // Sign up the user asynchronously
    newUser.signUpInBackgroundWithBlock({ (succeed, error) -> Void in
    
    // Stop the spinner
    spinner.stopAnimating()
    if ((error) != nil) {
    
        let alertController = UIAlertController(title: "Error", message:"\(error?.localizedDescription)", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    } else {
        
        
            let alertController = UIAlertController(title: "Success!", message:"Signed Up", preferredStyle: UIAlertControllerStyle.Alert)
        
        
        let signupSuccessAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) {
            UIAlertAction in
            
                    let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("firstNavController")
                    self.presentViewController(viewController, animated: true, completion: nil)
            
        }
        
            alertController.addAction(signupSuccessAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
      
        
        
        
//        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("firstNavController")
//        self.presentViewController(viewController, animated: true, completion: nil)

        
        
//        dispatch_async(dispatch_get_main_queue(), { () -> Void in
//            let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("firstNavController")
//            self.presentViewController(viewController, animated: true, completion: nil)
//        })
//
        
            }
        })
    }
    
    //---------
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
