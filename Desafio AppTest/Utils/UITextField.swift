//
//  UITextField.swift
//  Desafio AppTest
//
//  Created by Ezequias Santos on 26/07/23.
//

import UIKit

extension UITextField {
    func addCEPMask() {
        addTarget(self, action: #selector(cepTextFieldDidChange), for: .editingChanged)
    }

    @objc private func cepTextFieldDidChange(textField: UITextField) {
        if let text = textField.text {
            // Removendo qualquer formatação anterior (hífens, espaços, etc.)
            let cleanedText = text.replacingOccurrences(of: "-", with: "").replacingOccurrences(of: " ", with: "")

            // Verificando se o texto é maior que 5 caracteres (CEP inicial) e menor ou igual a 8 caracteres (CEP completo)
            if cleanedText.count > 5 {
                // Limitar o texto a no máximo 8 dígitos
                let maxLength = min(cleanedText.count, 8)
                let limitedText = cleanedText.prefix(maxLength)

                // Formatando o CEP
                var formattedText = ""
                for (i, character) in limitedText.enumerated() {
                    if i == 5 {
                        formattedText += "-"
                    }
                    formattedText += String(character)
                }
                textField.text = formattedText
            }
        }
    }
}

//cepTextField.addCEPMask()
