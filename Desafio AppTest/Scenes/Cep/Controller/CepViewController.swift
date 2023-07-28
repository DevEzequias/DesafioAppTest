//
//  CepViewController.swift
//  Desafio AppTest
//
//  Created by Ezequias Santos on 25/07/23.
//

import UIKit

final class CepViewController: UIViewController {
    
    //MARK: - Properties
    
    private var viewModel: CepViewModelProtocol
    
    private lazy var stackView = UIStackView(translateMask: false).apply {
        $0.axis = .vertical
        $0.distribution = .fill
    }

    private let cepLabel = UILabel(translateMask: false).apply {
        $0.text = "Digite seu CEP"
        $0.font = .boldSystemFont(ofSize: 18)
        $0.textColor = .black
        $0.numberOfLines = 0
    }
    
    private let cepTextField = UITextField(translateMask: false).apply {
        $0.placeholder = "Digite seu Cep"
        $0.font = .systemFont(ofSize: 18)
        $0.textColor = .black
        $0.keyboardType = .numberPad
        $0.addCEPMask()
    }
    
    private let lineView = UIView(translateMask: false).apply {
        $0.backgroundColor = .systemBlue
        $0.setHeight(height: 1)
    }
    
    private let cepView = UIView(translateMask: false).apply {
        $0.backgroundColor = .clear
    }

    private lazy var playButton = UIButton(translateMask: false).apply {
        $0.setTitle("Consultar CEP", for: .normal)
        $0.layer.cornerRadius = 5
        $0.titleLabel?.font = .boldSystemFont(ofSize: 18)
        $0.backgroundColor = .systemBlue
        $0.addTarget(self, action: #selector(primaryButtonAction), for: .touchUpInside)
        $0.setHeight(height: 50)
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cepTextField.text = ""
    }
    
    init(viewModel: CepViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Selectors
    
    @objc func primaryButtonAction() {
        if let cepDigitado = cepTextField.text {
            if cepDigitado.validarCEP() {
                let viewModel = ResultCepViewModel(cep: cepDigitado.getOnlyNumbers())
                let resultsCepViewController = ResultsCepViewController(viewModel: viewModel)
                navigationController?.pushViewController(resultsCepViewController, animated: true)
            } else {
                let alert = UIAlertController(title: "CEP Inválido", message: "Por favor, digite um CEP válido.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}

// MARK: - CodeView

extension CepViewController: CodeView {
    func buildViewHierarchy() {
        view.addSubview(stackView)
        
        cepView.addSubview(cepTextField)
        cepView.addSubview(lineView)
        stackView.addArrangedSubviews([cepLabel, cepView, playButton])
        stackView.spacing = 30
    }
    
    func setupConstraints() {
        
        cepTextField.anchor(
            top: cepView.topAnchor,
            leading: cepView.leadingAnchor,
            trailing: cepView.trailingAnchor
        )
        
        lineView.anchor(
            top: cepTextField.bottomAnchor,
            paddingTop: 6,
            leading: cepView.leadingAnchor,
            bottom: cepView.bottomAnchor,
            trailing: cepView.trailingAnchor
        )
        
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
