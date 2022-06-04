//
//  Service.swift
//  squareProjectUIKit
//
//  Created by Kingsley Okeke on 2021-07-25.
//

import Foundation


struct APIRoutes {
    private let employeeRoute = "https://s3.amazonaws.com/sq-mobile-interview/employees.json"
    
    var employeeUrl:URL
    
    init() {
        employeeUrl = URL(string: employeeRoute)!
    }
    
}

enum APIUrlRequest : String {
    case get = "GET"
    case post = "POST"
}


struct AppUrlRequest {
    var request:URLRequest
    
    init(url:URL, httpMethod:String) {
        request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
    }
}

enum APIError: Error {
    case requestFailed(String)
}

struct API {
    static let shared = API()
    let session: URLSession
    let apiRoutes = APIRoutes()
    let decoder = JSONDecoder()
    
    init() {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil
        session = URLSession(configuration: config)
    }
    
    
    func GetEmployeesList(completion: @escaping(Result<[Employee], APIError>)  -> ()) {
        let request = AppUrlRequest(url: apiRoutes.employeeUrl, httpMethod: APIUrlRequest.get.rawValue).request
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if(error != nil){
                DispatchQueue.main.async {
                    completion(.failure(.requestFailed(error?.localizedDescription ?? "ERROR: HTTP Request Failed")))
                }
            }
            
            if let httpResponse = response as? HTTPURLResponse{
                
                if httpResponse.statusCode == 200{
                    
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    var employees = [Employee]()
                    if let jsonResponse = try? decoder.decode(EmployeesResponse.self, from: data!){
                        employees = Employees(employeesResponse: jsonResponse.employees!).employees
                    }
                    DispatchQueue.main.async {
                        completion(.success(employees))
                    }
                   
                    
                }
                else if(httpResponse.statusCode == 201){
              
                } else {
                    DispatchQueue.main.async {
                        completion(.failure(.requestFailed(error?.localizedDescription ?? "ERROR: Could not retrieve Employee List")))
                    }
                }
            }
            
        }
        //If there is a 100% loss, the request continues to run in the background
        task.resume()
        
    }
}
