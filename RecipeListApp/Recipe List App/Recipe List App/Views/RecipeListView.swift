//
//  ContentView.swift
//  Recipe List App
//
//  Created by Kingsley Okeke on 2021-01-29.
//

import SwiftUI

struct RecipeListView: View {
    
    @ObservedObject var model = RecipeModel()
    
    
    var body: some View {
        List(model.recipes){
            r in
            HStack(spacing: 20){
                Image(r.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50, alignment: .center)
                    .clipped()
                    .cornerRadius(5)
                Text(r.name)
            }
        }
    }
}

struct RecipeListView_Preview: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
