//
//  QRCodeVC.swift
//  CMP_0.0
//
//  Created by Akshay's on 2/29/16.
//  Copyright © 2016 Akshay's. All rights reserved.
//

import UIKit

class QRCodeVC: UIViewController {

    @IBOutlet weak var QRCodeImageView: UIImageView!
    
    var QRCodeImage = CIImage!()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateQRCode()

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
    
    
    
    func generateQRCode(){
        
        print("gen QR Code ")
    
        if QRCodeImage == nil {
            
            
            let data = "AKSHAY YADAV CODE TESTING 123".dataUsingEncoding(NSISOLatin1StringEncoding, allowLossyConversion: false)
            
            let filter = CIFilter(name: "CIQRCodeGenerator")
            
            filter!.setValue(data, forKey: "inputMessage")
            filter!.setValue("Q", forKey: "inputCorrectionLevel")
            
            QRCodeImage = filter!.outputImage
            
             QRCodeImageView.image = UIImage(CIImage: QRCodeImage)
            
        }
    }

}
