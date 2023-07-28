//
//  ResultsCepViewController.swift
//  Desafio AppTest
//
//  Created by Ezequias Santos on 25/07/23.
//

import UIKit

final class ResultsCepViewController: UIViewController {
    
    // MARK: Properties
    
    private var viewModel: ResultCepViewModelProtocol
    
    private let stackView = UIStackView(translateMask: false).apply {
        $0.alignment = .leading
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.spacing = 20
        $0.alignment = .fill
    }
    
    private let logradouroLabel = UILabel(translateMask: false).apply {
        $0.text = "Logradouro:"
        $0.textAlignment = .left
        $0.font = .boldSystemFont(ofSize: 18)
        $0.textColor = .black
    }
    
    private let resultadoLogradouroLabel = UILabel(translateMask: false).apply {
        $0.text = ""
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 18)
        $0.textColor = .black
        $0.numberOfLines = 0
    }
    
    private let bairroLabel = UILabel(translateMask: false).apply {
        $0.text = "Bairro:"
        $0.textAlignment = .left
        $0.font = .boldSystemFont(ofSize: 18)
        $0.textColor = .black
        $0.numberOfLines = 0
    }
    
    private let resultadoBairroLabel = UILabel(translateMask: false).apply {
        $0.text = ""
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 18)
        $0.textColor = .black
        $0.numberOfLines = 0
    }
    
    private let cidadeLabel = UILabel(translateMask: false).apply {
        $0.text = "Cidade:"
        $0.textAlignment = .left
        $0.font = .boldSystemFont(ofSize: 18)
        $0.textColor = .black
        $0.numberOfLines = 0
    }
    
    private let resuldadoCidadeLabel = UILabel(translateMask: false).apply {
        $0.text = ""
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 18)
        $0.textColor = .black
        $0.numberOfLines = 0
    }
    
    private let ufLabel = UILabel(translateMask: false).apply {
        $0.text = "UF:"
        $0.textAlignment = .left
        $0.font = .boldSystemFont(ofSize: 18)
        $0.textColor = .black
        $0.numberOfLines = 0
    }
    
    private let resuldadoUFLabel = UILabel(translateMask: false).apply {
        $0.text = ""
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 18)
        $0.textColor = .black
        $0.numberOfLines = 0
    }
    
    private let ibgeLabel = UILabel(translateMask: false).apply {
        $0.text = "Cod IBGE:"
        $0.textAlignment = .left
        $0.font = .boldSystemFont(ofSize: 18)
        $0.textColor = .black
        $0.numberOfLines = 0
    }
    
    private let resuldadoIBGELabel = UILabel(translateMask: false).apply {
        $0.text = ""
        $0.textAlignment = .left
        $0.font = .systemFont(ofSize: 18)
        $0.textColor = .black
        $0.numberOfLines = 0
    }
    
    //MARK: - Lifecycle
    
    init(viewModel: ResultCepViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupBindigs()
    }
    
    //MARK: - Helpers
    
    func setupBindigs() {
        viewModel.cepModelData.bind { address in
            if let address = address {
                if !address.erro {
                    self.resultadoLogradouroLabel.text = address.logradouro
                    self.resultadoBairroLabel.text = address.bairro
                    self.resuldadoCidadeLabel.text = address.localidade
                    self.resuldadoUFLabel.text = address.uf
                    self.resuldadoIBGELabel.text = address.ibge
                } else {
                    let alert = UIAlertController(title: "CEP Inexistente", message: "", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                        self.navigationController?.popViewController(animated: true)
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
            }
            
        }
    }

}

// MARK: - CodeView

extension ResultsCepViewController: CodeView {
    func buildViewHierarchy() {
        view.addSubview(stackView)
       
        stackView.addArrangedSubviews([
            logradouroLabel,
            resultadoLogradouroLabel,
            bairroLabel,
            resultadoBairroLabel,
            cidadeLabel,
            resuldadoCidadeLabel,
            ufLabel,
            resuldadoUFLabel,
            ibgeLabel,
            resuldadoIBGELabel
        ])
    }
    
    func setupConstraints() {
        stackView.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            paddingTop: 32,
            leading: view.leadingAnchor,
            paddingLeft: 32,
            trailing: view.trailingAnchor,
            paddingRight: 32
        )
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .white
    }
}
