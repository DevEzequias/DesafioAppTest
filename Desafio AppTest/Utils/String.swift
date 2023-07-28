//
//  String.swift
//  Desafio AppTest
//
//  Created by Ezequias Santos on 26/07/23.
//

import Foundation

extension String {
    func validarCEP() -> Bool {
        // Expressão regular para verificar o formato do CEP (XXXXX-XXX)
        let regex = #"^\d{5}-\d{3}$"#
        let predicate = NSPredicate(format:"SELF MATCHES %@", regex)
        return predicate.evaluate(with: self)
    }
    
    func getOnlyNumbers() -> String {
        return self.components(separatedBy: NSCharacterSet.decimalDigits.inverted).joined(separator: "")     }
}
