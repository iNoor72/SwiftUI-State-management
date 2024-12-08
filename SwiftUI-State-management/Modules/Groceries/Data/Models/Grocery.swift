//
//  Grocery.swift
//  SwiftUI-State-management
//
//  Created by Noor El-Din Walid on 20/11/2024.
//


import Foundation

struct Grocery: Codable, Identifiable {
    let id: Int
    let name: String
    let category: String
    let inStock: Bool
}

extension Grocery {
    var price: Double {
        Double.random(in: 1...100)
    }
}
