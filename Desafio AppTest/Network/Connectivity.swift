//
//  Connectivity.swift
//  Desafio AppTest
//
//  Created by Ezequias Santos on 26/07/23.
//

import Alamofire

// MARK: - Retorna valor [Bool] se user esta conectado com a internet.

class Connectivity {
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
