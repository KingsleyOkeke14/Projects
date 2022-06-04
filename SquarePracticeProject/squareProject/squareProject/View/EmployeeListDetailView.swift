
//
//  EmployeeListDetailView.swift
//  squareProject
//
//  Created by Kingsley Okeke on 2021-07-14.
//

import SwiftUI

struct EmployeeListDetailView: View {
    
    var employee: Employee
    
    var body: some View {
        VStack(spacing: 2){
            AsyncImage(url: URL(string: employee.photoUrlLarge)!) { image in
                image.resizable()
            } placeholder: {
                Image(systemName: "person.crop.circle.fill").font(.custom("Apple SD Gothic Neo", fixedSize: 120)).foregroundColor(.gray)
            }
            .frame(width: 200, height: 200, alignment: .center)
            .clipShape(Circle())
            .aspectRatio(contentMode: .fit)
            VStack{
                Text(employee.fullName)
                    .font(.title)
                    .bold()
                
                HStack{
                    Spacer()
                        Image(systemName: "person.3.fill")
                            .font(.title3)
                            .foregroundColor(.gray)
                          .padding(4)
                    
                    Text(employee.team)
                        .font(.body)
                        .background(Color.gray.opacity(0.2)
                                        .cornerRadius(8)
                                        .padding(.horizontal, -8))
                    Text(employee.employeeType)
                        .font(.body)
                        .foregroundColor(.gray)
                        .padding(.leading, 8)
                    Spacer()
                        
                }
                HStack{
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "envelope")
                          .font(.title2)
                          .padding(4)
                    })
                    
                    Text(employee.emailAddress)
                        .font(.body)
                    Image(systemName: "doc.on.doc")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer()
                }
                HStack{
                    Spacer()
                    Button(action: {}, label: {
                        Image(systemName: "phone.circle")
                          .font(.title2)
                          .padding(4)
                    })
                    Text(employee.phoneNumber)
                        .font(.body)
                    Image(systemName: "doc.on.doc")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Spacer()
                        
                }
                HStack{
                    Text(employee.biography)
                        .font(.title2)
                        .lineLimit(4)
                        .minimumScaleFactor(0.5)
                }.padding(.top, 30)
                
                
                
            }
        }
        .lineLimit(1)
        .minimumScaleFactor(0.5)
    }
}

struct EmployeeListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeListDetailView(employee: Employee(employeeResponse: EmployeeElementResponse(uuid: "", fullName: "Michael Morin", phoneNumber: "5553280123", emailAddress: "crogers.demo@squareup.com", biography: "Designer on the web marketing team.", photoUrlSmall: "https://s3.amazonaws.com/sq-mobile-interview/photos/16c00560-6dd3-4af4-97a6-d4754e7f2394/small.jpg", photoUrlLarge: "https://s3.amazonaws.com/sq-mobile-interview/photos/16c00560-6dd3-4af4-97a6-d4754e7f2394/large.jpg", team: "Point of Sale Platform", employeeType: "FULL_TIME"))).preferredColorScheme(.dark)
    }
}
