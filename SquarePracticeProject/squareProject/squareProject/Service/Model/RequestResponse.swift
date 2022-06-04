//
//  RequestResponse.swift
//  squareProject
//
//  Created by Kingsley Okeke on 2021-07-14.
//

import Foundation

struct RequestResponse {
    var employees: [Employee]?
}

struct APIResponse {
    var isSuccessful:Bool = false
    var data:Data? = nil
    var errorMessage:String = ""
}
