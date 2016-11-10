//
//  Recipe.swift
//  MisRecetas
//
//  Created by Victor Guillen on 7/11/16.
//  Copyright © 2016 Victor Guillen. All rights reserved.
//
import UIKit
import Foundation

class Recipe: NSObject {
    var name : String!
    var image : UIImage!
    var time : Int!
    var ingredients : [String]!
    var steps : [String]!
    
    //var isFavourite: Bool = false
    //Realizamos este cambio de variable para hacer que la receta conserve la valoracion que se le haya dado, en caso de no haberle dado ninguna, sera igual a la imagen inicial
    var rating : String = "rating"
    
    init(name: String, image: UIImage, time: Int, ingredients: [String], steps: [String]) {
        self.name = name
        self.image = image
        self.time = time
        self.ingredients = ingredients
        self.steps = steps
    }
    
    
    
    
}

