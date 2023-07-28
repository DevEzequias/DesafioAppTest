//
//  UIStackView.swift
//  Desafio AppTest
//
//  Created by Ezequias Santos on 25/07/23.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ subviews: [UIView]) {
        subviews.forEach{ self.addArrangedSubview($0) }
    }
    
    func removeFull(view: UIView) {
        removeArrangedSubview(view)
        view.removeFromSuperview()
    }
    
    func removeFullAllArrangedSubviews() {
        arrangedSubviews.forEach { (view) in
            removeFull(view: view)
        }
    }
}

