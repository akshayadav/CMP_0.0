//
//  RestaurantDetail.swift
//  CMP_0.0
//
//  Created by Akshay's on 3/17/16.
//  Copyright © 2016 Akshay's. All rights reserved.
//

import UIKit
import Parse


class RestaurantDetail: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var DishTableView: UITableView!
    
    var listOfDishes:[Dish] = [Dish]()
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listOfDishes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "DishTableCell"
        
        let dish = listOfDishes[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! DishTableViewCell
//
        cell.dishName.text = dish.DishName
        cell.dishImage.image = dish.DishImage
        cell.ingredientsText.text = dish.DishIngredients
//        cell.restaurantImage.image = restaurant.restaurantImage
        
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
     
    }

    
    
    
    
    
    
    var selectedRestaurantsID:String?
    
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var restaurantAddress: UILabel!
    @IBOutlet weak var restaurantPhone: UILabel!
    @IBOutlet weak var restaurantImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getRestaurant()
        getDishes()
        
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
                self.restaurantAddress.text = post!["address"]as? String
                self.restaurantPhone.text = post!["phonenumber"]as? String
                
                
            }
            else{
                print(error!.localizedDescription)
            }
        
        }
        
    
    }
    
    func getDishes(){
        let query = PFQuery(className: "Dish")
        query.findObjectsInBackgroundWithBlock {
            
            (posts: [PFObject]?, error:NSError?)-> Void in
            
            if(error == nil){
                
                for post in posts!{
                    
                    if(post["restaurantID"]as! String! == self.selectedRestaurantsID!){
                    
                      //  print(post["dishName"])
                        
                        
                        var DishImage:UIImage!
                        
                        post["DishImage"].getDataInBackgroundWithBlock{
                            (imageData: NSData?, error: NSError?) -> Void in
                            
                            if(error == nil){
                                DishImage = UIImage(data: imageData!)!
                                
                                
                            }
                            else{
                                DishImage = UIImage(named: "imageUnavailableTemp.png")
                                print(error!.localizedDescription)
                            }
                            
                            var ingredients:String! = ""
                            let ingredientsArray:[String] = post["ingredients"] as! [String]
                            
                            for ingredient in ingredientsArray{
                                ingredients = ingredients + ingredient + ", "
                            }
                            
                            let dish = Dish(DishName: post["dishName"] as! String, DishImage: DishImage as UIImage, DishIngredients: ingredients )
                            
                            self.listOfDishes.append(dish)
                            
                            self.DishTableView.reloadData()
                        
                    }
                    
                }
                
            }
            }
            else{
                print(error!.localizedDescription)
            }
        }
    }
    

}
