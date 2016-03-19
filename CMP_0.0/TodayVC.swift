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





class TodayVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var todayAndAllSegmentedControl: UISegmentedControl!
    
    var listOfRestaurantsForToday:[Restaurant] = [Restaurant]()
    
    var listOfOtherRestaurants:[Restaurant] = [Restaurant]()
    
    var restaurantIDSelectedByClickingCell: String?
    
    @IBOutlet weak var todayRestaurantsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tabBarItems = self.tabBarController?.tabBar.items
        let QRItem = tabBarItems![1]
        
        downloadRestaurantsFromParse()
        
//        print(PFUser.currentUser())
        if((PFUser.currentUser()?.objectForKey("isProUser"))! as! NSObject == 1){
            print("reaching here")
            QRItem.enabled = true
            
        }
        // this code is here because QRCodeVC cannot reach it
        
        
        
        //-----------------------------------------------------
        

        // Do any additional setup after loading the view.
        
         todayRestaurantsTableView.delegate = self
         todayRestaurantsTableView.dataSource = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("this is count: ")
        print(listOfRestaurantsForToday.count)
        
        if(todayAndAllSegmentedControl.selectedSegmentIndex == 0){
            return self.listOfRestaurantsForToday.count
        }
        else{
            
            return self.listOfRestaurantsForToday.count + self.listOfOtherRestaurants.count
        }
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "restaurantTableViewCell"
        let restaurant:Restaurant!
        if(todayAndAllSegmentedControl.selectedSegmentIndex==0){
            restaurant = listOfRestaurantsForToday[indexPath.row]
            
            
        }
        else{
            let allRestaurants = listOfRestaurantsForToday + listOfOtherRestaurants
            
            restaurant = allRestaurants[indexPath.row]
        }
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! restaurantTableViewCell
        
        cell.restaurantName.text = restaurant.restaurantName
        cell.restaurantImage.image = restaurant.restaurantImage
        
        
        return cell
        
        
        
        
        
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if(todayAndAllSegmentedControl.selectedSegmentIndex == 0){
            
            restaurantIDSelectedByClickingCell = listOfRestaurantsForToday[indexPath.row].restaurantID
        }
        else{
            let allRestaurants = listOfRestaurantsForToday + listOfOtherRestaurants
            restaurantIDSelectedByClickingCell = allRestaurants[indexPath.row].restaurantID
        }
        
        performSegueWithIdentifier("restaurantToRestaurantDetail", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        
        let destinationVC = segue.destinationViewController as! RestaurantDetail
        destinationVC.selectedRestaurantsID = restaurantIDSelectedByClickingCell
        
    }
    
    
    
    func downloadRestaurantsFromParse(){
        let query = PFQuery(className: "Restaurant")
        query.findObjectsInBackgroundWithBlock {
            
            (posts: [PFObject]?, error:NSError?)-> Void in
            
            if(error == nil){
                
                for post in posts!{
                    
                    
                    if(post[self.todaysDay()]as! Bool){
                    
                    
                    var restaurantImage:UIImage!
                    
                    post["restaurantImage"].getDataInBackgroundWithBlock{
                        (imageData: NSData?, error: NSError?) -> Void in
                        
                        if(error == nil){
                            restaurantImage = UIImage(data: imageData!)!
                            
                            
                        }
                        else{
                            restaurantImage = UIImage(named: "imageUnavailableTemp.png")
                            print(error!.localizedDescription)
                        }
                        
                        let restaurant = Restaurant(restaurantName: post["restaurantName"] as! String, restaurantImage: restaurantImage as UIImage, restaurantID: post.objectId as String!)
                        
                        self.listOfRestaurantsForToday.append(restaurant)
                        
                        self.todayRestaurantsTableView.reloadData()
                    
                    }
                }
                    else{
                        //'post' which does not serve today.
                        
                        
                        
                        var restaurantImage:UIImage!
                        
                        post["restaurantImage"].getDataInBackgroundWithBlock{
                            (imageData: NSData?, error: NSError?) -> Void in
                            
                            if(error == nil){
                                restaurantImage = UIImage(data: imageData!)!
                                
                                
                            }
                            else{
                                restaurantImage = UIImage(named: "imageUnavailableTemp.png")
                                print(error!.localizedDescription)
                            }
                            
                            let restaurant = Restaurant(restaurantName: post["restaurantName"] as! String, restaurantImage: restaurantImage as UIImage, restaurantID: post.objectId as String!)
                            
                            self.listOfOtherRestaurants.append(restaurant)
                            
                            self.todayRestaurantsTableView.reloadData()
                            
                        }
                        
                        
                    }
                
                }
                
            }
                
            else{
            
                print(error!.localizedDescription)
            
            }
        
        }
        
    
    
    }
    
    
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    func todaysDay() -> String{
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let dayOfWeekString = dateFormatter.stringFromDate(NSDate())
        return dayOfWeekString
//        
//        let today = NSDate()
//        let myCalendar = NSCalendar.init(calendarIdentifier: NSCalendarIdentifierGregorian)
//        let todaysDay = myCalendar!.component(NSCalendarUnit.Weekday , fromDate: today)
//        print(todaysDay)
    }
    
    
    @IBAction func todayAndAllSegmentedControlAction(sender: UISegmentedControl) {
        
        
        self.todayRestaurantsTableView.reloadData()
        
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
