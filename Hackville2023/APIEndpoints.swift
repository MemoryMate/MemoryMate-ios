//
//  APIEndpoints.swift
//  Hackville2023
//
//  Created by Chris Couto on 2023-02-11.
//

import Foundation

class APIEndpoints {
    private static let baseURL = "http://10.80.5.31:3000/api/users"
    static let signupURL = "\(baseURL)/signup"
    static let signinURL = "\(baseURL)/signin"
    
    
    static func setTokenURL (userId: String) -> String {
        return "\(baseURL)/users/\(userId)/set_token"
      }
    
    static func todosURL (userId: String) -> String {
        return "\(baseURL)/users/\(userId)/todos"
    }
    static func todoURL (userId: String, todoId: String) -> String {
        return "\(baseURL)/users/\(userId)/todos/\(todoId)"
    }
}
