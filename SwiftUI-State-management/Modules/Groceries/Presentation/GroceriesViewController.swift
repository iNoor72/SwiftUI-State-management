//
//  ViewController.swift
//  SwiftUI-State-management
//
//  Created by Noor El-Din Walid on 20/11/2024.
//

import UIKit
import Combine

class GroceriesViewController: UIViewController {
    private var cancellables: Set<AnyCancellable> = []
    private let groceriesFactory: GroceriesScreenFactory
    
    init(groceriesFactory: GroceriesScreenFactory) {
        self.groceriesFactory = groceriesFactory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let groceriesView: GroceriesScreen = groceriesFactory.makeScreen()
        setupHosting(rootView: groceriesView)
        subscribeToEffects()
    }
    
    private func subscribeToEffects() {
        groceriesFactory.viewModel?.$effect.sink { effect in
            switch effect {
            case .showError(let error):
                self.present(UIAlertController(title: "Error", message: "Error happened. Error: \(error.localizedDescription)", preferredStyle: .alert), animated: true)
            default:
                break
            }
        }.store(in: &cancellables)
    }
}

