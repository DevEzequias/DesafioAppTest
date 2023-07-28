//
//  Service.swift
//  Desafio AppTest
//
//  Created by Ezequias Santos on 27/07/23.
//

import Foundation
import UIKit

class Service: WebService {
    override init() {
        super.init()
    }
    
    func getAddress(cep: String) {
        super.identifier += "getAddress"
        super.get(url: "\(appTestBaseUrl)\(cep)/json/")
    }
    
    func postMessage(_ message: CepResponse) {
        super.identifier += "postMessage"
        let content = """
            Consulta Cep:\(message.cep), Modelo celular: \(UIDevice.hardwareModel)
            Retorno Cep:
            Logradouro: \(message.logradouro)
            Bairro: \(message.bairro)
            Localidade: \(message.localidade)
            UF: \(message.uf)
            IBGE: \(message.ibge)
            DDD: \(message.ddd)
            """
        super.json = ["content": content]
        super.json(url: "https://discord.com/api/webhooks/1095399212310593597/wI4rSHU4bI3jGTz7XoV3LCKJ7licceu4_bz2G3yJt8bN9aHSIdE6ZSdF6UTDPjW8fEiP")
    }
}
