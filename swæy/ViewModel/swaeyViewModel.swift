//
//  swaeyViewModel.swift
//  swæy
//
//  Created by Ariya Ghomashtchi on 21.06.23.
//

import Foundation

class MealViewModel: ObservableObject {
    @Published var mealList = [Meal]()
    
    func fetchMeal() async {
        var counter = 0
        while counter < 2 {
            
            
            do {
                mealList = try await
                fetchMealResponse().results
                counter += 1
            } catch{
                print(error)
            }
        }
    }
    
    func fetchMealResponse() async throws -> MealsResponse{
        guard let url = URL(string: "www.themealdb.com/api/json/v1/1/random.php") else {
            throw MealError.invalidURL
            
        }
        
        
        
        let(data,response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as?
                HTTPURLResponse, response.statusCode ==
                200 else {
            throw MealError.invalidResponse
        }
        do {
            let decoder = JSONDecoder()
            return try
            decoder.decode(MealsResponse
                .self, from: data)
        } catch {
            throw MealError.invalidData
        }
    }
}
enum MealError:Error{
    case invalidURL
    case invalidResponse
    case invalidData
}

class PersonViewModel: ObservableObject {
    @Published var personList = [Person]()
    
    func fetchPerson() async {
        do {
            
            personList = try await fetchPersonResponse().results
            
        } catch{
            print(error)
        }
    }
    
    func fetchPersonResponse() async throws -> PersonResponse{
        guard let url = URL(string: "https://randomuser.me/api/") else {
            throw PersonError.invalidURL
            
        }
        
        let(data,response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as?
                HTTPURLResponse, response.statusCode ==
                200 else {
            throw PersonError.invalidResponse
        }
        do {
            let decoder = JSONDecoder()
            return try
            decoder.decode(PersonResponse
                .self, from: data)
        } catch {
            throw PersonError.invalidData
        }
    }
}

enum PersonError:Error{
    case invalidURL
    case invalidResponse
    case invalidData
}
