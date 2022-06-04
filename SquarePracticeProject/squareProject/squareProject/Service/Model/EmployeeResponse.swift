//
//  EmployeeResponse.swift
//  squareProject
//
//  Created by Kingsley Okeke on 2021-07-14.
//

import Foundation
// MARK: - Employee

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
