//
//  GroceriesScreen.swift
//  SwiftUI-State-management
//
//  Created by Noor El-Din Walid on 20/11/2024.
//

import SwiftUI

struct GroceriesScreen: View {
    @ObservedObject var groceriesViewModel: GroceriesViewModel
    
    var body: some View {
        switch groceriesViewModel.state {
        case .initial:
            Color.clear
                .onAppear {
                    groceriesViewModel.onAppear()
                }
        case .loading:
            ProgressView()
        case .loaded:
            contentView
        case .error(_):
            ErrorView()
        }
    }
}

extension GroceriesScreen {
    var contentView: some View {
        VStack {
            List {
                LazyVGrid(columns: [
                    GridItem(.flexible(), spacing: 16),
                    GridItem(.flexible(), spacing: 16)
                ], spacing: 16) {
                    ForEach(0..<groceriesViewModel.categories.count, id: \.self) { index in
                        CategoryItemView(category: groceriesViewModel.categories[index])
                    }
                }
            }
        }
    }
}
