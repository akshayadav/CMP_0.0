//
//  QRCodeVC.swift
//  CMP_0.0
//
//  Created by Akshay's on 2/29/16.
//  Copyright © 2016 Akshay's. All rights reserved.
//

import UIKit
import Parse

class QRCodeVC: UIViewController {

    @IBOutlet weak var QRCodeImageView: UIImageView!
    
    var QRCodeImage = CIImage!()
    
   // var QRImageString:String!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        generateQRCode()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
      
        
        
        
        generateQRCode()
        
//        print(PFUser.currentUser()!)
        
//        PFUser.currentUser()?.fetchInBackgroundWithBlock{
//                        (success: Bool, error: NSError?) -> Void in
//                        if(error != nil){print(error!.localizedDescription)}
//                        else{
//            
//                        }
//                    }

        
//        PFUser.currentUser()!.refreshInBackgroundWithBlock {
//            (success: PFObject, error: NSError?) -> Void in
//            if(error != nil){print(error!.localizedDescription)}
//            else{
//                
//            }
//        }
        
        super.viewWillAppear(animated)
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
    
    
    
    func generateQRCode(){
        
        print("gen QR Code ")
    
        
            
            print(PFUser.currentUser()!)
            
//            let stringToGenerateQR = "" + (PFUser.currentUser()!.valueForKey("fname")! as! String) + (PFUser.currentUser()!.valueForKey("lname")! as! String) + (PFUser.currentUser()!.objectId)! + (PFUser.currentUser()!.valueForKey("phonenumber")! as! String)+"meals:"+(PFUser.currentUser()!.valueForKey("mealsLeft")! as! String)
        
        let stringToGenerateQR = //"zPYcci2iQc"//"" + //(PFUser.currentUser()!.valueForKey("fname")! as! String) +
            //(PFUser.currentUser()!.valueForKey("lname")! as! String) +
            (PFUser.currentUser()!.objectId)! //+ (PFUser.currentUser()!.valueForKey("phonenumber")! as! String)+"meals:"+(PFUser.currentUser()!.valueForKey("mealsLeft")! as! String)
        
          //  QRImageString = stringToGenerateQR
            
            
            let data = stringToGenerateQR.dataUsingEncoding(NSISOLatin1StringEncoding, allowLossyConversion: false)
            
            let filter = CIFilter(name: "CIQRCodeGenerator")
            
            filter!.setValue(data, forKey: "inputMessage")
            filter!.setValue("H", forKey: "inputCorrectionLevel")
            
            QRCodeImage = filter!.outputImage//             .size = CGSize(width: 300, height: 300)
            
            
          //   QRCodeImageView.image = UIImage(CIImage: QRCodeImage)
            
            displayQRCodeImage()
            
    }
    
    func displayQRCodeImage() {
        let scaleX = QRCodeImageView.frame.size.width / QRCodeImage.extent.size.width
        let scaleY = QRCodeImageView.frame.size.height / QRCodeImage.extent.size.height
        
        let transformedImage = QRCodeImage.imageByApplyingTransform(CGAffineTransformMakeScale(scaleX, scaleY))
        
        QRCodeImageView.image = UIImage(CIImage: transformedImage)
        
        
    }

}
