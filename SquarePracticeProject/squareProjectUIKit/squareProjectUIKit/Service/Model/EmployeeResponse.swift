//
//  EmployeeResponse.swift
//  squareProjectUIKit
//
//  Created by Kingsley Okeke on 2021-07-25.
//

import Foundation

struct EmployeesResponse: Codable {
    let employees: [EmployeeElementResponse]?
}
struct EmployeeElementResponse: Codable {
    let uuid, fullName, phoneNumber, emailAddress: String?
    let biography: String?
    let photoUrlSmall, photoUrlLarge: String?
    let team: String?
    let employeeType: String?
}
