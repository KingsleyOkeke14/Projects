//
//  AppObjects.swift
//  squareProject
//
//  Created by Kingsley Okeke on 2021-07-14.
//

import Foundation

// AppObjects is your view model
class AppObjects : ObservableObject {
    let api = API()
    
    @Published var employees: [Employee]
    @Published var isloadingEmployeesList: Bool
    
    init() {
        isloadingEmployeesList = false
        employees = [Employee]()
        getEmployees()
    }
    
    func getEmployees() {
        // weak self
        // - Retain cycles. Strong, weak, unowned
        // - How to identify, usual case where it occurs closures
        api.GetEmployeesList(){  result in
            if(result.isSuccessful && result.data != nil){
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                print(result.data!)
                if let jsonResponse = try? decoder.decode(EmployeesResponse.self, from: result.data!){
                    DispatchQueue.main.async {
                        self.isloadingEmployeesList  = false
                        self.employees = Employees(employeesResponse: jsonResponse.employees!).employees
                    }
                    print(self.employees)
                }
                else{
                    DispatchQueue.main.async {
                        self.isloadingEmployeesList  = false
                    }
                    print(result.errorMessage)
                }
            }
        }
    }
}
