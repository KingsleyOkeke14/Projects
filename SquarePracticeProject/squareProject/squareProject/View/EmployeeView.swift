//
//  EmployeeView.swift
//  squareProject
//
//  Created by Kingsley Okeke on 2021-07-14.
//

import SwiftUI

struct EmployeeView: View {
    
    @State private var selectedItem: String?
    @EnvironmentObject var appObject: AppObjects
    
    var body: some View {
        VStack{
            HStack {
                Text("Employees Directory")
                    .fontWeight(.bold)
                    .font(.title)
                    .padding(.leading, 10)
                Spacer()
            }
            VStack{
                if(appObject.isloadingEmployeesList){
                    ProgressView()
                }
                else if(appObject.employees.count > 0){
                    
                    ScrollView{
                        ForEach(appObject.employees, id: \.self){ employee in
                          EmployeeListView(employee: employee)
                        }
                    }
                }
                else{
                    Spacer()
                    Text("No Employee Data to Display at this time")
                    Spacer()
                }
            }
            Spacer()
        }
    }
}

struct EmployeeView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeView()
            .environmentObject(AppObjects())
            .preferredColorScheme(.dark)
    }
}
