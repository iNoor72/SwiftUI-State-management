//
//  GroceriesScreenFactory.swift
//  SwiftUI-State-management
//
//  Created by Noor El-Din Walid on 20/11/2024.
//

import Foundation
import SwiftUI

protocol GroceriesScreenFactory {
    var viewModel: GroceriesViewModel? { get }
    
    func makeScreen<Content: View>() -> Content
}

final class DefaultGroceriesScreenFactory: GroceriesScreenFactory {
    weak var viewModel: GroceriesViewModel?
    
    func makeScreen<Content: View>() -> Content {
        let fetchGroceriesUseCase = FetchGroceriesUseCaseImpl()
        let groceriesViewModel = GroceriesViewModel(fetchGroceriesUseCase: fetchGroceriesUseCase)
        let groceriesView = GroceriesScreen(groceriesViewModel: groceriesViewModel)
        
        self.viewModel = groceriesViewModel
        return groceriesView as! Content
    }
}
