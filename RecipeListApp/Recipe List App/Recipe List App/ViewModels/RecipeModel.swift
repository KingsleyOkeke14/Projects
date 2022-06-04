//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Kingsley Okeke on 2021-01-29.
//

import Foundation

class RecipeModel:  ObservableObject{
    @Published var recipes = [Recipe]()
    
    init(){
        self.recipes = DataService.getLocalData()
    }
}
