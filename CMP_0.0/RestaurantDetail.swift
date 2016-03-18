//
//  RestaurantDetail.swift
//  CMP_0.0
//
//  Created by Akshay's on 3/17/16.
//  Copyright © 2016 Akshay's. All rights reserved.
//

import UIKit
import Parse


class RestaurantDetail: UIViewController {
    
    var selectedRestaurantsID:String?
    
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var restaurantAddress: UILabel!
    @IBOutlet weak var restaurantPhone: UILabel!
    @IBOutlet weak var restaurantImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getRestaurant()
        
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
    
    func getRestaurant(){
    
        let query = PFQuery(className: "Restaurant")
        query.getObjectInBackgroundWithId(selectedRestaurantsID!){
            
            (post:PFObject?, error:NSError?)-> Void in
            if error == nil && post != nil {
                
                
                
                
                
                post!["restaurantImage"].getDataInBackgroundWithBlock{
                    (imageData: NSData?, error: NSError?) -> Void in
                    
                    if(error == nil){
                        self.restaurantImage.image = UIImage(data: imageData!)!
                        
                        
                    }
                    else{
                        self.restaurantImage.image = UIImage(named: "imageUnavailableTemp.png")
                        print(error!.localizedDescription)
                    }
                }
                
                self.restaurantName.text = post!["restaurantName"]as? String
                
                
                
            }
            else{
                print(error!.localizedDescription)
            }
        
        }
        
    
    }

}
