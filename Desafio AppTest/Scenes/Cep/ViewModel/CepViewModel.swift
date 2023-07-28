//
//  CepViewModel.swift
//  Desafio AppTest
//
//  Created by Ezequias Santos on 26/07/23.
//

import Foundation

// MARK: - CepViewModelProtocol - Protocol definition Use in Controller

protocol CepViewModelProtocol {
    var isLoading: Observable<Bool> { get }
    var isError: Observable<String?> { get }
}

// MARK: - CepViewModel

final class CepViewModel: CepViewModelProtocol {
    var isLoading: Observable<Bool>
    var isError: Observable<String?>
    
    // MARK: - Initialization
    
    init() {
        self.isLoading = Observable(false)
        self.isError = Observable("")
    }
}
