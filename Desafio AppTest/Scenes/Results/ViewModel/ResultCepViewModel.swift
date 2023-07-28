//
//  ResultCepViewModel.swift
//  Desafio AppTest
//
//  Created by Ezequias Santos on 27/07/23.
//

import Foundation

// MARK: - ResultCepViewModelProtocol - Protocol definition Use in Controller

protocol ResultCepViewModelProtocol {
    var isLoading: Observable<Bool> { get }
    var isError: Observable<String?> { get }
    var cepModelData: Observable<CepResponse?> { get }
    func getAddress(cep: String)
}

// MARK: - ResultCepViewModel

final class ResultCepViewModel: ResultCepViewModelProtocol {
    var isLoading: Observable<Bool>
    var isError: Observable<String?>
    var cepModelData: Observable<CepResponse?>
    var cep: String
    
    // MARK: - Initialization
    
    init(cep: String) {
        self.isLoading = Observable(false)
        self.isError = Observable("")
        self.cepModelData = Observable(nil)
        self.cep = cep
        self.getAddress(cep: cep)
    }
    
    // MARK: - Methods Internal
    
    func getAddress(cep: String) {
        let service = Service()
        service.delegate = self
        service.getAddress(cep: cep)
    }
    
    func postMessage(message: CepResponse) {
        let service = Service()
        service.delegate = self
        service.postMessage(message)
    }
}

// MARK: - WsDelegate

extension ResultCepViewModel: WsDelegate {
    func wsFinishedWithSuccess(identifier: String, sender: NSDictionary, status: WsStatus, jsonResult: NSMutableArray) {
        self.isLoading.value = false
        
        if identifier == "getAddress" {
            if status == .success {
                let cepResponse = CepResponse.init(dict: sender)
                cepModelData.value = cepResponse
                
                if let radioButtonSelection = UserDefaults.standard.value(forKey: "radioButtonSelection") as? Bool {
                    if radioButtonSelection {
                        self.postMessage(message: cepResponse)
                    }
                } else {
                    self.postMessage(message: cepResponse)
                }
            }
        }
    }
    
    func wsFinishedWithError(identifier: String, sender: NSDictionary, error: String, status: WsStatus, code: Int) {
        
    }
}
