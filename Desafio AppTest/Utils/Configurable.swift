//
//  Configurable.swift
//  Desafio AppTest
//
//  Created by Ezequias Santos on 25/07/23.
//

import Foundation

public protocol Configurable: AnyObject {
    associatedtype Configuration

    func configure(content: Configuration)

}
