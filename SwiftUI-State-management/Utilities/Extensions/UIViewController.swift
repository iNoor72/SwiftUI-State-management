//
//  UIViewController.swift
//  SwiftUI-State-management
//
//  Created by Noor El-Din Walid on 20/11/2024.
//

import UIKit.UIViewController
import SwiftUI

extension UIViewController {
    func setupHosting<Content: View>(rootView: Content) {
        let hostingViewController = UIHostingController(rootView: rootView)
        addChild(hostingViewController)
        view.addSubview(hostingViewController.view)
        
        hostingViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        hostingViewController.didMove(toParent: self)
    }
}
