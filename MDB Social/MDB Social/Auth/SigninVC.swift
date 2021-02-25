//
//  SigninVC.swift
//  MDB Social
//
//  Created by Michael Lin on 2/25/21.
//

import UIKit

class SigninVC: UIViewController {
    
    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.spacing = 25

        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let emailTextField: AuthTextField = {
        let tf = AuthTextField(title: "Email")
        
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private let passwordTextField: AuthTextField = {
        let tf = AuthTextField(title: "Password")
        
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(stack)
        stack.addArrangedSubview(emailTextField)
        stack.addArrangedSubview(passwordTextField)
        
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50)
        ])
    }


}

