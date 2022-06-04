//
//  Employee.swift
//  squareProjectUIKit
//
//  Created by Kingsley Okeke on 2021-07-25.
//

import Foundation

enum ViewState {
    case loading, complete, error(String), empty
}

final class EmployeeVM {
    
    @Published var state:ViewState = .loading
    
    var employees: [Employee] = [Employee]()
    
    init() {
        fetchEmployees()
    }
    
    func fetchEmployees() {
        API.shared.GetEmployeesList(){ [weak self]
            result in
            switch result{
            case let .success(employeesResult):
                self?.employees = employeesResult
                self?.state = .complete
            case let .failure(.requestFailed(message)):
                self?.state = .error(message)
            }
        }
    }
}
