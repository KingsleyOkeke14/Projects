//
//  API.swift
//  squareProject
//
//  Created by Kingsley Okeke on 2021-07-14.
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


struct API {
    let session = URLSession.shared
    let apiRoutes = APIRoutes()
    let decoder = JSONDecoder()
    
    func GetEmployeesList(completion: @escaping(APIResponse)  -> ()) {
        let request = AppUrlRequest(url: apiRoutes.employeeUrl, httpMethod: APIUrlRequest.get.rawValue).request
        var result = APIResponse()
        
        let task = session.dataTask(with: request) { (data, response, error) in
            result.data = data

            if let httpResponse = response as? HTTPURLResponse{
                
                if httpResponse.statusCode == 200{
                    result.isSuccessful = true
                }
                else if(httpResponse.statusCode == 201){
                    result.isSuccessful = true
                    result.data = nil
                }
                else{
                    result.errorMessage = error?.localizedDescription ?? "ERROR: Could not retrieve Employee List"
                }
            }
            completion(result)
        }
        task.resume()
        
    }
}
