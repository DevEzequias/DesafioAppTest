//
//  CepResponse.swift
//  Desafio AppTest
//
//  Created by Ezequias Santos on 25/07/23.
//

import Foundation

// MARK: - CepResponse

public final class CepResponse {
    var cep: String
    var logradouro: String
    var complemento: String
    var bairro: String
    var localidade: String
    var uf: String
    var ibge: String
    var gia: String
    var ddd, siafi: String
    var erro: Bool
    
    init() {
        self.cep = ""
        self.logradouro = ""
        self.complemento = ""
        self.bairro = ""
        self.localidade = ""
        self.uf = ""
        self.ibge = ""
        self.gia = ""
        self.ddd = ""
        self.siafi = ""
        self.erro = false
    }
    
    public convenience init(dict: Any) {
        self.init()
        if let json = dict as? [String: Any] {
            self.cep << json["cep"]
            self.logradouro << json["logradouro"]
            self.complemento << json["complemento"]
            self.bairro << json["bairro"]
            self.localidade << json["localidade"]
            self.uf << json["uf"]
            self.ibge << json["ibge"]
            self.gia << json["gia"]
            self.ddd << json["ddd"]
            self.siafi << json["siafi"]
            self.erro << json["erro"]
        }
    }
}
