//
//  MainVC.swift
//  Meet the Member
//
//  Created by Michael Lin on 1/18/21.
//

import Foundation
import UIKit

class MainVC: UIViewController {
    
    let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
    
    let imageView: UIImageView = {
        let view = UIImageView()
        
        // TODO: Your customization
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let buttons: [UIButton] = {
        // Creates 4 buttons, each representing a choice
        return (0..<4).map { index in
            let button = UIButton()
            
            // TODO: Your customization
            
            button.translatesAutoresizingMaskIntoConstraints = false
            
            return button
        }
    }()
    
    // TODO: Add other UI components, instance properties and methods
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        // If you don't like the default presentation style,
        // you can change it to full screen too! This way you
        // will have manually to call
        // dismiss(animated: true, completion: nil) in order
        // to go back.
        //
        // modalPresentationStyle = .fullScreen
        
        // TODO: Add UI components to subview, setup constraints
    }
    
    // What's the difference between viewDidLoad() and
    // viewWillAppear()? What about viewDidAppear()?
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    @objc func timerCallback() {
        // TODO: What behavior you want you one-second time to have?
        // What information you need to keep tract of?
    }
    
    @objc func didTapStats(_ sender: UIButton) {
        let vc = StatsVC()
        
        // TODO: What is the information you need to pass
        // into StatsVC
        
        present(vc, animated: true, completion: nil)
    }
}
