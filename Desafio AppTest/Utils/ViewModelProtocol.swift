//
//  ViewModelProtocol.swift
//  Desafio AppTest
//
//  Created by Ezequias Santos on 25/07/23.
//

import Foundation

protocol ViewModelProtocol: AnyObject {
    var isLoading: Observable<Bool> { get }
    var isError: Observable<String?> { get }
}
