//
//  TestView.swift
//  swæy
//
//  Created by Ariya Ghomashtchi on 22.06.23.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject private var viewModel: SwaeyViewModel
    var body: some View {
        ScrollView{
            ForEach(viewModel.mealList,id: \.self){
                meal in AsyncImage(url: URL(string: meal.strMealThumb)) { phase in
                    switch phase {
                    case.empty : ProgressView()
                    case.success(let image):
                        image.resizable()
                            .frame(width: 100, height: 100)
                    case.failure(_): Text("Error")
                    @unknown default:
                        Text("Unknown Error")
                    }
                }
                Text(meal.strMeal)
                Text(meal.idMeal)
            }
        }
        .task {
           await viewModel.fetchMeal()
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView().environmentObject(SwaeyViewModel())
    }
}
