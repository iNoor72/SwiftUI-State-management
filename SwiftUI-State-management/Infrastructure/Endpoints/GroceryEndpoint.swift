//
//  GroceryEndpoint.swift
//  SwiftUI-State-management
//
//  Created by Noor El-Din Walid on 20/11/2024.
//


import Foundation
import NetworkLayer

enum GroceryEndpoint: Endpoint {
    case fetchGroceryProducts
    
    var base: String {
        APIConstants.baseURL
    }
    
    var path: String {
        switch self {
        case .fetchGroceryProducts:
            return "/products"
        }
    }
    
    var method: String {
        switch self {
        case .fetchGroceryProducts:
            return "GET"
        }
    }
}
