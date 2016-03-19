//
//  Dish.swift
//  CMP_0.0
//
//  Created by Akshay's on 3/19/16.
//  Copyright © 2016 Akshay's. All rights reserved.
//

import Foundation

class Dish{
    
    var DishName: String
    var DishImage: UIImage
    var DishIngredients: String
    
    
    
    init(DishName:String, DishImage: UIImage, DishIngredients:String){
        self.DishName = DishName
        self.DishImage = DishImage
        self.DishIngredients = DishIngredients
    }
    
}