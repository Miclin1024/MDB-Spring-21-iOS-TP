//
//  StartVC.swift
//  Meet the Member
//
//  Created by Michael Lin on 1/18/21.
//

import UIKit

class StartVC: UIViewController {
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        
        // == UIColor.darkGray
        label.textColor = .darkGray
        
        label.text = "Meet the Member"
        
        // == NSTextAlignment(expected type).center
        label.textAlignment = .center
        
        // == UIFont.systemFont(ofSize: 27, UIFont.weight.medium)
        label.font = .systemFont(ofSize: 27, weight: .medium)
        
        // Must have if you are using constraints
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private let startButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("Start", for: .normal)
        
        button.setTitleColor(.blue, for: .normal)
        
        // TODO: Your customization
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white // == UIColor(expected type).white
        
        // Add our label as a subview of the root UIView of WelcomeVC
        // -------view hierarchy--------
        //
        // WelcomeVC -> View (root)
        //               |- welcomeLabel
        //               \
        //
        // -----------------------------
        view.addSubview(welcomeLabel)
        // And add the constraints
        // (0, 0)
        //  ___________________ -->> x
        // /         |         \
        // |         | 100pt   |
        // | 50pt    |         |
        // |-----| label |-----|
        // |              -50pt
        // |
        // y
        NSLayoutConstraint.activate([
            // You can use the view.topAnchor. But it's different, why?
            // https://developer.apple.com/documentation/uikit/uiview/positioning_content_relative_to_the_safe_area
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            
            // For your understanding: welcomeLabel.leadingAnchor = view.leadingAnchor + 50
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            
            // welcomeLabel.trailingAnchor = view.trailingAnchor - 50
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
        
        // Again, add the start button as a subview of the root UIView of WelcomeVC
        // -------view hierarchy--------
        //
        // WelcomeVC -> View (root)
        //               |- welcomeLabel
        //               |- startButton
        //               \
        //
        // -----------------------------
        view.addSubview(startButton)
        
        NSLayoutConstraint.activate([
            // TODO: Add the constraints for the startButton
        ])
        
        // Add the callback to our startButton
        startButton.addTarget(self, action: #selector(didTapStart(_:)), for: .touchUpInside)
    }
    
    // Trivia: Why do we need @objc here
    // https://www.hackingwithswift.com/example-code/language/what-is-the-objc-attribute
    @objc func didTapStart(_ sender: UIButton) {
        // Present the MainVC
        present(MainVC(), animated: true, completion: nil)
    }
}

