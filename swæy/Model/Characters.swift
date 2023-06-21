//
//  Characters.swift
//  swæy
//
//  Created by Ariya Ghomashtchi on 21.06.23.
//
// Wichtig zu beachten: Die Einzelnen Arrays und Bezeichnungen unterschieden sich, aufgrund der JSON`S Files.
import Foundation

struct MealsResponse : Codable{

    let results : [Meal]
}

// Meal JSON ist einfacher zum lesen gewesen als die Person.

struct Meal: Codable, Identifiable {
    var id = UUID()
    var idMeal: String
    var strMeal: String
    var strMealThumb: String
}

// Bei den PersonResponse benötigte ich aufgrund des JSONS mehrere Scructs.

struct PersonResponse : Codable{
    
    let results : [Person]
}

struct Info: Codable{
    var first: String
    var last: String
    var age: Int
}

struct Person: Codable, Identifiable{
    var id = UUID()
    var info : Info
    var registeres: Registered
    var picture: Picture
}

struct Registered: Codable{
    var age: Int
}

struct Picture: Codable{
    var large: String
}
