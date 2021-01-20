//
//  Utils.swift
//  Meet the Member
//
//  Created by Michael Lin on 1/18/21.
//

import Foundation
import UIKit

class QuestionProvider {
    
    // This pattern is called a *singleton*, you can see it at a lot of places in swift!
    // You can access the instance properties and methods through ImageProvider.shared...
    static let shared = QuestionProvider()
    
    // This property is *private*, meaning that it can only be access(read&write) from within the class.
    private let names = ["Aady Pillai", "Aarushi Agrawal", "Aayush Tyagi", "Abhinav Kejriwal", "Afees Tiamiyu", "Ajay Merchia", "Anand Chandra", "Andres Medrano", "Andrew Santoso", "Anika Bagga", "Anik Gupta", "Anita Shen", "Anjali Thakrar", "Anmol Parande", "Ashwin Aggarwal", "Ashwin Kumar", "Athena Leong", "Austin Davis", "Ayush Kumar", "Brandon David", "Candace Chiang", "Candice Ye","Charles Yang", "Colin Zhou", "Daniel Andrews", "Divya Tadimeti", "DoHyun Cheon", "Eric Kong", "Ethan Wong", "Francis Chalissery", "Geo Morales", "Ian Shen", "Imran Khaliq", "Izzie Lau", "Jacqueline Zhang", "James Jung", "Japjot Singh", "Joey Hejna", "Juliet Kim", "Kanyes Thaker", "Karen Alarcon", "Katniss Lee", "Kayli Jiang", "Kiana Go", "Maggie Yi", "Matthew Locayo", "Max Emerling", "Max Miranda", "Melanie Cooray", "Michael Lin", "Michelle Mao", "Mohit Katyal", "Mudabbir Khan", "Natasha Wong", "Neha Nagabothu", "Nicholas Wang", "Nikhar Arora", "Noah Pepper", "Olivia Li", "Patrick Yin", "Paul Shao", "Radhika Dhomse", "Rini Vasan", "Sai Yandapalli", "Salman Husain", "Samantha Lee", "Shaina Chen", "Sharie Wang", "Shaurya Sanghvi", "Shiv Kushwah", "Shomil Jain", "Shubha Jagannatha", "Shubham Gupta", "Simran Regmi", "Sinjon Santos", "Srujay Korlakunta", "Stephen Jayakar", "Tyler Reinecke", "Vaibhav Gattani", "Varun Jhunjhunwalla", "Victor Sun", "Vidya Ravikumar", "Vineeth Yeevani", "Will Oakley", "Will Vavrik", "Xin Yi Chen", "Yatin Agarwal"]
    
    // Private(set) means the property is read-only from the outside.
    private(set) var namesToDisplay: [String]
    
    init() {
        namesToDisplay = names.shuffled()
    }
    
    // Return an question struct using the name at the bottom
    // of the shuffled namesToDisplay list, and remove the name
    // from the list. Return nil if the list is already empty,
    // or if the image with the name cannot be found.
    //
    // Why not go from the beginning you might ask. The answer is here: https://www.hackingwithswift.com/example-code/language/how-to-remove-the-first-or-last-item-from-an-array
    func getNextQuestion() -> Question? {
        if let name = namesToDisplay.popLast(), let image = UIImage(named: name) {
            // Use a set so that we don't randomly add the same names.
            var choices = Set<String>()
            choices.insert(name)
            while choices.count < 4 {
                choices.insert(names.randomElement()!)
            }
            
            return Question(image: image, answer: name, choices: Array(choices).shuffled())
        }
        return nil
    }
    
    func reset() {
        namesToDisplay = names.shuffled()
    }
    
    struct Question {
        let image: UIImage
        
        let answer: String
        
        let choices: [String]
    }
}
