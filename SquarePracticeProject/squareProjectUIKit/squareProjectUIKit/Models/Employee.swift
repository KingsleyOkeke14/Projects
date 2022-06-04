//
//  Employee.swift
//  squareProjectUIKit
//
//  Created by Kingsley Okeke on 2021-07-25.
//

import Foundation

struct Employee : Identifiable, Hashable  {
    var id: UUID
    var fullName, phoneNumber, emailAddress: String
    var biography: String
    var photoUrlSmall, photoUrlLarge: String
    var team: String
    var employeeType: String
    
    init(employeeResponse: EmployeeElementResponse) {
        id = UUID(uuidString: employeeResponse.uuid ?? "") ?? UUID()
        fullName = employeeResponse.fullName ?? ""
        phoneNumber = employeeResponse.phoneNumber ?? ""
        emailAddress = employeeResponse.emailAddress ?? ""
        biography = employeeResponse.biography ?? ""
        photoUrlSmall = employeeResponse.photoUrlSmall ?? ""
        photoUrlLarge = employeeResponse.photoUrlLarge ?? ""
        team = employeeResponse.team ?? ""
        employeeType = getEmployeeType(employeeType: employeeResponse.employeeType ?? "")
    }
}

struct Employees {
    var employees: [Employee] = [Employee]()
    
    init(employeesResponse: [EmployeeElementResponse]) {
        for employee in employeesResponse {
            employees.append(Employee(employeeResponse: employee))
        }
    }
}

// leverage enum here

enum EmployeeTypes : String {
    case fullTime = "FULL TIME"
    case partTime = "PART TIME"
}

func getEmployeeType(employeeType: String) -> String {
    
    switch employeeType {
    case "FULL_TIME":
        return EmployeeTypes.fullTime.rawValue
    case "PART_TIME":
        return EmployeeTypes.partTime.rawValue
    default:
        return employeeType
    }
}
