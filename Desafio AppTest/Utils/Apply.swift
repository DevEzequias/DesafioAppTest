//
//  Apply.swift
//  Desafio AppTest
//
//  Created by Ezequias Santos on 25/07/23.
//

import Foundation

public protocol Apply {}

public extension Apply where Self: Any {

    /// Makes it available to set properties with closures just after initializing.
    ///
    ///     let label = UILabel().apply {
    ///       $0.textAlignment = .center
    ///       $0.textColor = UIColor.black
    ///       $0.text = "Hello, World!"
    ///     }
    @discardableResult
    func apply(_ block: (Self) -> Void) -> Self {
        block(self)
        return self
    }
}

extension NSObject: Apply {}
extension JSONDecoder: Apply {}
extension JSONEncoder: Apply {}
