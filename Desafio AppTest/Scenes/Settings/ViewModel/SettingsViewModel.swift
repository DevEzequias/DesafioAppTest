//
//  SettingsViewModel.swift
//  Desafio AppTest
//
//  Created by Ezequias Santos on 27/07/23.
//

import Foundation

// MARK: - SettingsViewModelProtocol - Protocol definition Use in Controller

protocol SettingsViewModelProtocol {
    var isLoading: Observable<Bool> { get }
    var isError: Observable<String?> { get }
}

// MARK: - SettingsViewModel

final class SettingsViewModel: SettingsViewModelProtocol {
    var isLoading: Observable<Bool>
    var isError: Observable<String?>
    
    // MARK: - Initialization
    
    init() {
        self.isLoading = Observable(false)
        self.isError = Observable("")
    }
}

