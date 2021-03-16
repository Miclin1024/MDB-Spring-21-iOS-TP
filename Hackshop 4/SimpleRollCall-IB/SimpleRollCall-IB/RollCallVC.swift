//
//  RollCallVC.swift
//  SimpleRollCall-IB
//
//  Created by Michael Lin on 3/8/21.
//

import Foundation
import UIKit

class RollCallVC: UIViewController {
    let names = ["Neel", "Jennessa", "Suraj", "Rithwik", "Eileen", "Jacob", "Harrison"]
    
    // A variable that stores the names that are yet to be called.
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var absentButton: UIButton! {
        didSet {
            absentButton.layer.cornerRadius = absentButton.frame.height / 2
        }
    }
    
    @IBOutlet weak var presentButton: UIButton! {
        didSet {
            presentButton.layer.cornerRadius = presentButton.frame.height / 2
        }
    }
    
    var namesToCall: [String] = []
    
    var presentNames: [String] = []
    var absentNames: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        namesToCall = names.shuffled()
        
        nameLabel.text = namesToCall.popLast()
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        guard let sender = sender as? UIButton else { return }
        if sender.tag == 0 {
            presentNames.append(nameLabel.text!)
        } else {
            absentNames.append(nameLabel.text!)
        }
        
        guard let nextName = namesToCall.popLast() else {
            presentResult()
            return
        }
        
        // UIView.animate() is incredibly versatile. You can use it to animate
        // opacity, color, and even constraints! Here we use it to create a simple
        // fade in fade out animation.
        UIView.animate(withDuration: 0.3, animations: {
            self.nameLabel.alpha = 0
        }, completion: { _ in
            self.nameLabel.text = nextName
            UIView.animate(withDuration: 0.3, animations: {
                self.nameLabel.alpha = 1
            })
        })
    }
    
    func presentResult() {
        performSegue(withIdentifier: "toResult", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toResult", let vc = segue.destination as? ResultVC else { return }
        vc.data = ""
    }
}
