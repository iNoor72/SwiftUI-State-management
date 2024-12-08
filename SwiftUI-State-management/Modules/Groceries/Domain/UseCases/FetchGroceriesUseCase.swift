//
//  FetchGroceriesUseCase.swift
//  SwiftUI-State-management
//
//  Created by Noor El-Din Walid on 20/11/2024.
//

import Foundation
import NetworkLayer

protocol FetchGroceriesUseCase {
    func fetchGroceries(completion: @escaping (Result<[Grocery], Error>) -> Void)
}

struct FetchGroceriesUseCaseImpl: FetchGroceriesUseCase {
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = NetworkManager.shared) {
        self.networkManager = networkManager
    }
    
    func fetchGroceries(completion: @escaping (Result<[Grocery], Error>) -> Void) {
        networkManager.request(with: GroceryEndpoint.fetchGroceryProducts) { (result: Result<[Grocery], NetworkError>) in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let response):
                completion(.success(response))
            }
        }
    }
}
