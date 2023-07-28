//
//  CustomRadioButton.swift
//  Desafio AppTest
//
//  Created by Ezequias Santos on 26/07/23.
//

import UIKit

final class CustomRadioButton: UIButton {
    
    //MARK: - Properties
    
    var radioOnImage = UIImage(systemName: "circle.fill")! as UIImage
    var radioOffImage = UIImage(systemName: "circle")! as UIImage
    var alternateButton:Array<CustomRadioButton>?
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.masksToBounds = true
        self.isSelected = false
        self.setTitle("", for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.titleLabel?.numberOfLines = 0
        self.setImage(radioOffImage, for: UIControl.State.normal)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func unselectAlternateButtons() {
        if alternateButton != nil {
            self.isSelected = true
            
            for aButton:CustomRadioButton in alternateButton! {
                aButton.isSelected = false
            }
        } else {
            toggleButton()
        }
    }
    
    func toggleButton() {
        self.isSelected = !isSelected
    }
    
    //MARK: - Method Override
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        unselectAlternateButtons()
        super.touchesBegan(touches, with: event)
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.setImage(radioOnImage, for: UIControl.State.normal)
            } else {
                self.setImage(radioOffImage, for: UIControl.State.normal)
            }
        }
    }
}
