//
//  ViewController.swift
//  assignment4.module2
//
//  Created by Salome Lapiashvili on 27.10.23.
//

import UIKit

class SignInViewController: UIViewController {
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign In", for: .normal)
        button.addTarget(self, action: #selector(signInTapped), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        func setupUI() {
            
            view.backgroundColor = .white
            let padding = view.bounds.width / 8.0
            
            let curlyDesignView = UIImageView(image: UIImage(named: "curly.design"))
            curlyDesignView.contentMode = .scaleAspectFit
            curlyDesignView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(curlyDesignView)
            
            let userImageView = UIImageView(image: UIImage(named: "man.picture"))
            userImageView.contentMode = .scaleAspectFill
            userImageView.layer.cornerRadius = userImageView.bounds.width / 2.0
            userImageView.clipsToBounds = true
            userImageView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(userImageView)
            
            let signInLabel = UILabel()
            signInLabel.text = "Sign In"
            signInLabel.font = UIFont.boldSystemFont(ofSize: 24)
            signInLabel.textColor = UIColor.black
            signInLabel.textAlignment = .center
            signInLabel.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(signInLabel)
            
            emailTextField.layer.cornerRadius = 16
            emailTextField.backgroundColor = UIColor(red: 248.0 / 255.0, green: 248.0 / 255.0, blue: 248.0 / 255.0, alpha: 1.0)
            emailTextField.placeholder = "Email"
            emailTextField.textColor = UIColor(red: 95.0/255.0, green: 95.0/255.0, blue: 95.0/255.0, alpha: 1.0)
            emailTextField.layer.borderColor = CGColor(red: 178.0 / 255.0, green: 178.0 / 255.0, blue: 178.0 / 255.0, alpha: 1.0)
            emailTextField.layer.borderWidth = 1
            emailTextField.textAlignment = .left
            emailTextField.setLeftPaddingPoints(10)
            emailTextField.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(emailTextField)
            
            passwordTextField.layer.cornerRadius = 16
            passwordTextField.backgroundColor = UIColor(red: 248.0 / 255.0, green: 248.0 / 255.0, blue: 248.0 / 255.0, alpha: 1.0)
            passwordTextField.placeholder = "Password"
            passwordTextField.textColor = UIColor(red: 95.0/255.0, green: 95.0/255.0, blue: 95.0/255.0, alpha: 1.0)
            passwordTextField.textAlignment = .left
            passwordTextField.translatesAutoresizingMaskIntoConstraints = false
            passwordTextField.layer.borderColor = CGColor(red: 178.0 / 255.0, green: 178.0 / 255.0, blue: 178.0 / 255.0, alpha: 1.0)
            passwordTextField.layer.borderWidth = 1
            passwordTextField.setLeftPaddingPoints(10)
            view.addSubview(passwordTextField)
            
            let mainInfoStackView = UIStackView(arrangedSubviews: [signInLabel, emailTextField, passwordTextField])
            mainInfoStackView.axis = .vertical
            mainInfoStackView.spacing = 10
            mainInfoStackView.translatesAutoresizingMaskIntoConstraints = false
            mainInfoStackView.distribution = .fillEqually
            mainInfoStackView.alignment = .fill
            signInLabel.isHidden = false
            emailTextField.isHidden = false
            passwordTextField.isHidden = false
            view.addSubview(mainInfoStackView)
            
            let forgotPasswordButton = UIButton(type: .system)
            forgotPasswordButton.setTitle("Forgot Your Password?", for: .normal)
            forgotPasswordButton.contentHorizontalAlignment = .right
            forgotPasswordButton.setTitleColor(UIColor(red: 95.0/255.0, green: 95.0/255.0, blue: 95.0/255.0, alpha: 1.0), for: .normal)
            forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(forgotPasswordButton)
            
            signInButton.setTitle("Sign In", for: .normal)
            signInButton.setTitleColor(.white, for: .normal)
            signInButton.backgroundColor = UIColor(red: 34.0/255.0, green: 87.0/255.0, blue: 122.0/255.0, alpha: 1.0)
            signInButton.layer.cornerRadius = 25
            signInButton.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(signInButton)
        
            
            let orLabel = UILabel()
            orLabel.text = "Or"
            orLabel.textColor = UIColor(red: 95.0/255.0, green: 95.0/255.0, blue: 95.0/255.0, alpha: 1.0)
            orLabel.textAlignment = .center
            orLabel.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(orLabel)
            
            let leftSeparatorView = UIView()
            leftSeparatorView.backgroundColor = UIColor(red: 95.0/255.0, green: 95.0/255.0, blue: 95.0/255.0, alpha: 1.0)
            leftSeparatorView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(leftSeparatorView)
            
            let rightseparatorView = UIView()
            rightseparatorView.backgroundColor = UIColor(red: 95.0/255.0, green: 95.0/255.0, blue: 95.0/255.0, alpha: 1.0)
            rightseparatorView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(rightseparatorView)
            
            let signUpButton = UIButton(type: .system)
            signUpButton.translatesAutoresizingMaskIntoConstraints = false
            
            let normalText = "Don't have an account? "
            let coloredText = "Sign Up"
            
            let attributedString = NSMutableAttributedString(string: normalText, attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 95.0/255.0, green: 95.0/255.0, blue: 95.0/255.0, alpha: 1.0)])
            
            let coloredAttributedString = NSAttributedString(string: coloredText, attributes: [
                NSAttributedString.Key.foregroundColor: UIColor(red: 34.0 / 255.0, green: 87.0 / 255.0, blue: 122.0 / 255.0, alpha: 1.0),
                NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
            ])
            
            attributedString.append(coloredAttributedString)
            signUpButton.setAttributedTitle(attributedString, for: .normal)
            
            signUpButton.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(signUpButton)
            
            let googleButton = UIButton(type: .custom)
            googleButton.setImage(UIImage(named: "google.logo"), for: .normal)
            googleButton.translatesAutoresizingMaskIntoConstraints = false
            googleButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
            googleButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
            googleButton.layer.cornerRadius = 30
            view.addSubview(googleButton)
            
            let facebookButton = UIButton(type: .custom)
            facebookButton.setImage(UIImage(named: "facebook.logo"), for: .normal)
            facebookButton.translatesAutoresizingMaskIntoConstraints = false
            facebookButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
            facebookButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
            facebookButton.layer.cornerRadius = 30
            view.addSubview(facebookButton)
            
            let linkedinButton = UIButton(type: .custom)
            linkedinButton.setImage(UIImage(named: "linkedin.logo"), for: .normal)
            linkedinButton.translatesAutoresizingMaskIntoConstraints = false
            linkedinButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
            linkedinButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
            linkedinButton.layer.cornerRadius = 30
            view.addSubview(linkedinButton)
            
            let socialStackView = UIStackView(arrangedSubviews: [googleButton, facebookButton, linkedinButton])
            socialStackView.axis = .horizontal
            socialStackView.spacing = 10
            socialStackView.distribution = .fillEqually
            socialStackView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(socialStackView)
            
            
            linkedinButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
            linkedinButton.layer.cornerRadius = 30
            view.addSubview(linkedinButton)
            
            let socialMediaStackView = UIStackView(arrangedSubviews: [googleButton, facebookButton, linkedinButton])
            socialMediaStackView.axis = .horizontal
            socialMediaStackView.distribution = .equalSpacing
            socialMediaStackView.spacing = 3
            socialMediaStackView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(socialMediaStackView)
            
            
            NSLayoutConstraint.activate([
                curlyDesignView.topAnchor.constraint(equalTo: view.topAnchor),
                curlyDesignView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                curlyDesignView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                curlyDesignView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/3),
                
                userImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                userImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -view.bounds.height / 3.5),
                userImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.2 / 3.0),
                userImageView.heightAnchor.constraint(equalTo: userImageView.widthAnchor),
                
                mainInfoStackView.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 15),
                mainInfoStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                mainInfoStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
                signInLabel.heightAnchor.constraint(equalToConstant: 50),
                emailTextField.heightAnchor.constraint(equalToConstant: 50),
                passwordTextField.heightAnchor.constraint(equalToConstant: 50),
                
                forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15),
                forgotPasswordButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                forgotPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
                
                signInButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 25),
                signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
                signInButton.heightAnchor.constraint(equalToConstant: 50),
                
                orLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 25),
                orLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                leftSeparatorView.centerYAnchor.constraint(equalTo: orLabel.centerYAnchor),
                leftSeparatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding * 4/3),
                leftSeparatorView.trailingAnchor.constraint(equalTo: orLabel.leadingAnchor, constant: -10),
                leftSeparatorView.heightAnchor.constraint(equalToConstant: 1),
                
                rightseparatorView.centerYAnchor.constraint(equalTo: orLabel.centerYAnchor),
                rightseparatorView.leadingAnchor.constraint(equalTo: orLabel.trailingAnchor, constant: 10),
                rightseparatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding * 4/3),
                rightseparatorView.heightAnchor.constraint(equalToConstant: 1),
                
                socialMediaStackView.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 20),
                socialMediaStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 130),
                signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
            
            view.layoutIfNeeded()
            userImageView.layer.cornerRadius = userImageView.bounds.width / 2.0
        }
    }
    
    
    @objc func signInTapped() {
        guard let username = emailTextField.text, !username.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            print("Username or password field is empty.")
            return
        }
        
        let homePageViewController = HomePageViewController()
        navigationController?.pushViewController(homePageViewController, animated: true)
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}

extension SignInViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            if textView == emailTextField {
                textView.text = "Email"
            } else if textView == emailTextField {
                textView.text = "Password"
            }
            textView.textColor = UIColor.lightGray
        }
    }
}



