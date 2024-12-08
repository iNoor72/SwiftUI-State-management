//
//  GroceriesViewModel.swift
//  SwiftUI-State-management
//
//  Created by Noor El-Din Walid on 20/11/2024.
//

import Foundation
import Combine

enum GroceriesViewModelState {
    case initial
    case loading
    case loaded
    case error(Error)
}

enum GroceriesViewModelEffect {
    case initial
    case fetchGroceries
    case showError(Error)
}

final class GroceriesViewModel: ObservableObject {
    private let fetchGroceriesUseCase: FetchGroceriesUseCase
    @Published var categories: [String] = []
    var products: [Grocery] = []
    @Published var effect: GroceriesViewModelEffect = .initial
    @Published var state: GroceriesViewModelState = .initial
    
    init(fetchGroceriesUseCase: FetchGroceriesUseCase) {
        self.fetchGroceriesUseCase = fetchGroceriesUseCase
        fetchProducts()
    }
    
    func onAppear() {
        fetchProducts()
    }
    
    private func fetchProducts() {
        fetchGroceriesUseCase.fetchGroceries {[weak self] result in
            guard let self else { return }
            switch result {
            case .success(let groceries):
                self.products = groceries
                groceries.forEach {
                    if !self.categories.contains($0.category) {
                        self.categories.append($0.category)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
