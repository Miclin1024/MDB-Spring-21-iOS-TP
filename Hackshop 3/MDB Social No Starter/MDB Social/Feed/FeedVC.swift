//
//  FeedVC.swift
//  MDB Social
//
//  Created by Michael Lin on 2/25/21.
//

import UIKit

class FeedVC: UIViewController {
    
    private let signOutButton: UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        btn.backgroundColor = .primary
        btn.setImage(UIImage(systemName: "xmark"), for: .normal)
        let config = UIImage.SymbolConfiguration(font: .systemFont(ofSize: 30, weight: .medium))
        btn.setPreferredSymbolConfiguration(config, forImageIn: .normal)
        btn.tintColor = .white
        btn.layer.cornerRadius = 50
        
        return btn
    }()
    
    override func viewDidLoad() {
        view.addSubview(signOutButton)
        
        signOutButton.center = view.center
        signOutButton.addTarget(self, action: #selector(didTapSignOut(_:)), for: .touchUpInside)
    }
    
    @objc func didTapSignOut(_ sender: UIButton) {

    }
}
