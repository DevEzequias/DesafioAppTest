//
//  SettingsViewController.swift
//  Desafio AppTest
//
//  Created by Ezequias Santos on 25/07/23.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    //MARK: - Properties
    
    private var viewModel: SettingsViewModelProtocol
    
    private lazy var simRadioButton = CustomRadioButton(translateMask: false).apply {
        $0.setTitle("Sim", for: .normal)
        $0.addTarget(self, action: #selector(simButtonAction), for: .touchUpInside)
    }
    private lazy var naoRadioButton = CustomRadioButton(translateMask: false).apply {
        $0.setTitle("Não", for: .normal)
        $0.addTarget(self, action: #selector(naoButtonAction), for: .touchUpInside)
    }
    
    private lazy var stackView = UIStackView(translateMask: false).apply {
        $0.axis = .vertical
        $0.alignment = .leading
        $0.distribution = .fillProportionally
        $0.spacing = 16
    }
    
    private let textLabel = UILabel(translateMask: false).apply {
        $0.text = "Envia log das requisições para Discord"
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .black
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupRadioButtons()
    }
    
    init(viewModel: SettingsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        self.view.layoutIfNeeded()
        radioButtonTapped()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        radioButtonTapped()
    }
    
    func radioButtonTapped() {
        if let radioButtonSelection = UserDefaults.standard.value(forKey: "radioButtonSelection") as? Bool {
            print("DEBUG: \(radioButtonSelection)")
            if radioButtonSelection {
                simRadioButton.isSelected = true
                simRadioButton.alternateButton = [naoRadioButton]
            } else {
                naoRadioButton.isSelected = true
                naoRadioButton.alternateButton = [simRadioButton]
            }
        } else {
            UserDefaults.standard.set(true, forKey: "radioButtonSelection")
            simRadioButton.alternateButton = [naoRadioButton]
        }
    }
    
    func setupRadioButtons() {
        simRadioButton.alternateButton = [naoRadioButton]
        naoRadioButton.alternateButton = [simRadioButton]
    }
    
    @objc func simButtonAction() {
        UserDefaults.standard.set(true, forKey: "radioButtonSelection")
        radioButtonTapped()
    }
    
    @objc func naoButtonAction() {
        UserDefaults.standard.set(false, forKey: "radioButtonSelection")
        radioButtonTapped()
    }
}

// MARK: - CodeView

extension SettingsViewController: CodeView {
    func buildViewHierarchy() {
        view.addSubview(stackView)
        stackView.addArrangedSubviews([textLabel, simRadioButton, naoRadioButton])
    }
    
    func setupConstraints() {
        stackView.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            paddingTop: 24,
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
