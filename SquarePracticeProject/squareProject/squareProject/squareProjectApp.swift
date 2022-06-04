//
//  squareProjectApp.swift
//  squareProject
//
//  Created by Kingsley Okeke on 2021-07-14.
//

import SwiftUI

@main
struct squareProjectApp: App {
    let appObject: AppObjects = AppObjects()
    var body: some Scene {
        WindowGroup {
            EmployeeView().environmentObject(appObject).preferredColorScheme(.dark)
        }
    }
}
