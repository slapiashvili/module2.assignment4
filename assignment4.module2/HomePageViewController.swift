//
//  HomePageViewController.swift
//  assignment4.module2
//
//  Created by Salome Lapiashvili on 28.10.23.
//

import UIKit

class HomePageViewController: UIViewController, ColorPaletteDelegate {
    
    let presentColorButton = UIButton(type: .system)
    let pushColorButton = UIButton(type: .system)
    
    
    func didChangeButtonBackgroundColor(to color: UIColor) {
        presentColorButton.backgroundColor = color
        pushColorButton.backgroundColor = color
    }
    
    func didChangeHomeBackgroundColor(to color: UIColor) {
        view.backgroundColor = color
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHomePageUI()
    }
    
    func setupHomePageUI() {
        
        view.backgroundColor = .white
        let padding = view.bounds.width / 8.0
        
        let curlyDesignView = UIImageView(image: UIImage(named: "curly.design"))
        curlyDesignView.contentMode = .scaleAspectFit
        curlyDesignView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(curlyDesignView)
        
        presentColorButton.setTitle("Present Color Pallete Page", for: .normal)
        presentColorButton.setTitleColor(.white, for: .normal)
        presentColorButton.backgroundColor = UIColor(red: 34.0/255.0, green: 87.0/255.0, blue: 122.0/255.0, alpha: 1.0)
        presentColorButton.layer.cornerRadius = 25
        presentColorButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(presentColorButton)
        presentColorButton.addTarget(self, action: #selector(presentColorPalette), for: .touchUpInside)
        
        
        pushColorButton.setTitle("Push Color Pallete Page", for: .normal)
        pushColorButton.setTitleColor(.white, for: .normal)
        pushColorButton.backgroundColor = UIColor(red: 34.0/255.0, green: 87.0/255.0, blue: 122.0/255.0, alpha: 1.0)
        pushColorButton.layer.cornerRadius = 25
        pushColorButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pushColorButton)
        
        pushColorButton.addTarget(self, action: #selector(pushColorPalette), for: .touchUpInside)
        
        
        
        NSLayoutConstraint.activate([
            curlyDesignView.topAnchor.constraint(equalTo: view.topAnchor),
            curlyDesignView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            curlyDesignView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            curlyDesignView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3),
            
            presentColorButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            presentColorButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            presentColorButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            presentColorButton.heightAnchor.constraint(equalToConstant: 100),
            
            pushColorButton.topAnchor.constraint(equalTo: presentColorButton.bottomAnchor, constant: 50),
            pushColorButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            pushColorButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            pushColorButton.heightAnchor.constraint(equalToConstant: 100),
            
        ])
        
    }
    
    @objc func presentColorPalette() {
        let colorPaletteViewController = ColorPaletteViewController()
        colorPaletteViewController.delegate = self
        present(colorPaletteViewController, animated: true, completion: nil)
    }
    
    @objc func pushColorPalette() {
        let colorPaletteViewController = ColorPaletteViewController()
        colorPaletteViewController.delegate = self
        navigationController?.pushViewController(colorPaletteViewController, animated: true)
    }
    
}




