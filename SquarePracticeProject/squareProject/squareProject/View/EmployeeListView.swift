//
//  ContentView.swift
//  squareProject
//
//  Created by Kingsley Okeke on 2021-07-14.
//

import SwiftUI

struct EmployeeListView: View {
    
    var employee: Employee
    @State var showDetailView: Bool = false
    var body: some View {
        VStack{
             
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.gray.opacity(0.2))
            
            .overlay(
                HStack(spacing: 2) {
                        VStack {
                            AsyncImage(url: URL(string: employee.photoUrlSmall)!) { image in
                                image
                                    .resizable()
                            } placeholder: {
                                Image(systemName: "person.crop.circle.fill")
                                    .font(.title)
                                    .foregroundColor(.gray)
                            }
                            .frame(width: 60, height: 60, alignment: .center)
                            .clipShape(Circle())
                            .aspectRatio(contentMode: .fit)
                            
                        }.padding(.leading, 4)
                        
                        VStack {
                            HStack {
                                Text(employee.fullName)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            HStack {
                                Text(employee.team)
                                Spacer()
                            }
                        }
                    HStack {
                        Button(action: {}, label: {
                            Image(systemName: "envelope")
                              .font(.title2)
                              .padding(4)
                        })
                        Button(action: {}, label: {
                            Image(systemName: "phone.circle")
                              .font(.title2)
                              .padding(4)
                        })
                    }
                     Spacer()
                }
                
            )
        }
        .onTapGesture(perform: {
            showDetailView.toggle()
        })
        .padding(.horizontal, 6)
        .frame(height: 80)
        .lineLimit(1)
        .minimumScaleFactor(0.6)
        .sheet(isPresented: $showDetailView, content: {
            EmployeeListDetailView(employee: employee)
                .preferredColorScheme(.dark)
                .padding(.horizontal, 10)
        })
        
        
    }
}

struct EmployeeListView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeListView(employee: Employee(employeeResponse: EmployeeElementResponse(uuid: "", fullName: "Michael Morin", phoneNumber: "5553280123", emailAddress: "crogers.demo@squareup.com", biography: "Designer on the web marketing team.", photoUrlSmall: "https://s3.amazonaws.com/sq-mobile-interview/photos/16c00560-6dd3-4af4-97a6-d4754e7f2394/small.jpg", photoUrlLarge: "https://s3.amazonaws.com/sq-mobile-interview/photos/16c00560-6dd3-4af4-97a6-d4754e7f2394/large.jpg", team: "Point of Sale Platform", employeeType: ""))).preferredColorScheme(.light)
    }
}
