//
//  ColorPalleteViewController.swift
//  assignment4.module2
//
//  Created by Salome Lapiashvili on 28.10.23.
//

import UIKit

protocol ColorPaletteDelegate: AnyObject {
    func didChangeButtonBackgroundColor(to color: UIColor)
    func didChangeHomeBackgroundColor(to color: UIColor)
}

class ColorPaletteViewController: UIViewController {
    
    weak var delegate: ColorPaletteDelegate?
    let buttonColors: [UIColor] = [.red, .blue, .green, .yellow, .purple, .orange]
    let homeBackgroundColors: [UIColor] = [.blue, .gray, .black, .yellow, .magenta, .white]
    var selectedButton: UIButton?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        self.title = "Color Palette"
        view.backgroundColor = .lightGray
        
        let buttonColorLabel = UILabel()
        buttonColorLabel.text = "Change Home Buttons Background Color"
        let homeBackgroundColorLabel = UILabel()
        homeBackgroundColorLabel.text = "Change Home Background Color"
        
        let buttonColorsStackView = createColorStackView(with: buttonColors, action: #selector(didTapButtonColor(_:)))
        let homeBackgroundColorsStackView = createColorStackView(with: homeBackgroundColors, action: #selector(didTapHomeBackgroundColor(_:)))
        
        let mainStackView = UIStackView(arrangedSubviews: [buttonColorLabel, buttonColorsStackView, homeBackgroundColorLabel, homeBackgroundColorsStackView])
        mainStackView.axis = .vertical
        mainStackView.distribution = .equalSpacing
        mainStackView.alignment = .center
        mainStackView.spacing = 10
        
        view.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    func createColorButton(color: UIColor, action: Selector) -> UIButton {
        let button = UIButton()
        button.backgroundColor = color
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 50),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }
    
    func createColorStackView(with colors: [UIColor], action: Selector) -> UIStackView {
        let chunks = stride(from: 0, to: colors.count, by: 3).map {
            Array(colors[$0..<min($0 + 3, colors.count)])
        }
        
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 1
        
        for chunk in chunks {
            var colorButtons: [UIButton] = []
            for color in chunk {
                colorButtons.append(createColorButton(color: color, action: action))
            }
            
            let horizontalStackView = UIStackView(arrangedSubviews: colorButtons)
            horizontalStackView.axis = .horizontal
            horizontalStackView.distribution = .fillEqually
            horizontalStackView.alignment = .center
            horizontalStackView.spacing = 1
            verticalStackView.addArrangedSubview(horizontalStackView)
        }
        
        return verticalStackView
    }
    
    
    @objc func didTapButtonColor(_ sender: UIButton) {
        guard let color = sender.backgroundColor else { return }
        
        selectedButton?.layer.borderWidth = 0
        
        sender.layer.borderWidth = 2
        sender.layer.borderColor = UIColor.white.cgColor
        
        selectedButton = sender
        delegate?.didChangeButtonBackgroundColor(to: color)
    }
    
    @objc func didTapHomeBackgroundColor(_ sender: UIButton) {
        guard let color = sender.backgroundColor else { return }
        
        selectedButton?.layer.borderWidth = 0
        
        sender.layer.borderWidth = 2
        sender.layer.borderColor = UIColor.black.cgColor
        
        selectedButton = sender
        delegate?.didChangeHomeBackgroundColor(to: color)
    }
}
