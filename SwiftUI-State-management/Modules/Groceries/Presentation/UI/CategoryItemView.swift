//
//  CategoryItemView.swift
//  SwiftUI-State-management
//
//  Created by Noor El-Din Walid on 20/11/2024.
//

import SwiftUI

struct CategoryItemView: View {
    var category: String?
    
    var body: some View {
        VStack {
            productImage
                .resizable()
                .frame(width: 150, height: 150)
                .padding(8)
            
            Text(category ?? "")
                .padding()
        }
    }
    
    var productImage: Image {
        Image(uiImage: (getImage())!)
    }
    
    private func getImage() -> UIImage? {
        return switch category {
        case "coffee":
            UIImage(systemName: "cup.and.saucer.fill")
        case "fresh-produce":
            UIImage(systemName: "carrot.fill")
        case "meat-seafood":
            UIImage(systemName: "fish.fill")
        case "candy":
            UIImage(systemName: "birthday.cake.fill")
        case "dairy":
            UIImage(systemName: "waterbottle.fill")
        case "bread-bakery":
            UIImage(systemName: "laurel.trailing")
        default:
            UIImage(systemName: "cart.fill")
        }
    }
}
